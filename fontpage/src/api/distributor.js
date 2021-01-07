import request from '../utils/request';

//得到经销商账号
export function findAll(datas) {
    return request({
        url: '/operator/info',
        method: 'post',
        data: datas
    });
}

//根据Id查询一条信息
export function findById(id) {
    return request({
        url: '/operator/' + id,
        method: 'get'
    });
}

//启用用户
export function ableUser(id) {
    return request({
        url: '/operator/enable/' + id,
        method: 'put'
    });
}

//禁用用户
export function disableUser(id) {
    return request({
        url: '/operator/disable/' + id,
        method: 'put'
    });
}


//更新用户
export function updateUser(datas) {
    return request({
        url: '/operator',
        method: 'put',
        data: datas
    });
}

//添加用户
export function addUser(datas) {
    return request({
        url: '/operator',
        method: 'post',
        data: datas
    });
}

//删除用户
export function deleteUser(datas) {
    return request({
        url: '/operator/' + datas,
        method: 'delete'
    });
}