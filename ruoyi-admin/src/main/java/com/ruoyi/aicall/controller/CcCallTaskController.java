package com.ruoyi.aicall.controller;

import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.*;

import com.ruoyi.aicall.domain.CcCallPhone;
import com.ruoyi.aicall.model.CallTaskStatModel;
import com.ruoyi.aicall.service.ICcCallPhoneService;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.ExceptionUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.uuid.UuidGenerator;
import com.ruoyi.framework.web.domain.server.Sys;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.aicall.domain.CcCallTask;
import com.ruoyi.aicall.service.ICcCallTaskService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;

/**
 * 外呼任务Controller
 * 
 * @author ruoyi
 * @date 2025-05-29
 */
@Controller
@RequestMapping("/aicall/callTask")
@Slf4j
public class CcCallTaskController extends BaseController
{
    private String prefix = "aicall/callTask";

    @Autowired
    private ICcCallTaskService ccCallTaskService;

    @Autowired
    private ICcCallPhoneService ccCallPhoneService;

    @RequiresPermissions("aicall:callTask:view")
    @GetMapping()
    public String callTask()
    {
        return prefix + "/callTask";
    }

    /**
     * 查询外呼任务列表
     */
    @RequiresPermissions("aicall:callTask:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CcCallTask ccCallTask)
    {
        startPage();
        Map<String, Object> params = ccCallTask.getParams();
        if (null != params.get("createTimeStart")
                && !"".equals(params.get("createTimeStart"))) {
            params.put("createTimeStart", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("createTimeStart")).getTime());
        }
        if (null != params.get("createTimeEnd")
                && !"".equals(params.get("createTimeEnd"))) {
            params.put("createTimeEnd", DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", (String)params.get("createTimeEnd")).getTime());
        }
        ccCallTask.setParams(params);
        List<CcCallTask> list = ccCallTaskService.selectCcCallTaskList(ccCallTask);
        TableDataInfo tableDataInfo = getDataTable(list);
        List<CcCallTask> records = (List<CcCallTask>) tableDataInfo.getRows();
        for (CcCallTask data: records){
            CallTaskStatModel statModel = ccCallPhoneService.statByBatchId(data.getBatchId());
            data.setPhoneCount(statModel.getPhoneCount());
            data.setCallCount(statModel.getCallCount());
            data.setNoCallCount(statModel.getPhoneCount() - statModel.getCallCount());
            data.setConnectCount(statModel.getConnectCount());
            data.setNoConnectCount(statModel.getCallCount() - statModel.getConnectCount());
            if (data.getCallCount() > 0) {
                data.setRealConnectRate(data.getConnectCount()*1.0/data.getCallCount());
            } else {
                data.setRealConnectRate(0.0);
            }
        }
        tableDataInfo.setRows(records);
        return tableDataInfo;
    }

    /**
     * 导出外呼任务列表
     */
    @RequiresPermissions("aicall:callTask:export")
    @Log(title = "外呼任务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CcCallTask ccCallTask)
    {
        List<CcCallTask> list = ccCallTaskService.selectCcCallTaskList(ccCallTask);
        ExcelUtil<CcCallTask> util = new ExcelUtil<CcCallTask>(CcCallTask.class);
        return util.exportExcel(list, "外呼任务数据");
    }

    /**
     * 新增外呼任务
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存外呼任务
     */
    @RequiresPermissions("aicall:callTask:add")
    @Log(title = "外呼任务", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CcCallTask ccCallTask)
    {
        // 外呼速率=1/接通率
        if (null != ccCallTask.getConntectRate() && ccCallTask.getConntectRate() > 0) {
            ccCallTask.setRate(ccCallTask.getConntectRate()/100.0);
        }
        ccCallTask.setCreatetime(System.currentTimeMillis());
        return toAjax(ccCallTaskService.insertCcCallTask(ccCallTask));
    }

    /**
     * 修改外呼任务
     */
    @RequiresPermissions("aicall:callTask:edit")
    @GetMapping("/edit/{batchId}")
    public String edit(@PathVariable("batchId") Long batchId, ModelMap mmap)
    {
        CcCallTask ccCallTask = ccCallTaskService.selectCcCallTaskByBatchId(batchId);
        if (null != ccCallTask.getRate() && ccCallTask.getRate() > 0) {
            ccCallTask.setConntectRate((Double.valueOf(ccCallTask.getRate()*100.0).intValue()));
        }
        mmap.put("ccCallTask", ccCallTask);
        return prefix + "/edit";
    }

    /**
     * 修改保存外呼任务
     */
    @RequiresPermissions("aicall:callTask:edit")
    @Log(title = "外呼任务", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CcCallTask ccCallTask)
    {
        return toAjax(ccCallTaskService.updateCcCallTask(ccCallTask));
    }

    /**
     * 删除外呼任务
     */
    @RequiresPermissions("aicall:callTask:remove")
    @Log(title = "外呼任务", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ccCallTaskService.deleteCcCallTaskByBatchIds(ids));
    }


    /**
     * 启动外呼任务
     */
    @RequiresPermissions("aicall:callTask:start")
    @Log(title = "启动任务", businessType = BusinessType.UPDATE)
    @PostMapping( "/start/{batchId}")
    @ResponseBody
    public AjaxResult start(@PathVariable("batchId") Long batchId)
    {
        CcCallTask ccCallTask = ccCallTaskService.selectCcCallTaskByBatchId(batchId);
        ccCallTask.setIfcall(1);
        ccCallTask.setExecuting(0L);
        ccCallTaskService.updateCcCallTask(ccCallTask);
        return toAjax(1);
    }


    /**
     * 暂停外呼任务
     */
    @RequiresPermissions("aicall:callTask:pause")
    @Log(title = "暂停任务", businessType = BusinessType.UPDATE)
    @PostMapping( "/pause/{batchId}")
    @ResponseBody
    public AjaxResult pause(@PathVariable("batchId") Long batchId)
    {
        CcCallTask ccCallTask = ccCallTaskService.selectCcCallTaskByBatchId(batchId);
        ccCallTask.setIfcall(0);
        ccCallTask.setExecuting(0L);
        ccCallTaskService.updateCcCallTask(ccCallTask);
        return toAjax(1);
    }

    // 提供模板文件下载接口
    @GetMapping("/downloadTemplate")
    public ResponseEntity<Resource> downloadTemplate(@RequestParam (value = "taskType") Integer taskType) {
        String templateName = "AICallList.xlsx";
        if (null == taskType) {
            taskType = 1;
        } else if (taskType == 0) {
            templateName = "PredictiveCallList.xlsx";
        } else if (taskType == 2) {
            templateName = "ReminderCallList.xlsx";
        }
        // 模板文件路径
        String filePath = "static/templates/" + templateName; // 静态资源路径
        ClassPathResource resource = new ClassPathResource(filePath);

        // 检查文件是否存在
        if (!resource.exists()) {
            throw new RuntimeException("模板文件不存在！");
        }

        // 设置响应头
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + templateName);

        // 返回文件
        return ResponseEntity.ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(resource);
    }

