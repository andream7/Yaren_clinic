package com.aidex.system.service;

import com.aidex.system.domain.vo.PatientBasicInfo;
import com.aidex.system.dto.param.UserRegisterParam;

import java.util.List;

/**
 * 普通用户基础信息接口
 *
 */

public interface IPatientService {

//    /**
//     * 发送注册短信
//     *
//     * @param phone 手机号码
//     * @return 是否成功
//     */
//    boolean sendMessage(String phone);
//
//    /**
//     * 校验短信验证码
//     *
//     * @param phone 手机号
//     * @param code  验证码
//     * @return 是否正确
//     */
//    boolean verifyCode(String phone, String code);
//
    /**
     * 创建普通用户信息
     *
     * @param param 普通用户信息参数
     * @return 是否成功
     */
    boolean insert(UserRegisterParam param);

    /**
     * 更新普通用户信息
     *
     * @param id    用户编号
     * @param param 普通用户信息参数
     * @return 是否成功
     */
    boolean update(Long id, PatientBasicInfo param);

    /**
     * 删除普通用户信息
     *
     * @param id 用户编号
     * @return 是否成功
     */
    boolean delete(Long id);

    /**
     * 获取普通用户信息
     *
     * @param id 用户编号
     * @return 普通用户信息
     */
    PatientBasicInfo getById(Long id);

    /**
     * 通过关键词，查找用户信息列表
     *
     * @param name     用户名
     * @param phone    手机号
     * @param pageNum  第几页
     * @param pageSize 页大小
     * @return 用户信息列表
     */
    List<PatientBasicInfo> list(String name, String phone, Integer pageNum, Integer pageSize);

    /**
     * 判断用户信息是否存在
     *
     * @param id 用户编号
     * @return 是否存在
     */
    boolean count(Long id);

    boolean countByPhoneId(String phone);
}
