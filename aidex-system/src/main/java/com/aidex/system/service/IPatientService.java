package com.aidex.system.service;

import com.aidex.common.core.domain.entity.Patient;
import com.aidex.common.core.service.BaseService;
import com.alibaba.fastjson2.JSONObject;
import com.github.pagehelper.PageInfo;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 用户 业务层
 *
 * @author ruoyi
 */
public interface IPatientService extends BaseService<Patient>
{

    @Override
    public PageInfo<Patient> findPage(Patient patient);

    /**
     * 校验用户是否允许操作
     *
     * @param user 用户信息
     */
    public void checkUserAllowed(Patient user);

    /**
     * 新增用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Transactional(readOnly = false)
    public boolean insertUser(Patient user);

    /**
     * 修改用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Transactional(readOnly = false)
    public boolean updateUser(Patient user);

    /**
     * 修改用户状态
     *
     * @param user 用户信息
     * @return 结果
     */
    @Transactional(readOnly = false)
    public boolean updateUserStatus(Patient user);

    /**
     * 修改用户基本信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Transactional(readOnly = false)
    public boolean updateUserProfile(Patient user);


    /**
     * 记录登录信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Transactional(readOnly = false)
    public boolean updateUserLoginInfo(Patient user);

    /**
     * 修改用户头像
     *
     * @param userName 用户名
     * @param avatar 头像地址
     * @return 结果
     */
    @Transactional(readOnly = false)
    public boolean updateUserAvatar(String userName, String avatar);

    /**
     * 重置用户密码
     *
     * @param userName 用户名
     * @param password 密码
     * @return 结果
     */
    public int resetUserPwd(String userName, String password);

    /**
     * 通过用户ID删除用户
     *
     * @param userId 用户ID
     * @return 结果
     */
    @Transactional(readOnly = false)
    public boolean deleteUserById(String userId);

    /**
     * 批量删除用户信息
     *
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    @Transactional(readOnly = false)
    public int deleteUserByIds(String[] userIds);


    public List<Map<String,Object>> getUserInfoByIds(JSONObject userIdsObj);

    /**
     * 注册用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    public boolean registerUser(Patient user);

    /**
     * 刷新缓存
     * @return 结果
     */
    public void refreshCache();

    /**
     * 加载参数缓存数据
     */
    public void loadingUserCache();

    /**
     * 校验用户是否有数据权限
     *
     * @param userId 用户id
     */
    public void checkUserDataScope(String userId);

}
