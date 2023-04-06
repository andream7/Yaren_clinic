<template>
  <div>
    <a-table
      class="ant-table-striped"
      :rowClassName="(record, index) => (index % 2 === 1 ? 'table-striped' : null)"
      bordered :columns="columns" :row-key="record => record.name" :data-source="tableData" :scroll="{ x: 1500 }">
      <a slot="ope" @click="showModal">操作</a>
    </a-table>
    <a-modal
      width="1000px"
      v-model:visible="showOpe"
      title=""
      ok-text="确认"
      cancel-text=""
      @ok="hideModal"
    >
      <Plan></Plan>
    </a-modal>
  </div>

</template>

<script>
const columnNames = [
  " 星期一",
  " 星期二",
  " 星期三",
  " 星期四",
  " 星期五",
  " 星期六",
  " 星期日"
]
import Plan from "@/views/reserve/schedule/plan";
export default {
  name: 'index',
  components: {Plan},
  data() {
    return {
      tableData: [],

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
          title: columnNames[0],
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
          title: columnNames[1],
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
          title: columnNames[2],
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
          title: columnNames[3],
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
          title: columnNames[4],
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
          title: columnNames[5],
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
          title: columnNames[6],
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
          scopedSlots: { customRender: 'ope' }

        }
      ],
      showOpe: false
    }
  },
  methods : {
    showModal(){
      this.showOpe = true
    },
    hideModal() {
      this.showOpe = false
    }
  },
  created() {
    const fake = {"name":"黄滨","c":"内科",
      "morning0":"0","afternoon0":"7",
      "morning1":"0","afternoon1":"4",
      "morning2":"0","afternoon2":"2",
      "morning3":"0","afternoon3":"3",
      "morning4":"1","afternoon4":"6",
      "morning5":"2","afternoon5":"8",
      "morning6":"3","afternoon6":"9"
    }
    this.tableData.push(fake)
    //this.tableData.push(fake)
  }
}
</script>

<style scoped>
.ant-table-striped :deep(.table-striped) td {
  background-color: #fafafa;
}
</style>