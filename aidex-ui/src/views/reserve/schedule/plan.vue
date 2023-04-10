<template>
  <div class="schedule" >
    <a-row :gutter="16" style="width: 1000px">
      <a-col :span="8" class="schedule__info">
        <p class="schedule__info-title">{{ this.doctorName }}医生排班详情</p>
        <p class="schedule__info-date">{{ getNowFormatDate(currentTime) }}</p>
        <p class="schedule__info-day">{{ getWeekDay(currentTime) }}</p>
        <div v-if="canSetPlan">
          <a-space direction="vertical">
            <a-card title="上午" class="schedule__card">
              <p class="schedule__card-time">接诊时间：8:00 - 12:00</p>
              <a-input-search placeholder="输入号源数" @search="setPlanSources1">
                <a-button slot="enterButton">
                  设置
                </a-button>
              </a-input-search>
            </a-card>
            <a-divider style="border-color: #7cb305" dashed/>
            <a-card title="下午" class="schedule__card">
              <p class="schedule__card-time">接诊时间：14:00 - 18:00</p>
              <a-input-search placeholder="输入号源数" @search="setPlanSources2">
                <a-button slot="enterButton">
                  设置
                </a-button>
              </a-input-search>
            </a-card>
          </a-space>
        </div>
        <div v-if="canShow">
          <a-space direction="vertical">
            <a-card title="上午"  v-if="period" class="schedule__card">
              <p class="schedule__card-time">接诊时间：8:00 - 12:00</p>
              <p class="schedule__card-text">号源数：{{ this.sources }}</p>
              <p class="schedule__card-text">接诊数：{{ this.received }}</p>
            </a-card>
            <a-divider style="border-color: #7cb305" />
            <a-card title="下午"  v-if="!period" class="schedule__card">
              <p class="schedule__card-time">接诊时间：14:00 - 18:00</p>
              <p class="schedule__card-text">号源数：{{ this.sources }}</p>
              <p class="schedule__card-text">接诊数：{{ this.received }}</p>
            </a-card>
          </a-space>
        </div>
      </a-col>
      <a-col  class="schedule__calendar">
        <div>
          <div class="schedule__calendar-btn">
            <a-button type="primary" @click="openSetPlan"> 设置排班</a-button>
          </div>
          <div class="schedule__calendar-btn" v-if="canSetPlan">
            <a-button  @click="cancelSetPlan"> 取消排班</a-button>
          </div>
          <a-calendar mode="month" :fullscreen="false" v-model:value="currentTime" @select="onSelectFn"
                      @panelChange="onPanelChangeFn" :validRange="range">
            <ul slot="dateCellRender" slot-scope="value" class="events">
              <li v-for="item in getListData(value)" :key="item.content">
                <a-badge :status="item.type" :text="item.content" class="xxx"/>
              </li>
            </ul>
          </a-calendar>
        </div>
      </a-col>
    </a-row>
  </div>
</template>


<script>
import moment from "moment";
import {getPlanList, updatePlan} from "@/api/reserve/schedule";

