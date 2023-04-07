import request from '@/utils/request'

// 查询预约列表
export function getAppointmentList (data) {
  return request({
    url: '/hospital/appoint/myList',
    method: 'post',
    data: data
  })
}

export function getAppointmentDetail (id) {
  return request({
    url: '/hospital/appoint/detail',
    method: 'get',
    params: id
  })
}