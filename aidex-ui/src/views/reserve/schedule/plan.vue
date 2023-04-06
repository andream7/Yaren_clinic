<template>
  <div>
    <a-row type="flex">
      <a-col :flex="2">
        <p>黄滨医生排班详情</p>
        <p>{{ getNowFormatDate(currentTime) }}</p>
        <p>{{ getWeekDay(currentTime) }}</p>
        <a-space direction="vertical">
          <a-card title="上午" style="width: 300px">
            <p>接诊时间：8:00 - 12:00</p>
            <p>号源数：20</p>
            <p>接诊数：10</p>
          </a-card>
          <a-divider style="border-color: #7cb305" dashed />
          <a-card title="下午" style="width: 300px">
            <p>接诊时间：14:00 - 18:00</p>
            <p>号源数：20</p>
            <p>接诊数：10</p>
          </a-card>
        </a-space>
      </a-col>
      <a-col :flex="3">
        <div>
          <a-calendar :fullscreen="false"  v-model:value="currentTime" @select="onSelectFn"
                      @panelChange="onPanelChangeFn">
            <template #headerRender="{ value: current, type, onChange, onTypeChange }" >
              <div style="padding: 10px">
                <div style="margin-bottom: 10px">
                  <a-button type="primary" @click=""> 设置排班</a-button>
                </div>
                <a-row type="flex" justify="space-between">

                  <a-col>
                    <label>选择年份：</label>
                    <a-select
                      size="small"
                      :dropdown-match-select-width="false"
                      class="my-year-select"
                      :value="String(current.year())"
                      @change="
                  newYear => {
                    onChange(current.year(newYear));
                  }
                "
                    >
                      <a-select-option
                        v-for="val in getYears(current)"
                        :key="String(val)"
                        class="year-item"
                      >
                        {{ val }}
                      </a-select-option>
                    </a-select>
                  </a-col>
                  <a-col>
                    <label>选择月份：</label>
                    <a-select
                      size="small"
                      :dropdown-match-select-width="false"
                      :value="String(current.month())"
                      @change="
                  selectedMonth => {
                    onChange(current.month(parseInt(String(selectedMonth), 10)));
                  }
                "
                    >
                      <a-select-option
                        v-for="(val, index) in getMonths(current)"
                        :key="String(index)"
                        class="month-item"
                      >
                        {{ val }}
                      </a-select-option>
                    </a-select>
                  </a-col>
                </a-row>
              </div>
            </template>
            <ul slot="dateCellRender" slot-scope="value" class="events">
              <li v-for="item in getListData(value)" :key="item.content">
                <a-badge :status="item.type" :text="item.content" />
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

export default {
  name: 'Plan',
  data() {
    return {
      currentTime: moment() //当前时间，日历是需要moment
    };
  },
  created() {
    this.currentTime = moment()
  },
  methods: {
    onSelectFn(value) {
      //实际使用可能会需要获取最新数据。
      // console.log(value.format('YYYY-MM-DD'),"aaaa")
    },
    onPanelChangeFn(value) {
      // console.log(value,"bbbb")
    },
    getListData (value)  {
      let listData;
      switch (value.date()) {
        case 8 :
          listData = [
            { type: 'success', content: '' }
          ];
          break;
        case 10:
          listData = [
            { type: 'warning', content: '' }
          ];
          break;
        case 15:
          listData = [
            { type: 'warning', content: '' }
          ];
          break;
        default:
      }
      return listData || [];
    },

    getYears(value) {
      const year = value.year();
      const years = []
      for (let i = year - 10; i < year + 10; i += 1) {
        years.push(i)
      }
      return years
    },
    getMonths(value) {
      const current = value.clone();
      const localeData = value.localeData();
      const months = [];
      for (let i = 0; i < 12; i++) {
        current.month(i);
        months.push(localeData.monthsShort(current));
      }
      return months;
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
    getWeekDay(time){
      let datelist = ['周日', '周一', '周二', '周三', '周四', '周五', '周六']
      return datelist[new Date(time).getDay()];
    }
  },
  mounted() {

  },
};
</script>

<style scoped>
.events {
  list-style: none;
  margin: 0;
  padding: 0;
}
.notes-month section {
  font-size: 28px;
}
</style>

