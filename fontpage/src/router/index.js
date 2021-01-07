import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)
import distributor from '../views/distributor/index.vue'
import operators from '../views/operators/index'

const router = new Router({
    routes: [{
        path: '/',
        component: distributor,
    },
        {
            path: '/operators',
            component: operators,
        }
    ]
})


export default router