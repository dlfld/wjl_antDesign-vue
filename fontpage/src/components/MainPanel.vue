<template>
    <a-layout id="components-layout-demo-fixed">
        <a-layout-header :style="{ position: 'fixed', zIndex: 1, width: '100%' }">
            <div class="logo"/>
            <a-menu
                    theme="dark"
                    mode="horizontal"
                    :default-selected-keys="['2']"
                    :style="{ lineHeight: '64px' }"
            >
                <a-button @click="pageChange(1)"> 运营商账号管理</a-button>
                <a-button style="margin-left: 5vw" @click="pageChange(2)"> 经销商账号管理</a-button>
            </a-menu>
        </a-layout-header>
        <a-layout-content :style="{ padding: '0 50px', marginTop: '64px' }">
            <div :style="{ background: '#fff', padding: '24px', minHeight: '380px' }">
                <router-view/>
            </div>
        </a-layout-content>
        <a-layout-footer :style="{ textAlign: 'center' }">
            Ant Design ©2021 Created by 尾款人小分队
        </a-layout-footer>
    </a-layout>
</template>
<script>
    export default {
        name: "MainPanel",
        methods: {
            pageChange(val) {
                //跳经销商
                if (val === 1) {
                    this.$router.push('/')
                }
                //跳运营商
                if (val === 2) {
                    this.$router.push('/operators')
                }
            }
        }
    }
</script>
<style>
    #components-layout-demo-fixed .logo {
        width: 120px;
        height: 31px;
        background: rgba(255, 255, 255, 0.2);
        margin: 16px 24px 16px 0;
        float: left;
    }
</style>
