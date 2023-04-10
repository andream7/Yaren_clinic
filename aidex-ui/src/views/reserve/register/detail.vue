<template>
  <div class="card-container">
    <a-card class="card" title="患者信息" :bordered="false" style="width: 800px">
      <p>就诊卡号： {{ this.info.cardId }}</p>
      <p>姓名： {{ this.info.name }}</p>
      <p>性别： {{ this.info.sex }} </p>
      <p>手机号： {{ this.info.phone }} </p>
      <p>身份证号：{{ this.info.identityID }} </p>
      <p>出生日期：{{ this.formatDate(this.info.birthday) }} </p>
    </a-card>
    <br/>
    <a-card class="card" title="预约信息" :bordered="false" style="width: 800px">
      <p>主治医师： {{ this.info.doctorName }}</p>
      <p>所属专科：{{ this.info.deptName }} </p>
      <p>出诊时段：{{ this.info.period }} </p>
      <p>出诊时间：{{ this.info.day }}</p>
      <p>出诊状态：{{ this.info.status }}</p>
    </a-card>
  </div>
</template>

<script>

export default {
  name: "detail",
  data() {
    return {}
  },
  props: {
    info: {}
  },
  methods: {
    formatDate(date) {
      date = new Date(date)
      const year = date.getFullYear().toString();
      const month = (date.getMonth() + 1).toString().padStart(2, '0');
      const day = date.getDate().toString().padStart(2, '0');
      return `${year}年${month}月${day}日`;
    }

  },
  created() {

  }
}
</script>


<style scoped>
.card-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  margin-bottom: 30px;
}

.card-container > .card {
  width: 800px;
  margin-bottom: 20px;
  box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
}

.card-container > .card p {
  margin: 10px;
  font-size: 16px;
  line-height: 1.8;
}

.card-container > .card {
  background: #fff;
  color: #333;
}

.card-container > .card {
  background: #f2f2f2;
  color: #2d5532;
}

.card-container > .card p:nth-child {
  color: rgb(82, 146, 110);
}

.card-container > .card p:nth-child {
  font-weight: bold;
}
</style>
