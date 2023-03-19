package com.aidex.system.dto;

import com.aidex.system.domain.vo.PatientBasicInfo;
import com.aidex.system.entity.PowerAccount;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@ApiModel(value = "UserInfoDTO", description = "用户信息封装对象")
@Data
public class UserInfoDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("账号信息")
    private PowerAccount account;

    @ApiModelProperty("用户信息")
    private PatientBasicInfo basicInfo;

}
