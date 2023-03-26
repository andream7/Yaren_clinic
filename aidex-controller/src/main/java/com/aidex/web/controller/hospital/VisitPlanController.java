package com.aidex.web.controller.hospital;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import com.aidex.common.core.domain.api.CommonPage;
import com.aidex.common.core.domain.api.CommonResult;
import com.aidex.system.dto.VisitDoctorPlanDTO;
import com.aidex.system.dto.VisitPlanDTO;
import com.aidex.system.dto.VisitPlanResiduesDTO;
import com.aidex.system.dto.param.VisitPlanParam;
import com.aidex.system.dto.param.VisitPlanUpdateParam;
import com.aidex.system.service.ISysUserService;
import com.aidex.system.service.IVisitPlanService;
import com.aidex.system.service.SysDeptService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Api(value = "出诊模块", tags = "出诊计划接口")
@RestController
@CrossOrigin
@RequestMapping("/hospital/plan")
public class VisitPlanController {

    @Resource
    private IVisitPlanService planService;

    @Resource
    private SysDeptService sysDeptService;

    @Resource
    private ISysUserService hospitalDoctorService;

    @ApiOperation(value = "添加出诊计划", notes = "传入 出诊计划参数（诊室编号、医生编号、出诊时间段（1：上午，2：下午）、出诊日期）")
    @PostMapping
    public CommonResult insertVisitPlan(@RequestBody VisitPlanParam param) {

        if (!hospitalDoctorService.isExistDoctorById(param.getDoctorId())) {
            return CommonResult.validateFailed("不存在，该医生编号！");
        }

        if (!sysDeptService.isExistDeptById(param.getDeptId())) {
            return CommonResult.validateFailed("不存在，该科室编号！");
        }

        if (param.getTime() > 2 || param.getTime() < 1) {
            return CommonResult.validateFailed("不存在，该出诊时间段（1：上午，2：下午）！");
        }

        if (planService.insert(param)) {
            return CommonResult.success();
        }

        return CommonResult.failed("服务器错误，请联系管理员！");
    }

    @ApiOperation(value = "更新出诊计划", notes = "传入 出诊编号、出诊计划参数（诊室编号、医生编号、出诊日期）")
    @ApiImplicitParam(name = "id", value = "出诊编号", paramType = "path", dataType = "Long", required = true)
    @PutMapping(value = "/{id}")
    public CommonResult updateVisitPlan(@PathVariable Long id, @RequestBody VisitPlanUpdateParam param) {

        if (!hospitalDoctorService.isExistDoctorById(param.getDoctorId())) {
            return CommonResult.validateFailed("不存在，该医生编号！");
        }

        if (!sysDeptService.checkDeptExistUser(param.getDeptId())) {
            return CommonResult.validateFailed("不存在，该科室编号！");
        }

        if (planService.update(id, param)) {
            return CommonResult.success();
        }

        return CommonResult.failed("服务器错误，请联系管理员！");
    }

    @ApiOperation(value = "搜索出诊计划", notes = "传入 医院编号、专科编号、门诊编号、出诊日期、第几页、页大小")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "deptId", value = "门诊编号", paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "day", value = "出诊日期", paramType = "query", dataType = "String",
                    required = true),
            @ApiImplicitParam(name = "pageNum", value = "第几页", paramType = "query", dataType = "Integer",
                    required = true),
            @ApiImplicitParam(name = "pageSize", value = "页大小", paramType = "query", dataType = "Integer",
                    required = true),
    })
    @GetMapping(value = "/list")
    public CommonResult<CommonPage<VisitPlanDTO>> searchVisitPlan(@RequestParam(required = false) Long deptId,
                                                                  @RequestParam String day,
                                                                  @RequestParam Integer pageNum,
                                                                  @RequestParam Integer pageSize) {

        return CommonResult.success(CommonPage.restPage(planService.list(deptId, null,
                DateUtil.parse(day), pageNum, pageSize)));
    }

    @ApiOperation(value = "删除出诊计划", notes = "传入 出诊编号")
    @ApiImplicitParam(name = "id", value = "出诊编号", paramType = "path", dataType = "Long", required = true)
    @DeleteMapping(value = "/{id}")
    public CommonResult deleteVisitPlan(@PathVariable Long id) {

        if (!planService.count(id)) {
            return CommonResult.validateFailed("不存在，该出诊编号");
        }

        if (planService.delete(id)) {
            return CommonResult.success();
        }

        return CommonResult.failed("服务器错误，请联系管理员！");
    }

    @ApiOperation(value = "批量删除出诊计划", notes = "传入 出诊编号列表")
    @ApiImplicitParam(name = "id", value = "出诊编号列表", paramType = "query", dataType = "List<Long>", required = true)
    @DeleteMapping(value = "/all")
    public CommonResult deleteAllVisitPlan(@RequestParam List<Long> idList) {

        if (CollUtil.isEmpty(idList)) {
            return CommonResult.validateFailed("出诊编号列表为空！");
        }

        if (planService.deleteAll(idList)) {
            return CommonResult.success();
        }

        return CommonResult.failed("服务器错误，请联系管理员！");
    }

    @ApiOperation(value = "根据医生，获取出诊信息", notes = "传入 医生编号、开始日期、结束日期")
    @GetMapping(value = "/doctor")
    public CommonResult<VisitDoctorPlanDTO> searchVisitPlanByDoctor(@RequestParam Long doctorId,
                                                                    @RequestParam String startDate,
                                                                    @RequestParam String endDate) {

        if (!hospitalDoctorService.isExistDoctorById(doctorId)) {
            return CommonResult.validateFailed("不存在，该医生编号！");
        }

        Date start = DateUtil.parseDate(startDate);
        Date end = DateUtil.parseDate(endDate);

        if (start.getTime() > end.getTime()) {
            return CommonResult.validateFailed("不存在，该日期时间段");
        }

        return CommonResult.success(planService.getDoctorPlan(doctorId, start, end));
    }

    @ApiOperation(value = "根据医生编号、日期，获取出诊信息", notes = "传入 医生编号、日期")
    @GetMapping(value = "/doctor/date")
    public CommonResult<List<VisitPlanResiduesDTO>> searchVisitPlanByDoctorAndDate(
                                                                                   @RequestParam Long doctorId,
                                                                                   @RequestParam String date) {

        Date time = DateUtil.parseDate(date);

        return CommonResult.success(planService.getDoctorPlanByDate(doctorId, time));
    }
}