export default {
  name: 'plan',
  props: {
    myinfo: {},
  },
  data() {
    return {
      currentTime: moment(), //当前时间，日历是需要moment
      doctorName: "",
      canShow: false,
      canSetPlan: false,
      period: false,
      received: 0,
      sources: 0,
      tableData: [],
      range: [],
    };
  },
  created() {
    this.currentTime = moment()
    this.getCurrentMonthFirstAndLastDay()
  },
  methods: {
    cancelSetPlan(){
      this.canShow = true;
      this.canSetPlan = false;
      this.onSelectFn(this.currentTime)
    },
    openSetPlan() {
      this.canShow = false;
      this.canSetPlan = true;
    },
    setPlanSources1(value) {
      this.loadBaseInfo(value, 1)
    },
    loadBaseInfo(value, period) {
      console.log(value);  //todo api
      this.canSetPlan = false
      this.canShow = true
      for (let item of this.tableData) {
        if (this.isSameDay(this.currentTime.toDate(), new Date(item.day))) {
          let body = {};
          body.id = item.planId;
          body.time = period
          body.sources = value
          updatePlan(body)
            .then((rep) => {
              this.$message.info("更新排班成功")
              this.onPanelChangeFn(this.currentTime.toDate())

            })
          return;
        }
      }
      //新增
      let body = {};
      body.id = -1;
      body.doctorId = this.myinfo.doctorId
      body.deptId = this.myinfo.deptId
      body.time = period
      body.day = this.currentTime
      body.sources = value
      updatePlan(body)
        .then((rep) => {
          this.$message.info("新增排班成功")
          this.onPanelChangeFn(this.currentTime.toDate())
        })
    },
    setPlanSources2(value) {
      this.loadBaseInfo(value, 2)
    },
    onSelectFn(value) {
      //实际使用可能会需要获取最新数据。
      console.log(value, "zz")
      this.canShow = false
      for (let item of this.tableData) {
        if (this.isSameDay(new Date(value), new Date(item.day))) {
          this.doctorName = item.doctorName
          this.period = item.period === 1
          this.sources = item.sources
          this.canShow = true
        }
      }
    },
    onPanelChangeFn(value) {
      let query = {};
      let range = this.getCurrentMonthFirstAndLastDay(value)
      query.begin = new Date(range.firstDay)
      query.end = new Date(range.lastDay)
      query.doctorId = this.myinfo.doctorId
      this.tableData = []
      this.canShow = false
      getPlanList(query)
        .then(response => {
          console.log(response)
          for (let item of response.data.list) {
            if (this.isSameDay(new Date(value), new Date(item.day))) {
              this.doctorName = item.doctorName
              this.period = item.period === 1
              this.sources = item.sources
              this.canShow = true
            }
            this.tableData.push(item)
          }
        })
    },
    getListData(value) {
      let listData;
      for (let item of this.tableData) {
        if (value.date() === new Date(item.day).getDate()) {
          listData = [
            {type: 'success', content: "号源" + item.sources}
          ];
        }
      }
      if (listData === undefined && this.isSameMonth(new Date(value), new Date(this.currentTime.toDate()))) {
        return [{type: 'error', content: "未排班"}];
      }
      return listData || [];
    },

    getNowFormatDate(date) {
      date = new Date(date);
      let year = date.getFullYear();
      let month = date.getMonth() + 1;
      let d = date.getDate();
      if (month < 10) {
        month = "0" + month;
      }
      if (d < 10) {
        d = "0" + d;
      }
      return year + "年" + month + "月" + d + "日";
    },
    getWeekDay(time) {
      let datelist = ['周日', '周一', '周二', '周三', '周四', '周五', '周六']
      return datelist[new Date(time).getDay()];
    },
    getCurrentMonthFirstAndLastDay(date) {
      const currentDate = date === undefined ? new Date() : new Date(date);
      const year = currentDate.getFullYear();
      const month = currentDate.getMonth() + 1; // getMonth()返回0~11，所以要+1才是实际月份
      const firstDay = new Date(year, month - 1, 1);
      const lastDay = new Date(year, month, 0);

      const firstDayString = `${year}-${month.toString().padStart(2, '0')}-01`; // 将日期转换为指定格式，例如 "2023-04-01"
      const lastDayString = `${year}-${month.toString().padStart(2, '0')}-${lastDay.getDate().toString().padStart(2, '0')}`;
      this.range = [moment(firstDayString), moment(lastDayString)]
      return {firstDay: firstDayString, lastDay: lastDayString};
    },
    isSameDay(date1, date2) {
      return date1.getFullYear() === date2.getFullYear() && date1.getMonth() === date2.getMonth() && date1.getDate() === date2.getDate();
    },
    isSameMonth(date1, date2) {
      return date1.getFullYear() === date2.getFullYear() && date1.getMonth() === date2.getMonth();
    }
  },
  mounted() {
    let query = {};
    let range = this.getCurrentMonthFirstAndLastDay()
    query.begin = new Date(range.firstDay)
    query.end = new Date(range.lastDay)
    query.doctorId = this.myinfo.doctorId
    getPlanList(query)
      .then(response => {
        console.log(response)
        for (let item of response.data.list) {
          if (this.isSameDay(new Date, new Date(item.day))) {
            this.doctorName = item.doctorName
            this.period = item.period === 1
            this.sources = item.sources
            this.canShow = true
          }
          this.tableData.push(item)
        }

      })
    const e3 = document.querySelectorAll('.ant-badge-status-text');
    for (let item of e3) {
      item.style.fontSize = "2px"
    }

    //让年月切换消失
    let element = document.getElementsByClassName('ant-radio-group ant-radio-group-outline ant-radio-group-small');
    element[0].style.display = "none"


  }


};
</script>

<style scoped>
.schedule {
  display: inline-block;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.schedule__info {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 2rem;
  background-color: #fff;
  box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
  width: 300px;
}

.schedule__info-title {
  font-size: 1.25rem;
  font-weight: 500;
  color: #0050b3;
  margin-bottom: 1rem;
}

.schedule__info-date {
  font-size: 1rem;
  font-weight: 300;
  color: #7cb305;
  margin-bottom: 0.5rem;
}

.schedule__info-day {
  font-size: 1rem;
  font-weight: 300;
  color: #7cb305;
  margin-bottom: 1.5rem;
}

.schedule__card {
  border-radius: 5px;
  box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
  padding: 1rem;
  background-color: #fff;
  width: auto;
}

.schedule__card-time {
  font-size: 1rem;
  font-weight: 500;
  color: #7cb305;
  margin-bottom: 0.5rem;
}

.schedule__card-text {
  font-size: 1rem;
  font-weight: 500;
  color: #333;
  margin-bottom: 0.5rem;
}

.schedule__calendar {
  display: inline-block;
  margin-left: 2rem;
  background-color: #fff;
  box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
  width: 600px;
  height: 450px;
}
.events {
  list-style: none;
  margin: 0;
  padding: 0;
}

</style>

