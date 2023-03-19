package com.aidex.web.controller.hospital;

import com.aidex.common.annotation.Log;
import com.aidex.common.core.domain.api.CommonPage;
import com.aidex.common.core.domain.api.CommonResult;
import com.aidex.common.enums.BusinessType;
import com.aidex.system.domain.vo.PatientBasicInfo;
import com.aidex.system.service.IPatientService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;

/**
 * 患者信息
 */
@Api(value = "患者模块", tags = "患者信息接口")
@RestController
@CrossOrigin
@RequestMapping("/patient")
public class PatientController {

    @Resource
    private IPatientService patientService;

    @ApiOperation(value = "分页：搜索患者列表", notes = "传入 第几页、页大小")
    @PreAuthorize("@ss.hasPermi('system:user:list')")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", value = "第几页", paramType = "query", dataType = "Integer",
                    required = true),
            @ApiImplicitParam(name = "pageSize", value = "页大小", paramType = "query", dataType = "Integer",
                    required = true),
    })
    @GetMapping("/list")
    public CommonResult<CommonPage<PatientBasicInfo>> getList(@RequestParam Integer pageNum, @RequestParam Integer pageSize) {

        return CommonResult.success(CommonPage.restPage(patientService.list(pageNum, pageSize)));
    }

    /**
     * 根据患者编号获取详细信息
     */
    @ApiOperation(value = "根据患者编号获取患者信息", notes = "传入 用户编号")
    @ApiImplicitParam(name = "id", value = "患者编号", paramType = "path", dataType = "Long",
            required = true)
    @PreAuthorize("@ss.hasPermi('system:user:query')")
    @GetMapping(value = {"/{id}"})
    public CommonResult<PatientBasicInfo> getInfo(@PathVariable Long id) {

        return CommonResult.success(patientService.getById(id));
    }

    /**
     * 修改患者
     */
    @ApiOperation(value = "更新患者信息", notes = "传入 用户编号、用户信息参数")
    @PreAuthorize("@ss.hasPermi('system:user:edit')")
    @Log(title = "患者管理", businessType = BusinessType.UPDATE)
    @ApiImplicitParam(name = "id", value = "患者编号", paramType = "path", dataType = "Long",
            required = true)
    @PutMapping(value = "/{id}")
    public CommonResult updateInfo(@PathVariable Long id, @RequestBody PatientBasicInfo param) {

        if (!patientService.count(id)) {
            return CommonResult.validateFailed("不存在，该用户编号！");
        }

        if (patientService.update(id, param)) {
            return CommonResult.success();
        }

        return CommonResult.failed("服务器错误，请联系管理员！");
    }
    /**
     * 删除患者
     */
    @ApiOperation(value = "删除用户信息", notes = "传入 用户编号")
    @ApiImplicitParam(name = "id", value = "用户编号", paramType = "path", dataType = "Long",
            required = true)
    @DeleteMapping(value = "/{id}")
    public CommonResult deleteBasicInfo(@PathVariable Long id) {
        if (!patientService.count(id)) {
            return CommonResult.validateFailed("不存在，该用户编号！");
        }

        if (patientService.delete(id)) {
            return CommonResult.success();
        }

        return CommonResult.failed("服务器错误，请联系管理员！");
    }

}
