package com.aidex.system.mapper;

import com.aidex.system.entity.UserMedicalCardRelation;
import com.aidex.system.entity.UserMedicalCardRelationExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMedicalCardRelationMapper {
    long countByExample(UserMedicalCardRelationExample example);

    int deleteByExample(UserMedicalCardRelationExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UserMedicalCardRelation record);

    int insertSelective(UserMedicalCardRelation record);

    List<UserMedicalCardRelation> selectByExample(UserMedicalCardRelationExample example);

    UserMedicalCardRelation selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UserMedicalCardRelation record, @Param("example") UserMedicalCardRelationExample example);

    int updateByExample(@Param("record") UserMedicalCardRelation record, @Param("example") UserMedicalCardRelationExample example);

    int updateByPrimaryKeySelective(UserMedicalCardRelation record);

    int updateByPrimaryKey(UserMedicalCardRelation record);
}