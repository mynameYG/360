<template>
 <div class="app-newsinfo">
 <header class="mui-bar mui-bar-nav">
		    <router-link to="/NewsList" class="mui-action-back mui-icon mui-icon-back mui-pull-left"></router-link>
		    <h1 class="mui-title">弹幕互动</h1>
		</header>
  	<div class="mui-card">
				<div class="mui-card-header mui-card-media" :style="'height:40vw;background-image:url('+info.img_url+')'"></div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<p>{{info.ctime | datetimeFilter}}</p>
						<p style="color: #333;">{{info.content}}</p>
					</div>
				</div>
				<div class="mui-card-footer">
					<a class="mui-card-link">冒泡</a>
					<a class="mui-card-link">潜水</a>
				</div>
			</div>
      	<div class="mui-card">
				<div class="mui-card-header">多行文本框</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
		        <textarea placeholder="吐槽~~"maxlength="120" v-model="msg">
            </textarea>
            <mt-button size="large" type="primary" @click="addComment">发表评论</mt-button>
					</div>
				</div>
				<div class="mui-card-footer">红红火火恍恍惚惚</div>
			</div>
    <!--评论列表-->
		<div class="mui-card">
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<div class="cmt-list">
						  <div class="cmt-item" v-for="(item,i) of list">
							  <div>第{{i+1}}楼 发表时间：{{item.ctime | datetimeFilter}}</div>
								<div>评论内容:{{item.content}}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
     <!--评论列表end-->
 </div>
</template>
<script>
 import{Toast} from "mint-ui"
export default {
  data() {
    return {
     list:[],   //吐槽内容
		 pno:0,      //页码
		 pageSize:5,  // 页大小

      nid:this.$route.query.nid,
      info:{},
			msg:"", 
    }
  },
  created() {
   this.findNewsInfo(),
	 this.loadMore()
  },
  methods:{
		loadMore(){
      this.pno++;
			var ps=this.pageSize;
			var reg=/^[0-9]{1,}$/;
			if(!reg.test(this.pno)){
				Toast("页码格式不正确");
				return; 
			};
     var url = "http://127.0.0.1:3000";
        url+="/getComment?nid="+this.nid;
        url+="&pno="+this.pno;
        //6:获取返回内容
        this.axios.get(url).then(result=>{
         this.list=result.data.data
          
        })
		},
     // 吐槽
		 addComment(){
     var nid=this.nid
		 var con=this.msg
		 // trim() 去除评论两端的空格 
     var size =con.trim().length;
		 if(size==0){
			 Toast("请输入吐槽内容~")
			 return
		 }
		 // 创建 nid 的评论内容
		 var postData=this.qs.stringify({
			   nid:nid,
				 content:con
		 });
	     var url = "http://127.0.0.1:3000";
        url+="/addcomment";
        this.axios.post(url,postData).then(result=>{
        //8:获取返回结果
        Toast("添加成功");
        this.msg = "";   //清空评论后文本框内容
				this.pno=0;    //清空页码
				this.list=[];   //清空原有数据
				this.loadMore(); //第一页
        })
		 },

    findNewsInfo(){
     var url="http://127.0.0.1:3000/newsInfo?nid="+this.nid
     this.axios.get(url).then(result=>{
       this.info=result.data.data[0]
     })
    }
  },
}
</script>
<style lang="">
  
</style>