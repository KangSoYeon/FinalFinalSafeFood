import Vue from 'vue';
import Router from 'vue-router';
import NoticeList from './components/NoticeList.vue'
import AddNotice from './components/AddNotice.vue'
import DetailNotice from './components/DetailNotice.vue'
import ModifyNotice from './components/ModifyNotice.vue'


// 모든 컴포넌트에서 사용하도록 등록
// 전역으로 등록하여 this.router를 사용 가능하게 해준다 
Vue.use(Router) 
export default new Router({
    mode : 'history',
    routes:[
        {
            path:'/safefood/notice.do',
            name:'noticepage',
            alias:'noticepage',
            component:NoticeList
        },
        {
            path:'/safefood/addNotice',
            name: 'addNotice',
            alias: 'addNotice',
            component:AddNotice
        },
        {
            path:'/safefood/detailNotice',
            name: 'detailNotice',
            alias: 'detailNotice',
            component:DetailNotice
        },
        {
            path: '/safefood/modifyNotice',
            name: 'modifyNotice',
            alias: 'modifyNotice',
            component:ModifyNotice
        }
    ]
    
})