    /**
     * 导入外呼任务数据
     */
    @RequiresPermissions("aicall:callTask:import")
    @Log(title = "外呼任务", businessType = BusinessType.IMPORT)
    @PostMapping("/importFile")
    @ResponseBody
    public AjaxResult importFile(@RequestParam("file") MultipartFile file, @RequestParam("batchId") Long batchId) throws Exception {
        if (file == null || file.isEmpty()) {
            return AjaxResult.error("上传文件不能为空！");
        }
        CcCallTask ccCallTask = ccCallTaskService.selectCcCallTaskByBatchId(batchId);
        try (InputStream inputStream = file.getInputStream()) {
            // 使用 Apache POI 解析 Excel 文件
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet sheet = workbook.getSheetAt(0); // 获取第一个工作表
            Integer rowCount = sheet.getLastRowNum();
            log.info("累计数据行数：{}", rowCount);
            List<CcCallPhone> phoneList = new ArrayList<>();
            Map<String, Integer> phoneMap = new HashMap<>();
            // 首行
            Row row0 = sheet.getRow(0);
            Integer idxCustName = -1;
            Integer idxPhoneNum = -1;
            Integer idxTtsText = -1;
            for (int i = 0; i < row0.getPhysicalNumberOfCells(); i++) {
                Cell cell = row0.getCell(i);
                if (null != cell) {
                    String value = getCellValue(cell);
                    if (StringUtils.isNotEmpty(value)) {
                        if ("客户姓名".equals(value)) {
                            idxCustName = i;
                        } else if ("手机号码".equals(value)) {
                            idxPhoneNum = i;
                        } else if ("通知内容".equals(value)) {
                            idxTtsText = i;
                        }
                    }
                }
            }
            // 遍历工作表中的每一行
            Integer rowNum = 0;
            for (int i = 1; i <= rowCount; i++) {
                Row row = sheet.getRow(i);
                rowNum ++;
                String phoneNumber = getCellValue(row.getCell(idxPhoneNum)); // 手机号码列
                String custName = "";
                if (idxCustName >= 0) {
                    custName = getCellValue(row.getCell(idxCustName)); // 客户姓名列
                }
                String ttsText = "";
                if (idxTtsText >= 0) {
                    ttsText = getCellValue(row.getCell(idxTtsText)); // 通知内容列
                }
                log.info("解析第{}行获取到的数据为,phoneNumber:{}, custName:{}", rowNum, phoneNumber, custName);
                if (StringUtils.isNotEmpty(phoneNumber)) {
                    phoneNumber = phoneNumber.replace(".00", "").replace(".0", "").replace("-", "").replace(" ", "");
                    if (phoneNumber.matches("\\d+")) {
                        if (null == phoneMap.get(phoneNumber)) {
                            CcCallPhone callPhone = buildPhone(ccCallTask);
                            callPhone.setTelephone(phoneNumber);
                            callPhone.setCustName(custName);
                            callPhone.setTtsText(ttsText);
                            phoneList.add(callPhone);
                            phoneMap.put(phoneNumber, rowNum);
                        } else {
                            log.info("第{}行数据“{}”与第{}行重复，排除", rowNum, phoneNumber, phoneMap.get(phoneNumber));
                        }
                    } else {
                        log.info("第{}行数据“{}”不是手机号码，排除", rowNum, phoneNumber);
                    }
                }
            }

            // 解析后的手机号码入库
            if (phoneList.size() > 0) {
                ccCallPhoneService.batchInsertCcCallPhone(phoneList);
            }

            return AjaxResult.success("导入成功！共解析 " + phoneList.size() + " 个手机号码。");
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("导入失败：" + e.getMessage());
        }
    }

