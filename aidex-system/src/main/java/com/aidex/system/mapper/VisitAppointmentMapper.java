package com.aidex.system.mapper;

import com.aidex.system.dto.VisitAppointmentInfo;
import com.aidex.system.dto.query.VisitAppointmentQueryModel;
import com.aidex.system.entity.VisitAppointment;
import com.aidex.system.entity.VisitAppointmentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface VisitAppointmentMapper {
    long countByExample(VisitAppointmentExample example);

    int deleteByExample(VisitAppointmentExample example);

    int deleteByPrimaryKey(Long id);

    int insert(VisitAppointment record);

    int insertSelective(VisitAppointment record);

    List<VisitAppointment> selectByExample(VisitAppointmentExample example);

    VisitAppointmentInfo selectDetails(@Param("id") Long id);
    List<VisitAppointmentInfo> selectByExamplePlus(VisitAppointmentQueryModel queryModel);

    VisitAppointment selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") VisitAppointment record, @Param("example") VisitAppointmentExample example);

    int updateByExample(@Param("record") VisitAppointment record, @Param("example") VisitAppointmentExample example);

    int updateByPrimaryKeySelective(VisitAppointment record);

    int updateByPrimaryKey(VisitAppointment record);
}