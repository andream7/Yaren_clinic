package com.aidex.system.domain.vo;

import lombok.Data;

import java.sql.Date;

@Data
public class VisitPlanVo {
    private long doctorId;
    private String doctorName;
    private String deptName;
    private int sources;
    private int received;
    private int period;
    private Date day;
}
