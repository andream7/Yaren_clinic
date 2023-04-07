<template>
  <div style="background:#ECECEC; padding:30px">
    <a-card title="患者信息" :bordered="false" style="width: 800px">
      <p>就诊卡号： {{this.info.cardId}}</p>
      <p>姓名：  {{this.info.name}}</p>
      <p>性别： {{this.info.sex}} </p>
      <p>手机号： {{this.info.phone}} </p>
      <p>身份证号：{{this.info.identityID}}  </p>
      <p>出生日期：{{this.info.birthday}} </p>
    </a-card>
    <br/>
    <a-card title="预约信息" :bordered="false" style="width: 800px">
      <p>主治医师： {{this.info.doctorName}}</p>
      <p>所属专科：{{this.info.deptName}} </p>
      <p>出诊时段：{{this.info.period}} </p>
      <p>出诊时间：{{this.info.day}}</p>
      <p>出诊状态：{{this.info.status}}</p>
    </a-card>
  </div>
</template>

<script>

export default {
  name: "detail",
  data() {
    return{
    }
  },
  props:{
    info: {}
  },
  methods: {

  },
  created() {

  }
}
</script>

<style scoped>

</style>