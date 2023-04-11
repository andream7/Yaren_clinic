<template>
  <div>
    <a-card :bordered="false" style="margin-bottom: 10px;">
      <!-- 条件搜索 -->
      <div class="table-page-search-wrapper">
        <a-form :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-row :gutter="48">
            <a-col :md="6" :sm="24">
              <a-form-item label="用户名">
                <a-input v-model="queryParam.name" placeholder="请输入患者名称" allow-clear @keyup.enter.native="handleQuery"/>
              </a-form-item>
            </a-col>
            <a-col :md="6" :sm="24">
              <a-form-item label="手机号">
                <a-input v-model="queryParam.phone" placeholder="请输入证件号码" allow-clear @keyup.enter.native="handleQuery"/>
              </a-form-item>
            </a-col>
            <a-col :md="6" :sm="24">
              <a-form-item
                label="
              患者状态">
                <a-select placeholder="请选择患者状态" v-model="queryParam.status" style="width: 100%" allow-clear>
                  <a-select-option v-for="(d, index) in statusOptions" :key="index" :value="d.dictValue">{{ d.dictLabel }}</a-select-option>
                </a-select>
              </a-form-item>
            </a-col>
            <a-col>
              <span class="table-page-search-submitButtons" style="float: right;">
                <a-button type="primary" @click="handleQuery"><a-icon type="search" />查询</a-button>
                <a-button style="margin-left: 8px" @click="resetQuery"><a-icon type="redo" />重置</a-button>
              </span>
            </a-col>
          </a-row>
        </a-form>
      </div>
    </a-card>
    <a-card :bordered="false" class="table-card">
      <!-- 详细信息 -->
      <view-form ref="viewForm" />
      <!-- 增加修改 -->
      <create-form
        ref="createForm"
        :statusOptions="statusOptions"
        @ok="getList"
      />
      <!-- 增加修改 -->
      <sys-user-add-form
        v-if="showAddModal"
        ref="sysUserAddForm"
        :statusOptions="statusOptions"
        @ok="getList"
        @close="showAddModal = false"
      />
      <advance-table
        :columns="columns"
        :data-source="list"
        title="用户信息"
        :loading="loading"
        rowKey="Id"
        tableKey="monitor-job-index-table"
        :isTableConfig="false"
        :isShowSetBtn="false"
        @refresh="getList"
        size="middle"
        :format-conditions="true"
        :row-selection="{ selectedRowKeys: selectedRowKeys, onChange: onSelectChange }"
        :pagination="{
          current: queryParam.pageNum,
          pageSize: queryParam.pageSize,
          total: total,
          showSizeChanger: true,
          showLessItems: true,
          showQuickJumper: true,
          showTotal: (total, range) => `第 ${range[0]}-${range[1]} 条，总计 ${total} 条`,
          onChange: changeSize,
          onShowSizeChange: onShowSizeChange,
        }"
      >
        <div class="table-operations" slot="button">
          <a-button type="primary" @click="handleAdd()" >
            <a-icon type="plus" />新增
          </a-button>
          <a-button type="danger" v-if="!multiple" :disabled="multiple" @click="handleDelete" v-hasPermi="['monitor:job:remove']">
            <a-icon type="delete" />删除
          </a-button>
          <a-button type="primary" @click="handleExport" v-hasPermi="['monitor:job:export']">
            <a-icon type="download" />导出
          </a-button>
          <a-button type="dashed" @click="handleJobLog" v-hasPermi="['monitor:job:query']">
            <a-icon type="snippets" />日志
          </a-button>
        </div>
        <span slot="phone" slot-scope="{text, record}">
          {{ jobGroupFormat(record) }}
        </span>
        <span slot="status" slot-scope="{text, record}">
          <a-popconfirm
            ok-text="是"
            cancel-text="否"
            @confirm="confirmHandleStatus(record)"
            @cancel="cancelHandleStatus(record)"
          >
            <span slot="title">确认<b>{{ record.status === '1' ? '开启' : '关闭' }}</b>{{ record.name }}的任务吗?</span>
            <a-switch checked-children="开" un-checked-children="关" :checked="record.status == 0" />
          </a-popconfirm>
        </span>
        <span slot="status" slot-scope="{text, record}" >
          <a-badge status="processing" :text=" statusFormat(record) " />
        </span>
        <span slot="gmtCreate" slot-scope="{text, record}">
          {{ parseTime(record.gmtCreate) }}
        </span>
        <span slot="operation" slot-scope="{text, record}">
          <a @click="handleUpdate(record,undefined)" v-hasPermi="['system:user:edit']">
            修改
          </a>
          <a-divider type="vertical" v-if="record.id !== 1" v-hasPermi="['system:user:remove']" />
          <a @click="handleDelete(record)" v-if="record.id !== 1" v-hasPermi="['system:user:remove']">
            删除
          </a>
        </span>
      </advance-table>
    </a-card>
  </div>
</template>

<script>

