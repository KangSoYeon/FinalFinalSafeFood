<template>
    <div id="app">
        <h1 style="text-align:center">공지사항</h1>
        <paginated-list :list-array="pageArray" />
    </div>
</template>

<script>
    import http from '../http-commom'
    import PaginatedList from './PaginatedList'
    
    export default {
        name: 'notice-list',
        components: {
            PaginatedList
        },
        data() {
            return{
                pageArray: []
            }
        },
        created () {
            http
            .get('/noticeSearchAll')
            .then(response=> {
                console.log(response);
                this.pageArray = response.data.data;
            })
            .catch(err=>{
                console.log(err);
            })
        }
    }
</script>

<style scoped>
    
</style>