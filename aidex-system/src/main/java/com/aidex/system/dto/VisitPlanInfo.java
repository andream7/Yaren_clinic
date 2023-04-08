package com.aidex.system.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class VisitPlanInfo {
    private int num;
    private int time;
    private Date day;
    private long doctorId;
    private long deptId;
}
