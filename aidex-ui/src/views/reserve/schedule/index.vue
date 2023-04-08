<template>
  <div>
    <label>-</label>
    <a-radio-group :default-value="0" button-style="solid" v-model="offsetWeek" @change="changeWeek">
      <a-radio-button :value="-1">
        上一周
      </a-radio-button>
      <a-radio-button :value="0">
        本周
      </a-radio-button>
      <a-radio-button :value="1">
        下一周
      </a-radio-button>
    </a-radio-group>

    <a-divider/>

    <a-table
      class="ant-table-striped"
      :rowClassName="(record, index) => (index % 2 === 1 ? 'table-striped' : null)"
      bordered :columns="columns" :row-key="record => record.name" :data-source="tableData" :scroll="{ x: 1500 }">
      <a slot="ope" slot-scope="text, record" @click="showModal(record.id)">操作</a>
      <template slot="title0">{{ this.columnNames[0] }}</template>
      <template slot="title1">{{ this.columnNames[1] }}</template>
      <template slot="title2">{{ this.columnNames[2] }}</template>
      <template slot="title3">{{ this.columnNames[3] }}</template>
      <template slot="title4">{{ this.columnNames[4] }}</template>
      <template slot="title5">{{ this.columnNames[5] }}</template>
      <template slot="title6">{{ this.columnNames[6] }}</template>
    </a-table>

    <a-modal
      width="1000px"
      v-model:visible="showOpe"
      title="查看排班"
      ok-text="确认"
      cancel-text=""
      @ok="hideModal"
    >
      <Plan :myinfo = "this.myinfo"></Plan>
    </a-modal>
  </div>

</template>

<script>
import Plan from "@/views/reserve/schedule/plan";
import {getPlan, getPlanList} from "@/api/reserve/schedule";

export default {
  name: 'index',
  components: {Plan},
  data() {
    return {
      offsetWeek: 0,
      begin: {},
      end: {},
      myinfo: {},
      tableData: [],
      columnNames: [],
      columns: [
        {
          title: '医生名字',
          dataIndex: 'name',
          key: '1'
        },
        {
          title: '科室',
          dataIndex: 'c',
          key: '2'
        },
        {
          scopedSlots: {
            title: 'title0'
          },
          dataIndex: 'day0',
          key: '3',
          children: [
            {
              title: '上午',
              dataIndex: 'morning0',
              key: '4'
            },
            {
              title: '下午',
              dataIndex: 'afternoon0',
              key: '5'
            }
          ]
        },
        {
          //title: this.columnNames[1],
          scopedSlots: {
            title: 'title1'
          },
          dataIndex: 'day1',
          children: [
            {
              title: '上午',
              dataIndex: 'morning1',
              key: '7'
            },
            {
              title: '下午',
              dataIndex: 'afternoon1',
              key: '8'
            }
          ],
          key: '6'
        },
        {
          //title: this.columnNames[2],
          scopedSlots: {
            title: 'title2'
          },
          dataIndex: 'day2',
          children: [
            {
              title: '上午',
              dataIndex: 'morning2',
              key: '9'
            },
            {
              title: '下午',
              dataIndex: 'afternoon2',
              key: '10'
            }
          ],
          key: '11'
        },
        {
          //title: this.columnNames[3],
          scopedSlots: {
            title: 'title3'
          },
          dataIndex: 'day3',
          children: [
            {
              title: '上午',
              dataIndex: 'morning3',
              key: '12'
            },
            {
              title: '下午',
              dataIndex: 'afternoon3',
              key: '13'
            }
          ],
          key: '14'
        },
        {
          scopedSlots: {
            title: 'title4'
          },
          dataIndex: 'day4',
          children: [
            {
              title: '上午',
              dataIndex: 'morning4',
              key: '15'
            },
            {
              title: '下午',
              dataIndex: 'afternoon4',
              key: '16'
            }
          ],
          key: '17'
        },
        {
          scopedSlots: {
            title: 'title5'
          },
          dataIndex: 'day5',
          children: [
            {
              title: '上午',
              dataIndex: 'morning5',
              key: '18'
            },
            {
              title: '下午',
              dataIndex: 'afternoon5',
              key: '19'
            }
          ],
          key: '20'
        },
        {
          //title: this.columnNames[6],
          scopedSlots: {
            title: 'title6'
          },
          dataIndex: 'day6',
          children: [
            {
              title: '上午',
              dataIndex: 'morning6',
              key: '21'
            },
            {
              title: '下午',
              dataIndex: 'afternoon6',
              key: '22'
            }
          ],
          key: '23'
        },
        {
          title: '操作',
          dataIndex: 'ope',
          key: '24',
          fixed: 'right',
          width: 100,
          scopedSlots: {customRender: 'ope'}

        }
      ],
      showOpe: false
    }
  },
  methods: {
    showModal(id) {
      this.showOpe = true
      let query = {};
      query.begin = new Date("2023-03-26")
      query.end = this.end
      query.doctorId = id
      getPlanList(query).then(rep => {
        console.log(rep)
        this.myinfo.info = rep.data.list

      })
    },
    hideModal() {
      this.showOpe = false
    },
    changeWeek() {
      this.getCurrentWeekDates(this.offsetWeek)
      this.getInfo()
    },
    getCurrentWeekDates(off) {
      const currentDate = new Date();
      const currentDay = currentDate.getDay(); // 当前星期几，0代表周日，1代表周一，以此类推
      const weekStart = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() - currentDay + 7 * off); // 当前周的起始日期
      const weekDates = [];

      for (let i = 0; i < 7; i++) {
        const date = new Date(weekStart.getFullYear(), weekStart.getMonth(), weekStart.getDate() + i);
        if (i === 0) {
          this.begin = date;
        } else if (i === 6) {
          this.end = date;
        }
        const dateString = `${date.getFullYear()}年${date.getMonth() + 1}月${date.getDate()}日 星期${['日', '一', '二', '三', '四', '五', '六'][date.getDay()]}`;
        weekDates.push(dateString);
      }

      this.columnNames = weekDates;
    },
    getInfo() {
      let query = {};
      query.begin = this.begin
      query.end = this.end
      getPlanList(query)
        .then(response => {
          console.log(response)
          let myBody = {};
          for (let item of response.data.list) {
            if (!myBody.hasOwnProperty(item.doctorId)) {
              myBody[item.doctorId] = []
            }
            myBody[item.doctorId].push(item)

          }
          for (let item of Object.keys(myBody)) {
            let line = {};
            for (let entry of myBody[item]) {
              line.id = entry.doctorId
              line.name = entry.doctorName
              line.c = entry.deptName
              let pam = (entry.period == 1 ? "morning" : "afternoon") + (new Date(entry.day).getDay())

              line[pam] = entry.num
            }
            this.tableData.push(line)
          }
        })
    }
  },
  created() {
    this.getCurrentWeekDates(0)
    this.getInfo()
  }
}
</script>

<style scoped>
.ant-table-striped :deep(.table-striped) td {
  background-color: #fafafa;
}
</style>