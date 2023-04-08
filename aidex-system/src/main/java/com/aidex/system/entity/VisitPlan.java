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
    @ApiModelProperty(value = "号源数")
    private int sources;
    @ApiModelProperty(value = "接诊数")
    private int received;

    public int getSources() {
        return sources;
    }

    public void setSources(int sources) {
        this.sources = sources;
    }

    public int getReceived() {
        return received;
    }

    public void setReceived(int received) {
        this.received = received;
    }

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

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
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
        return getClass().getSimpleName() +
                " [" +
                "Hash = " + hashCode() +
                ", id=" + id +
                ", deptId=" + deptId +
                ", doctorId=" + doctorId +
                ", time=" + time +
                ", day=" + day +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                ", serialVersionUID=" + serialVersionUID +
                ", sources=" + sources +
                ", received=" + received +
                "]";
    }
}