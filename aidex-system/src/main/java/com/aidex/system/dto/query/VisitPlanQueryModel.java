package com.aidex.system.dto.query;

import lombok.Data;

import java.sql.Date;

@Data
public class VisitPlanQueryModel {
    private long doctorId;
    private Date begin;
    private Date end;

}
