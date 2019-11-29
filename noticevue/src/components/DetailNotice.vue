<template>
    <div>
        <table class="table">
            <th colspan="2"> 공지글 </th>
            <tbody>
                <tr height="50"><td><label for="title">제목</label></td>
                    <td><input style="width:100%" disabled v-model="notice.title" type="text" name="title" id="title"/></td>
                </tr>
                <tr height="50"><td><label for="title">등록자</label></td>
                <td><input style="width:100%" disabled value="관리자" type="text" name="id" id="id"/></td>
                </tr>
                <tr><td colspan="2"><label for="content">내용</label></td></tr>
                <tr><td colspan="2" align="center">
                    <textarea style="width:100%" disabled v-model="notice.contents" name="contents" id="content" cols="30" rows="10"></textarea>
                </td></tr>
            </tbody>
            <tfoot>
                <tr><td colspan="2" align="center">
                    <button @click="returnlist" class="page-btn">돌아가기</button>
                </td></tr>
            </tfoot>
        </table>
    </div>
</template>

<script>
    import http from '../http-commom'
    import bus from '../eventBus'
    export default {
        name: 'detail-notice',
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
        updated() {
            http
            .put('/updateNotice',{
                "contents": this.notice.contents,
                "id": this.notice.id,
                "no": this.notice.no,
                "title": this.notice.title,
                "viewcnt": parseInt(this.notice.viewcnt) + 1
            })
            .then(response=>{
                if(response.data.state=="ok") {
                    console.log('조회수 성공')
                }
            })
            .catch(()=>{
                console.log('조회수 실패')
                this.errored = true
            })
            .finally(()=>{
                this.loading = false;
            })
        },
        methods: {
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
            returnlist(){
                this.$router.push('/safefood/notice.do')
            }
        }
    }
</script>

<style scoped>

</style>