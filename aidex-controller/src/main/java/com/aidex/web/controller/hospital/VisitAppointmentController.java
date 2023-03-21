package com.aidex.web.controller.hospital;

import cn.hutool.core.date.DateUtil;

import com.aidex.common.core.domain.api.CommonPage;
import com.aidex.common.core.domain.api.CommonResult;
import com.aidex.system.dto.*;
import com.aidex.system.dto.param.VisitAppointmentParam;
import com.aidex.system.entity.VisitAppointment;
import com.aidex.system.service.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.Date;

import static com.aidex.system.dto.AppointmentEnum.*;

/**
 * @author YuJian95  clj9509@163.com
 * @date 2020/3/19
 */

@Api(value = "出诊模块", tags = "出诊预约接口")
@RestController
@CrossOrigin
@RequestMapping("/appointment")
public class VisitAppointmentController {

    @Resource
    private IPatientService patientService;

    @Resource
    private IVisitAppointmentService appointmentService;

    @Resource
    private IUserMedicalCardService userMedicalCardService;

    @Resource
    private IVisitPlanService planService;

    @Resource
    private ISysUserService userService;

    @ApiOperation(value = "添加预约信息", notes = "传入 预约参数对象（出诊编号、就诊卡号、账号编号）")
    @PostMapping
    public CommonResult insertAppointment(@RequestBody VisitAppointmentParam param) {

        if (!userMedicalCardService.countCardId(param.getCardId())) {
            return CommonResult.validateFailed("不存在，该就诊卡号！");
        }

        if (!planService.count(param.getPlanId())) {
            return CommonResult.validateFailed("不存在，该出诊编号！");
        }

        if (appointmentService.count(param.getCardId(), param.getPlanId())) {
            return CommonResult.success("该出诊，已存在预约记录！");
        }

        if (appointmentService.insert(param)) {
            return CommonResult.success();
        }

        return CommonResult.failed();
    }

    @ApiOperation(value = "判断是否已预约", notes = "传入 出诊编号、就诊卡号")
    @GetMapping(value = "/check")
    public CommonResult checkAppointment(@RequestParam Long cardId, @RequestParam Long planId) {

        if (!userMedicalCardService.countCardId(cardId)) {
            return CommonResult.validateFailed("不存在，该就诊卡号！");
        }

        if (!planService.count(planId)) {
            return CommonResult.validateFailed("不存在，该出诊编号！");
        }

        return CommonResult.success(appointmentService.count(cardId, planId));
    }


    @ApiOperation(value = "修改预约状态：取消", notes = "传入 预约编号")
    @RequestMapping(value = "/cancel/{id}", method = RequestMethod.PUT)
    public CommonResult cancelAppointment(@PathVariable Long id) {

        return updateAppointmentStatus(id, CANCEL.getStatus());
    }

    @ApiOperation(value = "修改预约状态：迟到", notes = "传入 预约编号")
    @RequestMapping(value = "/miss/{id}", method = RequestMethod.PUT)
    public CommonResult missAppointment(@PathVariable Long id) {

        return updateAppointmentStatus(id, MISSING.getStatus());
    }

    @ApiOperation(value = "修改预约状态：完成", notes = "传入 预约编号")
    @RequestMapping(value = "/finish/{id}", method = RequestMethod.PUT)
    public CommonResult finishAppointment(@PathVariable Long id) {

        return updateAppointmentStatus(id, FINISH.getStatus());
    }

    @ApiOperation(value = "查找挂号记录", notes = "传入就诊卡编号、挂号状态")
    @GetMapping(value = "/search")
    public CommonResult<CommonPage<VisitAppointment>> searchAppointment(@RequestParam(required = false) Long cardId,
                                                                        @RequestParam(required = false) Integer status,
                                                                        @RequestParam Integer pageNum,
                                                                        @RequestParam Integer pageSize) {

        return CommonResult.success(CommonPage.restPage(appointmentService.list(cardId, status, pageNum, pageSize)));
    }

    @ApiOperation(value = "获取所有挂号记录", notes = "传入就诊卡编号、账号编号")
    @GetMapping(value = "/all")
    public CommonResult<CommonPage<VisitAppointmentWithQueueDTO>> listAllAppointment(@RequestParam Long cardId,
                                                                                     @RequestParam Long patientId,
                                                                                     @RequestParam Integer pageNum,
                                                                                     @RequestParam Integer pageSize) {

        if (!userMedicalCardService.countCardId(cardId)) {
            return CommonResult.validateFailed("不存在，该就诊卡编号！");
        }

        if (!patientService.count(patientId)) {
            return CommonResult.validateFailed("不存在，该用户编号！");
        }

        return CommonResult.success(CommonPage.restPage(appointmentService.listAllAppointment(cardId, patientId, pageNum, pageSize)));
    }

