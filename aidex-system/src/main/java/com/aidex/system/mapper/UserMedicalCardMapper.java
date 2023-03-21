package com.aidex.system.mapper;

import com.aidex.system.entity.UserMedicalCard;
import com.aidex.system.entity.UserMedicalCardExample;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface UserMedicalCardMapper {
    long countByExample(UserMedicalCardExample example);

    int deleteByExample(UserMedicalCardExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UserMedicalCard record);

    int insertSelective(UserMedicalCard record);

    List<UserMedicalCard> selectByExample(UserMedicalCardExample example);

    UserMedicalCard selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UserMedicalCard record, @Param("example") UserMedicalCardExample example);

    int updateByExample(@Param("record") UserMedicalCard record, @Param("example") UserMedicalCardExample example);

    int updateByPrimaryKeySelective(UserMedicalCard record);

    int updateByPrimaryKey(UserMedicalCard record);
}