    private String getCellValue(Cell cell) {
        String cellValue = "";
        if (cell != null) {
            // 根据单元格类型获取值
            try {
                switch (cell.getCellType()) {
                    case STRING:
                        cellValue = cell.getStringCellValue();
                        break;
                    case NUMERIC:
                        // 使用 BigDecimal 避免科学计数法并去掉多余的 .00
                        BigDecimal numericValue = new BigDecimal(cell.getNumericCellValue());
                        cellValue = numericValue.stripTrailingZeros().toPlainString();
                        break;
                    default:
                        cellValue = "";
                }
            } catch (Exception e) {
                log.error("解析数据异常{}", ExceptionUtil.getExceptionMessage(e));
            }
        }
        return cellValue;
    }

    private CcCallPhone buildPhone(CcCallTask ccCallTask) {

        CcCallPhone callPhone = new CcCallPhone();
        callPhone.setId(UuidGenerator.GetOneUuid());
        callPhone.setGroupId("1");
        callPhone.setBatchId(ccCallTask.getBatchId());
        callPhone.setCreatetime(new Date().getTime());
        callPhone.setCallstatus(0);
        callPhone.setCalloutTime(0L);
        callPhone.setCallcount(0);
        callPhone.setCallEndTime(0L);
        callPhone.setTimeLen(0L);
        callPhone.setValidTimeLen(0L);
        callPhone.setUuid("");
        callPhone.setConnectedTime(0L);
        callPhone.setHangupCause("");
        callPhone.setAnsweredTime(0L);
        callPhone.setDialogue("");
        callPhone.setWavfile("");
        callPhone.setRecordServerUrl("");
        callPhone.setBizJson("");
        callPhone.setDialogueCount(0L);
        callPhone.setAcdOpnum("");
        callPhone.setAcdQueueTime(0L);
        callPhone.setAcdWaitTime(0);
        return callPhone;
    }
}
