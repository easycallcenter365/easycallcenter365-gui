package com.ruoyi.cc.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.cc.domain.FsVariables;
import com.ruoyi.cc.mapper.FsVariablesMapper;
import com.ruoyi.cc.service.IFsVariablesService;
import com.ruoyi.common.utils.MessageUtils;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * freeswitch配置文件可配置的参数
 */
@Service
public class FsVariablesServiceImpl implements IFsVariablesService {
    @Autowired
    private FsVariablesMapper fsVariablesMapper;

    @Override
    public JSONObject getFsVariablesByCat(Integer cat) {
        JSONObject fsVars = new JSONObject();
        List<FsVariables> fsVariablesList = fsVariablesMapper.getFsVariablesList(new FsVariables().setCat(cat));
        for (FsVariables fsVariables: fsVariablesList) {
            // 别名国际化展示
            String varFieldAlias = fsVariables.getVarFieldAlias();
            if(StringUtils.isNotEmpty(varFieldAlias)) {
                varFieldAlias = MessageUtils.message("_fs_variables." + fsVariables.getVarFieldName());
                if (StringUtils.isBlank(varFieldAlias)) {
                    varFieldAlias = fsVariables.getVarFieldAlias();
                }
            }
            fsVars.put(fsVariables.getVarFieldName(), varFieldAlias);
        }
        return fsVars;
    }
}
