import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
import Login from "./components/tabbar/Login.vue"
import Home from "./components/tabbar/Home.vue"
import text from "./components/text.vue"
import GoodList from "./components/tabbar/GoodList.vue"
import NewsList from "./components/home/NewsList.vue"
import NewsInfo from "./components/home/NewsInfo.vue"
import ShopCart from "./components/home/ShopCart.vue"
import GoodInfo from  "./components/tabbar/GoodInfo.vue"
import success from  "./components/tabbar/success.vue" 
//1.引入Text组件
Vue.use(Router)

//2 为Test组件配置访问路径 /Text
export default new Router({
  routes: [
    {path:'/success',component:success},
    {path:'/GoodInfo', component:GoodInfo},
    {path:'/ShopCart',component:ShopCart},
    {path:'/NewsInfo',component:NewsInfo},
    {path:'/NewsList',component:NewsList},
    {path:'/GoodList',component:GoodList},
    {path:'/text',component:text},
    {path:'/',component:HelloContainer},
    {path:"/Login",component:Login},
    {path:"/Home",component:Home}
  ]
})
