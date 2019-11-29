<template>
    <div>
        <table class="table">            
            <tr class="table-warning">
                <th>번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>조회수</th>
                
            </tr>
            <tr v-for="p in paginatedDate" :key="p.no" class="nicecolor">
                <td>{{p.no}}</td>
                <td @click="show_detail(p.no)">{{p.title}}</td>
                <td>{{p.contents}}</td>
                <td>{{p.viewcnt}}</td>
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
            
            <div v-if="sid=='admin'" style="float:right;padding-right:20px;">
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
                errored:false,
                loading:true,
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
            addboard() {
                this.$router.push('/safefood/addNotice')
            },
            show_detail(no){
                alert(no+'번 공지글 상세 보기')
                if(this.sid=="admin"){
                    this.$router.push('/safefood/modifyNotice');
                }else {
                    this.$router.push('/safefood/detailNotice');
                }
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
        },
        mounted () {
            http
            .get('/getsessionId')
            .then(response => {
                this.sid = response.data.data
            })
            .catch(()=>{ 
                alert('아이디를 받는 도중 오류 발생')
                this.errored = true
            })
            .finally(()=>{this.loading=false})
        },
        
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