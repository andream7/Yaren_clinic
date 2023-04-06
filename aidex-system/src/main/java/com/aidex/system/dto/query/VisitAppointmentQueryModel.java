package com.aidex.system.dto.query;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

@ApiModel(value = "VisitAppointmentQueryModel", description = "出诊预约查询")
public class VisitAppointmentQueryModel extends BaseQueryModel{

    @ApiModelProperty(value = "诊室名称")
    private String clinicName;

    @ApiModelProperty(value = "医生名称")
    private String doctorName;

    @ApiModelProperty(value = "患者名称")
    private String name;

    @ApiModelProperty(value = "时间段 1：上午，2：下午")
    private Integer time;

    @ApiModelProperty(value = "出诊日期")
    private Date day;

    @ApiModelProperty(value = "预约状态 0：未开始，1：未按时就诊，2：取消预约挂号，3：已完成")
    private Integer status;
}
