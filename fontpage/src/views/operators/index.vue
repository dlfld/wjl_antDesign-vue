<template>

    <Layout>
        <Header>
            <a-tag color="green" style="font-size: 1vw">
                经销商账号管理
            </a-tag>
            <!--            <div></div>-->
            <a-row type="flex">
                <a-col :span="4" :order="1">
                    <a-input ref="userNameInput" v-model="listQuesy.username" placeholder="请输入用户名">
                        <a-icon slot="prefix" type="user"/>
                        <a-tooltip slot="suffix" title="请输入用户名">
                            <a-icon type="info-circle" style="color: rgba(0,0,0,.45)"/>
                        </a-tooltip>
                    </a-input>
                </a-col>
                <a-col :span="3" :order="2">
                    <a-select default-value="全选" style="width: 120px" @change="handleChangeStatus">
                        <a-select-option value="启用">
                            启用
                        </a-select-option>
                        <a-select-option value="禁用">
                            禁用
                        </a-select-option>
                        <a-select-option value="">
                            全选
                        </a-select-option>
                    </a-select>
                </a-col>
                <a-col :span="1" :order="3">
                    <a-button type="primary" shape="circle" @click="findAll" icon="search"/>
                </a-col>
                <a-col :span="1" :order="4">
                    <a-button type="primary" shape="circle" @click="addUser" icon="plus"/>
                </a-col>
            </a-row>

        </Header>
        <Layout>
            <br/>
            <a-spin :spinning="loading">
                <a-table :columns="columns" :data-source="data" bordered>
                    <a slot="name" slot-scope="text">{{ text }}</a>
                    <template slot="operation" slot-scope="text, record">
                        <a-button @click="edit(record.id)" shape="circle" icon="edit">
                            <!--                            <a-icon type="edit"/>-->
                        </a-button>
                        <a-popconfirm style="margin-left: 1vw" title="确定删除?" @confirm="() => deleteUser(record.id)">
                            <a-button type="danger" shape="circle" icon="close">
                                <!--                                <a-icon type="close"/>-->
                            </a-button>
                        </a-popconfirm>
                        <a-popconfirm style="margin-left: 1vw" v-if="record.status==='启用'" title="确定禁用?"
                                      @confirm="() => disable(record.id)">
                            <a-button type="danger" shape="circle" icon="stop">
                                <!--                                <a-icon type="stop"/>-->
                            </a-button>
                        </a-popconfirm>
                        <a-popconfirm style="margin-left: 1vw" v-if="record.status==='禁用'" title="确定启用?"
                                      @confirm="() => enable(record.id)">
                            <a-button type="primary" shape="circle" icon="check">
                                <!--                                <a-icon type="check"/>-->
                            </a-button>
                        </a-popconfirm>
                    </template>
                </a-table>
            </a-spin>
            <a-modal v-model="visible" :title="dialogTitle" @ok="saveEdit">
                <a-form-model ref="ruleForm" :model="editTemp">
                    <a-tag color="orange" v-if="dialogTitle==='编辑'">
                        id:&nbsp;{{editTemp.id}}
                    </a-tag>
                    <a-form-model-item label="姓名">
                        <a-input v-model="editTemp.username" autocomplete="off"/>
                    </a-form-model-item>
                    <a-form-model-item label="公司">
                        <a-input v-model="editTemp.company" autocomplete="off"/>
                    </a-form-model-item>
                    <a-form-model-item label="密码">
                        <a-input v-model="editTemp.password" autocomplete="off"/>
                    </a-form-model-item>
                    <a-form-model-item label="联系方式">
                        <a-input v-model="editTemp.contact" autocomplete="off"/>
                    </a-form-model-item>
                    <a-select :default-value="editTemp.sex" style="width: 120px" @change="handleChange">
                        <a-select-option value="男">
                            男
                        </a-select-option>
                        <a-select-option value="女">
                            女
                        </a-select-option>
                    </a-select>
                </a-form-model>
            </a-modal>
        </Layout>
    </Layout>
</template>

