import request from '../utils/request';

//得到账号
export function findAll(datas) {
    return request({
        url: '/franchiser/info',
        method: 'post',
        data: datas
    });
}

//根据Id查询一条信息
export function findById(id) {
    return request({
        url: '/franchiser/' + id,
        method: 'get'
    });
}

//启用用户
export function ableUser(id) {
    return request({
        url: '/franchiser/enable/' + id,
        method: 'put'
    });
}

//禁用用户
export function disableUser(id) {
    return request({
        url: '/franchiser/disable/' + id,
        method: 'put'
    });
}


//更新用户
export function updateUser(datas) {
    return request({
        url: '/franchiser',
        method: 'put',
        data: datas
    });
}
//删除用户
export function deleteUser(datas) {
    return request({
        url: '/franchiser/' + datas,
        method: 'delete'
    });
}
//添加用户
export function addUser(datas) {
    return request({
        url: '/franchiser',
        method: 'post',
        data: datas
    });
}