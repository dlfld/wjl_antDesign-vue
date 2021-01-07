import Vue from 'vue';
import Antd from 'ant-design-vue';
import App from './App';
import 'ant-design-vue/dist/antd.css';

Vue.config.productionTip = false;
import router from './router'


Vue.use(Antd);


new Vue({
    router,
    render: h => h(App),
}).$mount('#app')
