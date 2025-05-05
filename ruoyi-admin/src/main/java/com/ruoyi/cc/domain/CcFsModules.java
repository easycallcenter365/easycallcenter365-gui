package com.ruoyi.cc.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * CcFsModules对象 cc_fs_modules
 * 
 * @author ruoyi
 * @date 2024-12-22
 */
public class CcFsModules extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 模块别名 */
    private String moduleLabel;

    /** 模块名称 */
    private String moduleName;

    /** 模块描述 */
    private String moduleDesc;

    /** 模块类别 */
    private Long catId;

    /** 是否启用模块; 1启用;  0禁用 */
    private Long moduleEnabled;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setModuleLabel(String moduleLabel) 
    {
        this.moduleLabel = moduleLabel;
    }

    public String getModuleLabel() 
    {
        return moduleLabel;
    }

    public void setModuleName(String moduleName) 
    {
        this.moduleName = moduleName;
    }

    public String getModuleName() 
    {
        return moduleName;
    }

    public void setModuleDesc(String moduleDesc) 
    {
        this.moduleDesc = moduleDesc;
    }

    public String getModuleDesc() 
    {
        return moduleDesc;
    }

    public void setCatId(Long catId) 
    {
        this.catId = catId;
    }

    public Long getCatId() 
    {
        return catId;
    }

    public void setModuleEnabled(Long moduleEnabled) 
    {
        this.moduleEnabled = moduleEnabled;
    }

    public Long getModuleEnabled() 
    {
        return moduleEnabled;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("moduleLabel", getModuleLabel())
            .append("moduleName", getModuleName())
            .append("moduleDesc", getModuleDesc())
            .append("catId", getCatId())
            .append("moduleEnabled", getModuleEnabled())
            .toString();
    }
}
