package com.aidex.system.domain.vo;

import lombok.Data;

import java.util.Date;

@Data
public class VisitAppointmentDetailVo {
    private long cardId;
    private String name;
    private String sex;
    private String phone;
    private String identityID;
    private Date birthday;

    private String doctorName;
    private String deptName;
    private int period;
    private Date day;
    private int status;

}
