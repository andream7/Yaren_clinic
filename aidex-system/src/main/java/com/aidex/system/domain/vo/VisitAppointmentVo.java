package com.aidex.system.domain.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@ApiModel(value = "VisitAppointmentVo", description = "预约记录情况")
@Data
public class VisitAppointmentVo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("预约记录编号")
    private Long appointmentId;


    @ApiModelProperty(value = "诊室名称")
    private String clinicName;

    @ApiModelProperty(value = "医生ID")
    private int doctorId;

    @ApiModelProperty(value = "医生名称")
    private String doctorName;

    @ApiModelProperty(value = "患者名称")
    private String patientName;

    @ApiModelProperty(value = "时间段 1：上午，2：下午")
    private Integer time;

    @ApiModelProperty(value = "出诊日期")
    private Date day;

    @ApiModelProperty(value = "预约状态 0：未开始，1：未按时就诊，2：取消预约挂号，3：已完成")
    private Integer status;
}
