package com.aidex.system.mapper;

import com.aidex.system.entity.UserCase;
import com.aidex.system.entity.UserCaseExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserCaseMapper {
    long countByExample(UserCaseExample example);

    int deleteByExample(UserCaseExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UserCase record);

    int insertSelective(UserCase record);

    List<UserCase> selectByExample(UserCaseExample example);

    UserCase selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UserCase record, @Param("example") UserCaseExample example);

    int updateByExample(@Param("record") UserCase record, @Param("example") UserCaseExample example);

    int updateByPrimaryKeySelective(UserCase record);

    int updateByPrimaryKey(UserCase record);
}