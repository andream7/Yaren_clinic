<template>
  <div class="contains1">
    <a-card :bordered="false">
      <div class="table-page-search-wrapper">
        <a-form :labelCol="labelCol" :wrapperCol="wrapperCol">
          <a-row justify="space-between" :gutter="56">
<!--            <a-col :md="6" :sm="24">-->
<!--              <a-radio-group name="radioGroup" v-model:value="rstatus" class="q2">-->
<!--                <a-radio :value="1">全部</a-radio>-->
<!--                <a-radio :value="2">未开始</a-radio>-->
<!--                <a-radio :value="3">失约</a-radio>-->
<!--                <a-radio :value="4">取消</a-radio>-->
<!--                <a-radio :value="5">已完成</a-radio>-->
<!--              </a-radio-group>-->
<!--            </a-col>-->
            <a-col :span="8">
              <a-form-item label="选择日期" style="text-align: left">
                <a-range-picker v-model:value="dateRange"/>
              </a-form-item>
            </a-col>
            <a-col :span="8">
              <a-form-item label="关键字查找" style="text-align: left">
                <a-input-group compact>
                  <a-select v-model:value="selectType">
                    <a-select-option value="doctorName">
                      医生
                    </a-select-option>
                    <a-select-option value="patientName">
                      患者
                    </a-select-option>
                    <a-select-option value="clinicName">
                      诊室
                    </a-select-option>
                  </a-select>
                  <a-input style="width: 60%" placeholder="输入关键字" v-model="selectInputValue" class="q5"/>
                </a-input-group>
              </a-form-item>
            </a-col>
            <a-col :span="8">
              <span class="table-page-search-submitButtons" style="float: right;">
                 <a-button type="primary" @click="handleSummit" class="q6"><a-icon type="search"/>查询</a-button>
                 <a-button @click="handleReset" class="q7"><a-icon type="redo"/>重置</a-button>
              </span>
            </a-col>
          </a-row>
          <a-row :gutter="24">
            <a-col :span="12">
              <a-radio-group name="radioGroup" v-model:value="rstatus" style="margin-bottom: 10px;">
                <a-radio :value="1">全部</a-radio>
                <a-radio :value="2">未开始</a-radio>
                <a-radio :value="3">失约</a-radio>
                <a-radio :value="4">取消</a-radio>
                <a-radio :value="5">已完成</a-radio>
              </a-radio-group>
            </a-col>
          </a-row>
        </a-form>
      </div>
    </a-card>

    <a-card :bordered="false" class="table-card">
      <a-table :dataSource="tableData" :columns="columns" bordered :row-key="record => record.name" class="q8">
        <a slot="ope" slot-scope="text, record" @click="showModal(record)" style="color: #7cb305">🔎详情</a>
      </a-table>
    </a-card>

    <a-modal
      width="1000px"
      v-model:visible="showOpe"
      title="挂号详情"
      ok-text="确认"
      @ok="hideModal"
    >
      <Detail :info="detailInfo"></Detail>
    </a-modal>
  </div>
</template>

<script>
import Detail from "@/views/reserve/register/detail";
import {getAppointmentDetail, getAppointmentList} from "@/api/reserve/register";

const statusArr = ["未开始", "失约", "取消", "已完成"]
const periodArr = ["8点~8点半", "8点半~9点", "9点~9点半", "9点半~10点", "10点~10点半", "11点~11点半", "11点半~12点", "12点~12点半", "12点半~13点", "13点~13点半", "13点半~14点", "14点~14点半", "14点半~15点", "15点~15点半", "15点半~16点"];

export default {
  name: 'index',
  components: {Detail},
  data() {
    return {
      labelCol: { span: 6},
      wrapperCol: { span: 18},
      selectInputValue: "",
      detailInfo: {},
      dateRange: null,
      tableData: [],
      selectType: "doctorName",
      showOpe: false,
      rstatus: 1,
      columns: [
        {
          title: '患者姓名',
          dataIndex: 'nameP',
          align: 'center'
        },
        {
          title: '医生姓名',
          dataIndex: 'nameD',
          align: 'center'
        },
        {
          title: '诊室名称',
          dataIndex: 'nameR',
          align: 'center'
        },
        {
          title: '时间段',
          dataIndex: 'period',
          align: 'center'
        },
        {
          title: '状态',
          dataIndex: 'statusName',
          align: 'center'
        },
        {
          title: '出诊时间',
          dataIndex: 'day',
          align: 'center'
        },
        {
          title: '操作',
          dataIndex: 'operation',
          align: 'center',
          scopedSlots: {customRender: 'ope'},
        }
      ]
    }
  },
  mounted() {

  },
  methods: {
    handleReset() {
      this.selectInputValue = ""
      this.selectType = "doctorName"
      this.rstatus = 1
      this.dateRange = null
      this.handleSummit()
    },
    handleSummit() {
      let query = {}
      if (this.rstatus && this.rstatus !== 1) {   //状态
        query.status = this.rstatus - 2
      }
      if (this.dateRange) {
        query.begin = this.dateRange[0].toDate()
        query.end = this.dateRange[1].toDate()
      }
      if (this.selectType) {
        if (this.selectType === "clinicName") {
          query.clinicName = this.selectInputValue || ""
        } else if (this.selectType === "doctorName") {
          query.doctorName = this.selectInputValue || ""
        } else if (this.selectType === "patientName") {
          query.name = this.selectInputValue || ""
        }
      }
      getAppointmentList(query)
        .then(response => {
          let that = this
          that.tableData = []
          for (let item of response.data.list) {
            item.nameP = item.patientName
            item.nameD = item.doctorName
            item.nameR = item.clinicName
            item.period = periodArr[item.time]
            item.statusName = statusArr[item.status]
            that.tableData.push(item)
          }
        })
    },
    showModal(record) {
      this.showOpe = true
      console.log(record)
      if (record === undefined) {
        return;
      }
      let params = {}
      params.appointmentId = record.appointmentId
      getAppointmentDetail(params)
        .then(response => {
          console.log(response)
          response.data.status = statusArr[response.data.status]
          response.data.period = periodArr[response.data.period]
          this.detailInfo = response.data

        })

    },
    hideModal() {
      this.showOpe = false
    }


  },
  created() {
    this.handleSummit()
  }

}
</script>

<style scoped>
.ant-form-item-label{

}
</style>
