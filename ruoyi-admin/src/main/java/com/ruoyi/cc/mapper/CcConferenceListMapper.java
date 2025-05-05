package com.ruoyi.cc.mapper;

import java.util.List;
import com.ruoyi.cc.domain.CcConferenceList;

/**
 * ConferenceListMapper接口
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public interface CcConferenceListMapper 
{
    /**
     * 查询ConferenceList
     * 
     * @param id ConferenceList主键
     * @return ConferenceList
     */
    public CcConferenceList selectCcConferenceListById(Long id);

    /**
     * 查询ConferenceList列表
     * 
     * @param ccConferenceList ConferenceList
     * @return ConferenceList集合
     */
    public List<CcConferenceList> selectCcConferenceListList(CcConferenceList ccConferenceList);

    /**
     * 新增ConferenceList
     * 
     * @param ccConferenceList ConferenceList
     * @return 结果
     */
    public int insertCcConferenceList(CcConferenceList ccConferenceList);

    /**
     * 修改ConferenceList
     * 
     * @param ccConferenceList ConferenceList
     * @return 结果
     */
    public int updateCcConferenceList(CcConferenceList ccConferenceList);

    /**
     * 删除ConferenceList
     * 
     * @param id ConferenceList主键
     * @return 结果
     */
    public int deleteCcConferenceListById(Long id);

    /**
     * 批量删除ConferenceList
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCcConferenceListByIds(String[] ids);
}
