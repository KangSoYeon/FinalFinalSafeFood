<template>
    <div>
        <form method="post" @submit.prevent="addnotice" >
        <table class="table">
            <th colspan="2"> 공지글 </th>
            <tbody>
                <tr height="50"><td><label for="title">제목</label></td>
                    <td><input style="width:100%" v-model="title" type="text" name="title" id="title"/></td>
                </tr>
                <tr height="50"><td><label for="title">아이디</label></td>
                <td><input style="width:100%" v-model="id" disabled name="id" id="id" /></td>
                </tr>
                <tr><td colspan="2"><label for="content">내용</label></td></tr>
                <tr><td colspan="2" align="center">
                    <textarea style="width:100%" v-model="content" name="contents" id="content" cols="30" rows="10"></textarea>
                </td></tr>
            </tbody>
            <tfoot>
                <tr><td colspan="2" align="center">
                    <button type="submit" class="page-btn">작성</button>
                    <button @click="returnlist" class="page-btn">취소</button>
                </td></tr>
            </tfoot>
        </table>
        </form>
    </div>
</template>

<script>
    import http from '../http-commom'
    export default {
        name:'add-notice',
        data() {
            return{
                id:"",
                loading: true,
                errored: false,                
                title:"",
                content:"",
                no:"",
                viewcnt:0
            }
        },
        mounted() {
            this.getsessionid();
        },
        methods: {
                getsessionid(){
                    http
                    .get('/getsessionId')
                    .then(response => {
                        this.id = response.data.data
                    })
                    .catch(()=>{ 
                        alert('아이디를 받는 도중 오류 발생')
                        this.errored = true
                    })
                    .finally(()=>{this.loading=false})
                },
                returnlist(){
                    this.$router.push('/safefood/notice.do')
                },
                addnotice(){
                if(this.title=='') {
                    alert('제목을 입력하세요');
                    return false;
                }
                if(this.content=='') {
                    alert('내용을 입력하세요');
                    return false;
                }
                
                http
                .post('/insertNotice',{
                    "id":this.id,
                    "title":this.title,
                    "contents":this.content,
                    "no": this.no,
                    "viewcnt": this.viewcnt
                })
                .then(response=>{
                    if(response.data.state=='ok'){
                        alert('게시물 등록 성공')
                        this.$router.push('/safefood/notice.do')
                    }
                })
                .catch(()=>{
                    alert('게시물 등록 실패')
                    this.errored = true;
                })
                .finally(()=>{
                    this.loading = false;
                })
            }   
        }
    }
</script>

<style scoped>
    
</style>