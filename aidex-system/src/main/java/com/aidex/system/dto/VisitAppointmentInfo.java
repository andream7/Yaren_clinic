package com.aidex.system.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class VisitAppointmentInfo {
    private long id;
    private long card_id;
    private long doctor_id;
    private int dept_id;
    private Date day;
    private int status;
    private int time_period;
}
