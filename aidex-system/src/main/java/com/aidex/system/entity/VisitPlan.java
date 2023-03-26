package com.aidex.system.entity;

import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.Date;

public class VisitPlan implements Serializable {
    /**
     * 出诊编号
     *
     * @mbg.generated
     */
    @ApiModelProperty(value = "出诊编号")
    private Long id;

    /**
     * 诊室编号
     *
     * @mbg.generated
     */
    @ApiModelProperty(value = "诊室编号")
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

    /**
     * 创建时间
     *
     * @mbg.generated
     */
    @ApiModelProperty(value = "创建时间")
    private Date gmtCreate;

    /**
     * 更新时间
     *
     * @mbg.generated
     */
    @ApiModelProperty(value = "更新时间")
    private Date gmtModified;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long clinicId) {
        this.deptId = clinicId;
    }

    public Long getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Long doctorId) {
        this.doctorId = doctorId;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", deptId=").append(deptId);
        sb.append(", doctorId=").append(doctorId);
        sb.append(", time=").append(time);
        sb.append(", day=").append(day);
        sb.append(", gmtCreate=").append(gmtCreate);
        sb.append(", gmtModified=").append(gmtModified);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}