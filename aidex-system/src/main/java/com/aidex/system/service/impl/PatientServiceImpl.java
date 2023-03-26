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

    @Override
    public PatientBasicInfo getById(Long id) {

        return patientInfoMapper.selectByPrimaryKey(id);
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

    @Override
    public boolean count(Long id) {

        return (patientInfoMapper.countById(id) > 0) ? true: false;
    }

    @Override
    public boolean countByPhoneId(String id) {

        return (patientInfoMapper.countByPhoneId(id) != "") ? true: false;
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
