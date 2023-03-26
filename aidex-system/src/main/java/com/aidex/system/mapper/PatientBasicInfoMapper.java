package com.aidex.system.mapper;

import com.aidex.system.domain.vo.PatientBasicInfo;
import com.aidex.system.entity.UserBasicInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PatientBasicInfoMapper {
    long countByExample(UserBasicInfoExample example);

    int deleteByExample(UserBasicInfoExample example);

    int deleteByPrimaryKey(Long id);

    int insert(PatientBasicInfo record);

    int insertSelective(PatientBasicInfo record);

    List<PatientBasicInfo> selectByExample(UserBasicInfoExample example);

    PatientBasicInfo selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") PatientBasicInfo record, @Param("example") UserBasicInfoExample example);

    int updateByExample(@Param("record") PatientBasicInfo record, @Param("example") UserBasicInfoExample example);

    int updateByPrimaryKeySelective(PatientBasicInfo record);

    int updateByPrimaryKey(PatientBasicInfo record);
}