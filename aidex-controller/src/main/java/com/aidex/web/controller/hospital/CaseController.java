package com.aidex.web.controller.hospital;

import com.aidex.common.core.domain.api.CommonPage;
import com.aidex.common.core.domain.api.CommonResult;
import com.aidex.system.dto.param.UserCaseParam;
import com.aidex.system.dto.param.UserCaseUpdateParam;
import com.aidex.system.entity.UserCase;
import com.aidex.system.service.ISysUserService;
import com.aidex.system.service.IUserCaseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Api(value = "患者模块", tags = "患者病例接口")
@RestController
@CrossOrigin
@RequestMapping("/case")
public class CaseController {

    @Resource
    private IUserCaseService caseService;

    @Resource
    private ISysUserService userService;

    @ApiOperation(value = "添加用户病例", notes = "传入 用户病例参数（患者编号、预约编号、医生编号、病例详情）")
    @PostMapping(value = "/")
    public CommonResult insertUserCase(@RequestBody UserCaseParam param) {

        if (!userService.count(param.getDoctorId())) {
            return CommonResult.validateFailed("不存在，该医生编号！");
        }

        if (caseService.insert(param)) {
            return CommonResult.success();
        }

        return CommonResult.failed("服务器错误，请联系管理员！");
    }

    @ApiOperation(value = "更新用户病例", notes = "传入 病例编号、用户病例更新参数（病例详情）")
    @ApiImplicitParam(name = "cardId", value = "病历号", paramType = "path", dataType = "Long", required = true)
    @PutMapping(value = "/{id}")
    public CommonResult updateUserCase(@PathVariable Long id, @RequestBody UserCaseUpdateParam param) {
        if (!caseService.count(id)) {
            return CommonResult.validateFailed("不存在，该病例编号！");
        }

        if (caseService.update(id, param)) {
            return CommonResult.success();
        }

        return CommonResult.failed("服务器错误，请联系管理员！");
    }

    @ApiOperation(value = "删除用户病例", notes = "传入 病例编号")
    @ApiImplicitParam(name = "cardId", value = "病历编号", paramType = "path", dataType = "Long", required = true)
    @DeleteMapping(value = "/{id}")
    public CommonResult deleteUserCase(@PathVariable Long id) {

        if (!caseService.count(id)) {
            return CommonResult.validateFailed("不存在，该病例编号！");
        }

        if (caseService.delete(id)) {
            return CommonResult.success();
        }

        return CommonResult.failed("服务器错误，请联系管理员！");

    }

    @ApiOperation(value = "获取用户病例", notes = "传入 患者编号、预约编号")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "cardId", value = "患者编号", paramType = "query", dataType = "Long",
                    required = true),
            @ApiImplicitParam(name = "appointmentId", value = "预约编号", paramType = "query", dataType = "Long",
                    required = true),
    })
    @GetMapping(value = "/{id}")
    public CommonResult<UserCase> getUserCase(@RequestParam Long Id, @RequestParam Long appointmentId) {

        return CommonResult.success(caseService.get(Id, appointmentId));
    }

    @ApiOperation(value = "用户病例列表", notes = "传入 患者编号、第几页、页大小")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "cardId", value = "患者编号", paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "pageNum", value = "第几页", paramType = "query", dataType = "Integer",
                    required = true),
            @ApiImplicitParam(name = "pageSize", value = "页大小", paramType = "query", dataType = "Integer",
                    required = true),
    })
    @GetMapping(value = "/list")
    public CommonResult<CommonPage<UserCase>> listUserCase(@RequestParam(required = false) Long cardId,
                                                           @RequestParam Integer pageNum, @RequestParam Integer pageSize) {

        return CommonResult.success(CommonPage.restPage(caseService.list(cardId, pageNum, pageSize)));
    }

}
