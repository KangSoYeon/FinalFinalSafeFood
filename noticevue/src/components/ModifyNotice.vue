<template>
    <div>
        <table class="table">
            <th colspan="2"> 공지글 수정</th>
            <tbody>
                <tr height="50"><td><label for="title">제목</label></td>
                    <td><input style="width:100%" v-model="notice.title" type="text" name="title" id="title"/></td>
                </tr>
                <tr height="50"><td><label for="title">등록자</label></td>
                <td><input style="width:100%" disabled value="관리자" type="text" name="id" id="id"/></td>
                </tr>
                <tr><td colspan="2"><label for="content">내용</label></td></tr>
                <tr><td colspan="2" align="center">
                    <textarea style="width:100%" v-model="notice.contents" name="contents" id="content" cols="30" rows="10"></textarea>
                </td></tr>
            </tbody>
            <tfoot>
                <tr><td colspan="2" align="center">
                    <button @click="modifynotice" class="page-btn">수정</button>
                    <button @click="deletenotice(notice.no)" class="page-btn">삭제</button>
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
        name: 'modify-notice',
        data() {
            return{
                loading:true,
                errored:false,
                notice:{}
            }
        },
        created () {
            bus.$on('no',this.searchNotice);            
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
            searchNotice(no){
                http
                .get('/noticeSearch/'+no)
                .then(response=>{
                    this.notice = response.data.data
                })
                .catch(()=>{
                    alert('공지글 조회 중 오류 발생')
                    this.errored = true
                })
                .finally(()=>{
                    this.loading=false
                })
            },
            modifynotice() {
                if(this.notice.title==''){
                    alert('제목을 입력하세요')
                    return false;
                }
                if(this.notice.contents==''){
                    alert('내용을 입력하세요')
                    return false;
                }
                http
                .put('/updateNotice',{
                    "contents": this.notice.contents,
                    "id": this.notice.id,
                    "no": this.notice.no,
                    "title": this.notice.title,
                    "viewcnt": this.notice.viewcnt
                })
                .then(response=>{
                    if(response.data.state=='ok'){
                        alert('수정 성공')
                        this.$router.push('/safefood/notice.do')
                    }
                })
                .catch(()=>{
                    alert('게시물 수정 중 오류 발생')
                    this.errored = true;
                })
                .finally(()=>{this.loading=false})
            },
            deletenotice(no) {
                http
                .delete('/deleteNotice/'+no)
                .then(response=>{
                    if(response.data.state=='ok'){
                        alert('삭제 성공')
                        this.$router.push('/safefood/notice.do')
                    }
                })
                .catch(()=>{
                    alert('게시물 삭제 중 오류 발생')
                    this.errored = true;
                })
                .finally(()=>{this.loading=false})
            },
            returnlist(){
                this.$router.push('/safefood/notice.do')
            }
        }
    }
</script>

<style scoped>

</style>