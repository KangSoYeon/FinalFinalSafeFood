<template>
    <div>
        <table class="table">            
            <tr class="table-warning">
                <th>번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>게시일</th>
                <th v-if="sid=='admin'">답글</th>
            </tr>
            <tr v-for="p in paginatedDate" :key="p.no" class="nicecolor">
                <td>{{p.no}}</td>
                <td id="btitle" @click="show_detail(p.no,p.title)" >{{p.title}}</td>
                <td id="bcontents" @click="show_detail(p.no,p.title)" >{{p.contents}}</td>
                <td>{{p.regdate}}</td>
                <td v-if="sid=='admin'">
                    <button v-if="sid=='admin'" @click="addreply(p.no)" >답글</button>
                </td>
            </tr>
            
        </table>
        <div class="btn-cover">
            <button :disabled="pageNum == 0" @click="prevPage" class="page-btn">
                이전
            </button>
            <span class="page-count">{{pageNum + 1}}/{{ pageCount }} 페이지</span>
            <button :disabled="pageNum >= pageCount -1" @click="nextPage" class="page-btn">
                다음
            </button>
            <div style="float:right;padding-right:20px;" v-if="sid!='admin'">
            <button @click="addboard" class="page-btn">글쓰기</button>
            </div>
        </div>
        
    </div>
</template>

<script>
    import bus from '../eventBus'
    import http from '../http-commom'
    
    export default {
        name: 'paginated-list',
        data() {
            return{
                sid:'',
                loading:true,
                errored:false,
                pageNum: 0
            }
        },
        props: {
            listArray: {
                type: Array,
                required: true
            },
            pageSize: {
                type: Number,
                required: false,
                default: 10
            }
        },
        methods: {
                nextPage () {
                this.pageNum += 1;
            },
            prevPage() {
                this.pageNum -= 1;
            },
            addreply(no) {
                this.$router.push('/safefood/addReply')
                setTimeout(()=>{
                    bus.$emit('no',no)
                },1);
            },
            addboard() {
                this.$router.push('/safefood/addboard')
            },
            show_detail(no,title){
                alert(title+'게시물 상세 보기')
                this.$router.push('/safefood/detailBoard');
                setTimeout(()=>{
                    bus.$emit('no',no)
                },1);
            }
        },
        computed: {
            pageCount() {
                let listLeng = this.listArray.length,
                listSize = this.pageSize,
                page = Math.floor(listLeng/listSize);

                if(listLeng%listSize>0) page+= 1;
                
                return page;
            },
            paginatedDate() {
                const start = this.pageNum*this.pageSize,
                    end = start + this.pageSize;

                return this.listArray.slice(start,end);
            }
        },mounted() {
            http
            .get('/getsessionId')
            .then(response=>{
                this.sid = response.data.data
            })
            .catch(()=>{
                alert('아이디 로딩 중 오류 발생')
                this.errored = true;
            })
            .finally(()=>{this.loading=false})
        }
    }
</script>

<style scoped>
.btn-cover {
  margin-top: 1.5rem;
  text-align: center;
}
.btn-cover .page-btn {
  width: 5rem;
  height: 2rem;
  letter-spacing: 0.5px;
}
.btn-cover .page-count {
  padding: 0 1rem;
}
</style>