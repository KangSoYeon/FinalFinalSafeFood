<template>
    <div id="app">
        <h1 style="text-align:center">QnA 게시판</h1>
        <paginated-list :list-array="pageArray"/>
    </div>
</template>

<script>
    import http from '../http-commom'
    import PaginatedList from './PaginatedList'
    
    export default {
        name: 'board-list',
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
            .get('/boardSearchAll')
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