import { delJob, exportJob, runJob, changeJobStatus } from '@/api/monitor/job'
import CreateForm from '../list/createForm'
import ViewForm from '../list/viewForm'
import AdvanceTable from '@/components/pt/table/AdvanceTable'
import {delUser, listUser} from '@/api/system/user'
import SysUserAddForm from "@/views/system/user/modules/SysUserAddForm";
export default {
  name: 'Job',
  components: {
    CreateForm,
    ViewForm,
    SysUserAddForm,
    AdvanceTable
  },
  data () {
    return {
      showAddModal: false,
      showEditModal: false,
      list: [],
      selectedRowKeys: [],
      selectedRows: [],
      labelCol: { span: 6 },
      wrapperCol: { span: 18 },
      // 高级搜索 展开/关闭
      advanced: false,
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      ids: [],
      loading: false,
      total: 0,
      // 状态数据字典
      statusOptions: [],
      // 日期范围
      dateRange: [],
      queryParam: {
        pageNum: 1,
        pageSize: 10,
        name: undefined,
        phone: undefined,
        status: undefined
      },
      columns: [
        {
          title: '用户编号',
          dataIndex: 'id',
          width: '70px',
          align: 'center'
        },
        {
          title: '用户名',
          dataIndex: 'name',
          ellipsis: true,
          align: 'center'
        },
        {
          title: '手机号',
          dataIndex: 'phone',
          ellipsis: true,
          align: 'center'
        },
        {
          title: '状态',
          dataIndex: 'status',
          scopedSlots: { customRender: 'status' },
          align: 'center'
        },
        {
          title: '创建时间',
          dataIndex: 'gmtCreate',
          width: '20%',
          ellipsis: true,
          scopedSlots: { customRender: 'gmtCreate' },
          align: 'center'
        },
        {
          title: '操作',
          dataIndex: 'operation',
          width: '20%',
          scopedSlots: { customRender: 'operation' },
          align: 'center'
        }
      ]
    }
  },
  filters: {
  },
  created () {
    this.getList()
    this.getDicts('sys_job_status').then(response => {
      this.statusOptions = response.data
    })
  },
  computed: {
  },
  watch: {
  },
  methods: {
    /** 查询定时任务列表 */
    getList () {
      this.showAddModal = false
      this.showEditModal = false
      this.loading = true
      listUser(this.addDateRange(this.queryParam, this.dateRange)).then(response => {
          this.list = response.data.list
          this.total = response.data.total
          this.loading = false
        }
      )
    },
    // 执行状态字典翻译
    statusFormat (row) {
      return this.selectDictLabel(this.statusOptions, row.status)
    },
    // 任务组名字典翻译
    // jobGroupFormat (row) {
    //   return this.selectDictLabel(this.jobGroupOptions, row.phone)
    // },
    /** 搜索按钮操作 */
    handleQuery () {
      this.queryParam.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery () {
      this.dateRange = []
      this.queryParam = {
        pageNum: 1,
        pageSize: 10,
        name: undefined,
        phone: undefined,
        status: undefined
      }
      this.handleQuery()
    },
    onShowSizeChange (current, pageSize) {
      this.queryParam.pageSize = pageSize
      this.getList()
    },
    changeSize (current, pageSize) {
      this.queryParam.pageNum = current
      this.queryParam.pageSize = pageSize
      this.getList()
    },
    onSelectChange (selectedRowKeys, selectedRows) {
      this.selectedRowKeys = selectedRowKeys
      this.selectedRows = selectedRows
      this.ids = this.selectedRows.map(item => item.jobId)
      this.single = selectedRowKeys.length !== 1
      this.multiple = !selectedRowKeys.length
    },
    toggleAdvanced () {
      this.advanced = !this.advanced
    },
    /** 任务日志列表查询 */
    handleJobLog () {
      this.$router.push({ path: '/log/joblog' })
    },
    /* 任务状态修改 */
    confirmHandleStatus (row) {
      const text = row.status === '1' ? '启用' : '停用'
      row.status = row.status === '0' ? '1' : '0'
      changeJobStatus(row.jobId, row.status)
        .then(() => {
          this.$message.success(
            text + '成功',
            3
          )
        }).catch(function () {
        this.$message.error(
          text + '发生异常',
          3
        )
      })
    },
    cancelHandleStatus (row) {
    },
    cancelHandleRun (row) {
    },
    /** 导出按钮操作 */
    handleExport () {
      var that = this
      this.$confirm({
        title: '是否确认导出?',
        content: '此操作将导出当前条件下所有数据而非选中数据',
        onOk () {
          return exportJob(that.queryParam)
            .then(response => {
              that.download(response.msg)
              that.$message.success(
                '导出成功',
                3
              )
            })
        },
        onCancel () {}
      })
    },
    handleAdd () {
      this.showAddModal = true
      this.$nextTick(() => (
        this.$refs.sysUserAddForm.handleAdd()
      ))
    },
    handleUpdate (record, ids) {
      this.showEditModal = true
      this.$nextTick(() => (
        this.$refs.sysUserEditForm.handleUpdate(record, ids)
      ))
    },
    /** 删除按钮操作 */
    handleDelete (row) {
      var that = this
      const userIds = row.id || this.ids
      const userNames = row.name || this.userNames
      this.$confirm({
        title: '确认删除所选中数据?',
        content: '当前选中编号为' + userNames + '的数据',
        onOk () {
          return delUser(userIds)
            .then(() => {
              that.onSelectChange([], [])
              that.getList()
              that.$message.success(
                '删除成功',
                3
              )
            })
        },
        onCancel () {}
      })
    },
  }
}
</script>
