package com.aidex.system.dto.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @author YuJian95  clj9509@163.com
 * @date 2020/3/1
 */

@ApiModel(value = "VisitPlanParam", description = "出诊计划参数")
@Data
public class VisitPlanParam {

    /**
     * 部门编号
     *
     * @mbg.generated
     */
    @ApiModelProperty(value = "部门编号")
    private Long deptId;

    /**
     * 医生编号
     *
     * @mbg.generated
     */
    @ApiModelProperty(value = "医生编号")
    private Long doctorId;

    /**
     * 时间段 1：上午，2：下午
     *
     * @mbg.generated
     */
    @ApiModelProperty(value = "时间段 1：上午，2：下午")
    private Integer time;

    /**
     * 出诊日期
     *
     * @mbg.generated
     */
    @ApiModelProperty(value = "出诊日期")
    private Date day;

}
