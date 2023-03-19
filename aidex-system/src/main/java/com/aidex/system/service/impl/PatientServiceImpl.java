package com.aidex.system.service.impl;

import com.aidex.system.domain.vo.PatientBasicInfo;
import com.aidex.system.mapper.PatientBasicInfoMapper;
import com.aidex.system.service.IPatientService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

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

    @Override
    public List<PatientBasicInfo> list(Integer pageNum, Integer pageSize) {

        return patientInfoMapper.list(pageNum, pageSize);
    }

    @Override
    public boolean count(Long id) {

        return (patientInfoMapper.countById(id) > 0) ? true: false;
    }
}
