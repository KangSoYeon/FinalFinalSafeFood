import Vue from 'vue';
import Router from 'vue-router';
import BoardList from './components/BoardList.vue'
import AddBoard from './components/AddBoard.vue'
import DetailBoard from './components/DetailBoard.vue'
import AddReply from './components/AddReply.vue'


// 모든 컴포넌트에서 사용하도록 등록
// 전역으로 등록하여 this.router를 사용 가능하게 해준다 
Vue.use(Router) 
export default new Router({
    mode : 'history',
    routes:[
        {
            path:'/safefood/qna.do',
            name:'boardpage',
            alias:'boardpage',
            component:BoardList
        },
        {
            path:'/safefood/addboard',
            name: 'addboard',
            alias: 'addboard',
            component:AddBoard
        },
        {
            path:'/safefood/detailBoard',
            name: 'detailBoard',
            alias: 'detailBoard',
            component:DetailBoard
        },
        {
            path: '/safefood/addReply',
            name: 'addReply',
            alias: 'addReply',
            component:AddReply
        }
    ]
    
})