<template>
  <ant-modal
    :visible="open"
    :modal-title="formTitle"
    :adjust-size="true"
    modalWidth="640"
    @cancel="cancel"
    modalHeight="420"
  >
    <a-form-model ref="form" :model="form" :rules="rules" slot="content" layout="vertical">
      <a-row class="form-row" :gutter="32">
        <a-col :lg="12" :md="12" :sm="24">
          <a-form-model-item label="字典类型" prop="dictType">
            <a-input v-model="form.dictType" :disabled="true" />
          </a-form-model-item>
        </a-col>
        <a-col :lg="12" :md="12" :sm="24">
          <a-form-model-item label="数据标签" prop="dictLabel">
            <a-input v-model="form.dictLabel" placeholder="请输入数据标签" />
          </a-form-model-item>
        </a-col>
        <a-col :lg="12" :md="12" :sm="24">
          <a-form-model-item label="数据键值" prop="dictValue">
            <a-input v-model="form.dictValue" placeholder="请输入数据键值" />
          </a-form-model-item>
        </a-col>
        <a-col :lg="12" :md="12" :sm="24">
          <a-form-model-item label="显示排序" prop="dictSort">
            <a-input-number v-model="form.dictSort" :min="0" style="width: 100%"/>
          </a-form-model-item>
        </a-col>
        <a-col :lg="12" :md="12" :sm="24">
          <a-form-model-item label="状态" prop="status">
            <a-select placeholder="请选择" v-model="form.status">
              <a-select-option v-for="(d, index) in statusOptions" :key="index" :value="d.dictValue" >{{ d.dictLabel }}</a-select-option>
            </a-select>
          </a-form-model-item>
        </a-col>
        <a-col :lg="24" :md="24" :sm="24">
          <a-form-model-item label="备注" prop="remark">
            <a-input v-model="form.remark" placeholder="请输入内容" type="textarea" allow-clear />
          </a-form-model-item>
        </a-col>
      </a-row>
    </a-form-model>
    <template slot="footer">
      <a-button @click="cancel">
        取消
      </a-button>
      <a-button type="primary" @click="submitForm">
        保存
      </a-button>
    </template>
  </ant-modal>

</template>

<script>
import DictDataForm from './DictDataForm'
export default {
  ...DictDataForm
}
</script>
