import request from '@/utils/request'

// 查询预约列表
export function getAppointmentList (data) {
  return request({
    url: '/monitor/server',
    method: 'post',
    data: data
  })
}