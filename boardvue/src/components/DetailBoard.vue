<template>
    <div>
        <table class="table">
            <th colspan="2" class="table-warning"> 게시글 </th>
            <tbody>
                <tr height="50"><td><label for="title">제목</label></td>
                    <td><input style="width:100%" v-model="board.title" type="text" name="title" id="title"/></td>
                </tr>
                <tr height="50"><td><label for="id">아이디</label></td>
                <td><input style="width:100%" disabled v-model="board.id" type="text" name="id" id="id"/></td>
                </tr>
                <tr><td colspan="2"><label for="content">내용</label></td></tr>
                <tr><td colspan="2" align="center">
                    <textarea style="width:100%" v-model="board.contents" name="contents" id="content" cols="30" rows="10"></textarea>
                </td></tr>
                <template style="width:100%" v-if="board.reply!=null" >
                <tr><td colspan="2"><label for="reply">답글</label></td></tr>
                <tr><td colspan="2" align="left">
                        <div name="reply" id="reply" >{{board.reply}}</div>
                </td></tr>
                </template>
            </tbody>
            <tfoot>
                <tr><td colspan="2" align="center">
                    <button @click="modifyboard" class="page-btn">수정</button>
                    <button @click="deleteboard(board.no)" class="page-btn">삭제</button>
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
        name: 'detail-board',
        data() {
            return{
                loading:true,
                errored:false,
                board:{},
                sid:''
            }
        },
        created () {
            bus.$on('no',this.searchBoard);
            
        },
        mounted(){
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
            modifyboard() {
                if(this.board.title==''){
                    alert('제목을 입력하세요')
                    return false;
                }
                if(this.board.id!=this.sid){
                    alert('본인의 게시물이 아니라 수정이 불가합니다.')
                    return false;
                }
                if(this.board.contents==''){
                    alert('내용을 입력하세요')
                    return false;
                }
                http
                .put('/updateBoard',{
                    "contents": this.board.contents,
                    "id": this.board.id,
                    "no": this.board.no,
                    "regdate": this.board.regdate,
                    "reply": this.board.reply,
                    "title": this.board.title
                })
                .then(response=>{
                    if(response.data.state=='ok'){
                        alert('수정 성공')
                        this.$router.push('/safefood/qna.do')
                    }
                })
                .catch(()=>{
                    alert('게시물 수정 중 오류 발생')
                    this.errored = true;
                })
                .finally(()=>{this.loading=false})
            },
            deleteboard(no) {
                if(this.board.id!=this.sid){
                    alert('본인의 게시물이 아니라 삭제가 불가합니다.')
                    return false;
                }
                http
                .delete('/deleteBoard/'+no)
                .then(response=>{
                    if(response.data.state=='ok'){
                        alert('삭제 성공')
                        this.$router.push('/safefood/qna.do')
                    }
                })
                .catch(()=>{
                    alert('게시물 삭제 중 오류 발생')
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