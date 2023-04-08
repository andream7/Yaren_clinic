import request from '@/utils/request'

// 查询排班列表
export function getPlanList (data) {
  return request({
    url: '/hospital/plan/myList',
    method: 'post',
    data: data
  })
}

//
export function getPlan (id) {
  return request({
    url: '/hospital/plan/doctor',
    method: 'post',
    params: id
  })
}