<template>
    <div>
        <table class="table">
            <th colspan="2" class="table-warning"> 게시글 </th>
            <tbody>
                <tr height="50"><td><label for="title">제목</label></td>
                    <td><input style="width:100%" v-model="board.title" type="text" name="title" id="title"/></td>
                </tr>
                <tr height="50"><td><label for="title">아이디</label></td>
                <td><input style="width:100%" disabled v-model="board.id" type="text" name="id" id="id"/></td>
                </tr>
                <tr><td colspan="2"><label for="content">내용</label></td></tr>
                <tr><td colspan="2" align="center">
                    <textarea style="width:100%" disabled v-model="board.contents" name="contents" id="content" cols="30" rows="10"></textarea>
                </td></tr>
                <tr><td colspan="2"><label for="content">답글</label></td></tr>
                <tr><td colspan="2" align="center">
                    <textarea style="width:100%" v-model="board.reply" name="reply" id="reply" cols="30" rows="10"></textarea>
                </td></tr>
            </tbody>
            <tfoot>
                <tr><td colspan="2" align="center">
                    <button @click="insertreply" class="page-btn">작성</button>
                    <button @click="deletereply" class="page-btn">삭제</button>
                    <button @click="returnlist" class="page-btn">취소</button>
                </td></tr>
            </tfoot>
        </table>
    </div>
</template>

<script>
    import http from '../http-commom'
    import bus from '../eventBus'
    export default {
        data() {
            return {
                sid:'',
                loading:true,
                errored:false,
                board:{}
            }
        },
        created () {
            bus.$on('no',this.searchBoard);
        },
        mounted() {
            this.getsessionId();
        },
        methods: {
            getsessionId(){
                http
                .get('/getsessionId')
                .then(response=>{
                    this.sid = response.data.data
                })
                .catch(()=>{
                    alert('아이디 로딩 중 오류 발생')
                    this.errored = true
                })
                .finally(()=>{this.loading=false})
            },
            searchBoard(no){
                http
                .get('/boardSearch/'+no)
                .then(response=>{
                    this.board = response.data.data
                })
                .catch(()=>{
                    alert('게시물 조회 중 오류 발생')
                    this.errored = true
                })
                .finally(()=>{
                    this.loading=false
                })
            },
            insertreply() {
                http
                .put('/replyBoard',{
                    "contents": this.board.contents,
                    "id": this.board.id,
                    "no": this.board.no,
                    "regdate": this.board.regdate,
                    "reply": this.board.reply,
                    "title": this.board.title
                })
                .then(response=>{
                    if(response.data.state=='ok'){
                        alert('답글 등록 성공')
                        this.$router.push('/safefood/qna.do')
                    }
                })
                .catch(()=>{
                    alert('답글 등록 중 오류 발생')
                    this.errored = true;
                })
                .finally(()=>{this.loading=false})
            },
            deletereply() {
                http
                .put('/replyBoard',{
                    "contents": this.board.contents,
                    "id": this.board.id,
                    "no": this.board.no,
                    "regdate": this.board.regdate,
                    "reply": null,
                    "title": this.board.title
                })
                .then(response=>{
                    if(response.data.state=='ok'){
                        alert('답글 삭제 성공')
                        this.$router.push('/safefood/qna.do')
                    }
                })
                .catch(()=>{
                    alert('답글 삭제 중 오류 발생')
                    this.errored = true;
                })
                .finally(()=>{this.loading=false})
            },
            returnlist(){
                this.$router.push('/safefood/qna.do')
            }
        }
    }
</script>

<style scoped>

</style>