    @ApiOperation(value = "获取失信记录详情", notes = "传入预约编号")
    @RequestMapping(value = "/miss/details", method = RequestMethod.GET)
    public CommonResult<VisitAppointmentWithQueueDTO> listAllAppointment(@RequestParam Long appointmentId) {

        if (!appointmentService.count(appointmentId)) {
            return CommonResult.validateFailed("不存在，该预约编号！");
        }

        return CommonResult.success(appointmentService.getAppointmentDetails(appointmentId));
    }

    @ApiOperation(value = "获取就诊记录列表", notes = "传入就诊卡编号")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult<CommonPage<VisitAppointmentDTO>> listAppointment(@RequestParam Long cardId, @RequestParam Integer pageNum,
                                                                         @RequestParam Integer pageSize) {

        if (!userMedicalCardService.countCardId(cardId)) {
            return CommonResult.validateFailed("不存在，该就诊卡编号！");
        }

        return CommonResult.success(CommonPage.restPage(appointmentService.listNormalAppointment(cardId, pageNum, pageSize)));
    }
    @ApiOperation(value = "查看就诊记录详情", notes = "传入就诊卡编号")
    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public CommonResult<VisitAppointmentWithCaseDTO> getAppointmentDetails(@RequestParam Long appointmentId) {

        if (!appointmentService.count(appointmentId)) {
            return CommonResult.validateFailed("不存在，该预约编号！");
        }

        return CommonResult.success(appointmentService.getVisitAppointmentWithCaseDTO(appointmentId));
    }

    @ApiOperation(value = "查看当天排队信息", notes = "传入就诊卡编号、账号编号")
    @RequestMapping(value = "/today", method = RequestMethod.GET)
    public CommonResult<CommonPage<VisitAppointmentQueueDTO>> getTodayAppointment(@RequestParam Long cardId,
                                                                                  @RequestParam Long patientid,

                                                                                  @RequestParam String date) {

        if (!userMedicalCardService.countCardId(cardId)) {
            return CommonResult.validateFailed("不存在，该就诊卡编号！");
        }

        if (!patientService.count(patientid)) {
            return CommonResult.validateFailed("不存在，该用户编号！");
        }

        return CommonResult.success(CommonPage.restPage(appointmentService.listTodayQueue(DateUtil.parseDate(date), cardId, patientid)));
    }

    @ApiOperation(value = "查看用户预约情况", notes = "传入医生编号、日期、时间段（上午：1、下午：2）")
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public CommonResult<CommonPage<VisitUserInfoDTO>> listVisitUserInfo(@RequestParam Long doctorId, @RequestParam String date,
                                                                        @RequestParam Integer time, @RequestParam Integer pageNum,
                                                                        @RequestParam Integer pageSize) {

        if (!userService.count(doctorId)) {
            return CommonResult.validateFailed("不存在，该医生编号！");
        }

        Date day = DateUtil.parse(date);

        return CommonResult.success(CommonPage.restPage(appointmentService.listVisitUserInfo(doctorId, time, day, pageNum, pageSize)));
    }

    @ApiOperation(value = "查看获取预约诊室名称", notes = "传入医生编号、日期、时间段（上午：1、下午：2）")
    @RequestMapping(value = "/clinic", method = RequestMethod.GET)
    public CommonResult getClinicName(@RequestParam Long doctorId, @RequestParam String date,
                                      @RequestParam Integer time) {

        if (!userService.count(doctorId)) {
            return CommonResult.validateFailed("不存在，该医生编号！");
        }

        Date day = DateUtil.parse(date);

        return CommonResult.success(appointmentService.getClinicName(doctorId, time, day));
    }

    /**
     * 更新预订状态
     *
     * @param id     预订编号
     * @param status 状态：1 失约，2 取消， 3 完成
     * @return 更新情况
     */
    private CommonResult updateAppointmentStatus(Long id, Integer status) {
        if (!appointmentService.count(id)) {
            return CommonResult.validateFailed("不存在，该预约编号！");
        }

        if (appointmentService.update(id, status)) {
            return CommonResult.success();
        }

        return CommonResult.failed();
    }
}
