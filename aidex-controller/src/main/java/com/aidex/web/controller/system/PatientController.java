package com.aidex.web.controller.system;

import com.aidex.common.annotation.Log;
import com.aidex.common.core.domain.AjaxResult;
import com.aidex.common.core.domain.R;
import com.aidex.common.core.domain.entity.Patient;
import com.aidex.common.core.page.PageDomain;
import com.aidex.common.enums.BusinessType;
import com.aidex.common.utils.StringUtils;
import com.aidex.system.service.IPatientService;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 患者信息
 *
 * @author ruoyi
 */
@Api(value = "患者模块", tags = "患者信息接口")
@RestController
@CrossOrigin
public class PatientController {

    @Resource
    private IPatientService patientService;

    /**
     * 获取患者列表
     */
    @ApiOperation(value = "获取患者列表")
    @PreAuthorize("@ss.hasPermi('system:user:list')")
    @GetMapping("/list")
    public R<PageInfo> page(Patient patient, HttpServletRequest request, HttpServletResponse response) {
        patient.setPage(new PageDomain(request, response));
        return R.data(patientService.findPage(patient));
    }


    /**
     * 根据患者编号获取详细信息
     */
    @ApiOperation(value = "根据患者编号获取详细信息")
    @PreAuthorize("@ss.hasPermi('system:user:query')")
    @GetMapping(value = {"/", "/{userId}"})
    public AjaxResult getInfo(@PathVariable(value = "userId", required = false) String userId) {
        AjaxResult ajax = AjaxResult.success();
        if (StringUtils.isNotNull(userId)) {
            ajax.put(AjaxResult.DATA_TAG, patientService.get(userId));
        }
        return ajax;
    }

    /**
     * 新增患者
     */
    @ApiOperation(value = "新增患者")
    @PreAuthorize("@ss.hasPermi('system:user:add')")
    @Log(title = "患者管理", businessType = BusinessType.INSERT)
    @PostMapping
    public R add(@Validated @RequestBody Patient patient) {
        return R.status(patientService.insertUser(patient));
    }

    /**
     * 修改患者
     */
    @ApiOperation(value = "修改患者信息")
    @PreAuthorize("@ss.hasPermi('system:user:edit')")
    @Log(title = "患者管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public R edit(@Validated @RequestBody Patient patient) {
        patientService.checkUserAllowed(patient);
        return R.status(patientService.updateUser(patient));
    }

}