<script>
    import {findAll, findById, ableUser, disableUser, updateUser, addUser, deleteUser} from '../../api/operators'

    export default {
        name: "operators",
        data() {
            return {

                listQuesy: {username: "", status: ""},
                data: [
                    {
                        id: '1',
                        username: 'John Brown',
                        company: 32,
                        contact: 'New York No. 1 Lake Park, New York No. 1 Lake Park',
                        status: "禁用",
                        sex: "asd"
                    },
                    {
                        id: '2',
                        username: 'John Brown',
                        company: 32,
                        contact: 'New York No. 1 Lake Park, New York No. 1 Lake Park',
                        status: "启用",
                        sex: "asd"

                    }
                ],
                columns: [
                    {
                        title: 'id',
                        dataIndex: 'id',
                        key: 'id',
                        width: 50
                    },
                    {
                        title: '姓名',
                        dataIndex: 'username',
                        key: 'username'
                    },
                    {
                        title: '公司',
                        dataIndex: 'company',
                        key: 'company',
                        ellipsis: true,
                    },
                    {
                        title: '联系方式',
                        dataIndex: 'contact',
                        key: 'contact',
                        ellipsis: true,
                    },
                    {
                        title: '状态',
                        dataIndex: 'status',
                        key: 'status',
                        ellipsis: true,
                        // scopedSlots: {customRender: 'operation'},
                    },
                    {
                        title: '性别',
                        dataIndex: 'sex',
                        key: 'sex',
                        ellipsis: true,
                    },
                    {
                        title: '密码',
                        dataIndex: 'password',
                        key: 'password'
                    },
                    {
                        title: '操作',
                        dataIndex: 'handle',
                        key: 'handle',
                        scopedSlots: {customRender: 'operation'},
                    }
                ],
                loading: false,
                visible: false,//修改框是否可见
                //编辑时候的变量
                editTemp: {
                    id: '',
                    username: '',
                    company: '',
                    contact: '',
                    status: "",
                    sex: "男"
                },
                Temp: {
                    id: '',
                    username: '',
                    company: '',
                    contact: '',
                    status: "",
                    sex: "男"
                },
                dialogTitle: "编辑",//弹出框的标题
            }
        },
        created() {
            this.findAll()
        },
        methods: {
            async findAll() {
                this.loading = true //加载中 开始
                const res = await findAll(this.listQuesy)
                this.data = res.data
                this.loading = false
            },
            //禁用
            async disable(val) {
                const res = await disableUser(val) //请求禁用接口
                this.$message.success(res.msg); //弹出请求结果
                this.findAll()//刷新页面数据
            },
            //启用
            async enable(val) {
                const res = await ableUser(val)
                this.$message.success(res.msg);
                this.findAll()
            },
            //编辑
            async edit(val) {
                this.loading = true //加载中 开始
                this.dialogTitle = "编辑"
                const res = await findById(val)
                this.editTemp = res.data[0]
                this.visible = true
                this.loading = false //加载中 开始
            },
            //删除用户
            async deleteUser(id) {
                const res = await deleteUser(id)
                this.$message.success(res.msg);
                this.findAll()
            },
            //添加用户
            addUser() {
                this.dialogTitle = "添加"
                this.editTemp = Object.assign({}, this.Temp) //深拷贝
                this.visible = true
            },
            //选择框选择事件
            handleChange(value) {
                //把选中的性别赋值给当前项的性别
                this.editTemp.sex = value
            },
            //状态选择框选择事件
            handleChangeStatus(value) {
                this.listQuesy.status = value
            },
            //保存编辑
            async saveEdit() {
                if (this.dialogTitle === "添加") {
                    const res = await addUser(this.editTemp)
                    this.$message.success(res.msg);
                    this.findAll()
                    this.visible = false //关闭弹窗
                }
                if (this.dialogTitle === "编辑") {
                    const res = await updateUser(this.editTemp)
                    this.$message.success(res.msg);
                    this.findAll()
                    this.visible = false //关闭弹窗
                }

            }
        }
    }
</script>

<style scoped>

</style>