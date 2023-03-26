package com.aidex.system.service.impl;

import com.aidex.system.domain.vo.PatientBasicInfo;
import com.aidex.system.dto.param.UserRegisterParam;
import com.aidex.system.entity.UserBasicInfoExample;
import com.aidex.system.mapper.PatientBasicInfoMapper;
import com.aidex.system.service.IPatientService;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class PatientServiceImpl implements IPatientService {

    @Resource
    private PatientBasicInfoMapper patientInfoMapper;

    @Override
    public boolean update(Long id, PatientBasicInfo param) {

        PatientBasicInfo basicInfo = new PatientBasicInfo();

        BeanUtils.copyProperties(param, basicInfo);

        basicInfo.setId(id);
        basicInfo.setGmtModified(new Date());

        return patientInfoMapper.updateByPrimaryKeySelective(basicInfo) > 0;
    }

    @Override
    public boolean delete(Long id) {

        return patientInfoMapper.deleteByPrimaryKey(id) > 0;
    }

    /**
     * 获取普通用户信息
     *
     * @param phone 手机号
     * @return 普通用户信息
     */
    @Override
    public Optional<PatientBasicInfo> getOptionalByPhone(String phone) {

        UserBasicInfoExample example = new UserBasicInfoExample();

        example.createCriteria()
                .andPhoneEqualTo(phone);

        List<PatientBasicInfo> list = patientInfoMapper.selectByExample(example);

        return Optional.ofNullable(list.get(0));
    }

    /**
     * 通过关键词，查找用户信息列表
     *
     * @param name     用户名
     * @param phone    手机号
     * @param pageNum  第几页
     * @param pageSize 页大小
     * @return 用户信息列表
     */
    @Override
    public List<PatientBasicInfo> list(String name, String phone, Integer pageNum, Integer pageSize) {
        // 分页器
        PageHelper.startPage(pageNum, pageSize);

        UserBasicInfoExample example = new UserBasicInfoExample();

        UserBasicInfoExample.Criteria criteria = example.createCriteria();

        if (!StringUtils.isEmpty(name)) {
            criteria.andNameLike("%" + name + "%");
        }

        if (!StringUtils.isEmpty(phone)) {
            criteria.andPhoneLike("%" + name + "%");
        }

        return patientInfoMapper.selectByExample(example);
    }

    /**
     * 判断用户信息是否存在
     *
     * @param id 用户编号
     * @return 是否存在
     */
    @Override
    public boolean count(Long id) {

        UserBasicInfoExample example = new UserBasicInfoExample();

        example.createCriteria()
                .andIdEqualTo(id);

        return patientInfoMapper.countByExample(example) > 0;
    }

    /**
     * 判断用户信息是否存在
     *
     * @param phone 手机号
     * @return 是否存在
     */
    @Override
    public boolean countByPhone(String phone) {

        UserBasicInfoExample example = new UserBasicInfoExample();

        example.createCriteria()
                .andPhoneEqualTo(phone);

        return patientInfoMapper.countByExample(example) > 0;
    }

    /**
     * 创建普通用户信息
     *
     * @param param 普通用户信息参数
     * @return 是否成功
     */
    @Override
    public boolean insert(UserRegisterParam param) {

        PatientBasicInfo info = new PatientBasicInfo();

        BeanUtils.copyProperties(param, info);

        info.setGmtCreate(new Date());
        info.setGmtModified(new Date());

        return patientInfoMapper.insertSelective(info) > 0;
    }
}
