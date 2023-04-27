//index.js
//获取应用实例
const app = getApp()

Page({
  data: {
    foodlist:[],
    cookerlist:[],
    lunbolist:[]
  },
  fnsearch:function(e){
    getApp().globalData.key=e.detail.value;
    wx.switchTab({
      url: '/pages/foodlist/foodlist',
    });
  },
  fngotofoodview:function(ex){
    //通过点击事件里面的事件对象e获取组件上面绑定的属性值，这些属性属于自定义属性，必须以data-开头。
    var id=ex.currentTarget.dataset.id;
    wx.navigateTo({
      url: '/pages/foodview/foodview?id='+id,
    })

  },
  fngotochushiview:function(ex){
    //通过点击事件里面的事件对象e获取组件上面绑定的属性值，这些属性属于自定义属性，必须以data-开头。
    var id=ex.currentTarget.dataset.id;
    wx.navigateTo({
      url: '/pages/chushiview/chushiview?id='+id,
    })

  },
  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  fngotomyorder:function(){
    wx.navigateTo({
      url: '/pages/myorder/myorder'
    });
  },
  onLoad: function () {//页面加载的时候执行
    console.log(app.globalData.username)
    console.log(app.globalData.sex)
  },
  onShow:function(){
    this.fngetfoodlist();
    //this.fngetcookerlist();
    

  },
  fngetfoodlist:function(){
    var that=this;
      //在此处编写请求首页菜品数据的逻辑代码
    wx.request({
      url: 'http://localhost:8000/dcapi/getfoodlistbyrandom',
      method: 'POST',
      data: {
        
      },
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      dataType: 'json',
      success(cc) {
        console.log(cc.data);
        that.setData({
          foodlist:cc.data[0].foodlist,//把后端查询出来的菜品列表信息存放到foodlist数组中
          lunbolist:cc.data[0].lunbolist,
          chushilist:cc.data[0].chushilist,
        });
        
      }
    });
  },
  fngetcookerlist:function(){
    var that=this;
      //在此处编写请求首页菜品数据的逻辑代码
    wx.request({
      url: 'http://localhost:8000/dcapi/getfoodlistbyrandom',
      method: 'POST',
      data: {
        
      },
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      dataType: 'json',
      success(cc) {
        console.log(cc.data);
        that.setData({
          foodlist:cc.data//把后端查询出来的菜品列表信息存放到foodlist数组中
        });
      }
    });
  },
  //点击咖啡师图标跳转
  fngotochushilist1:function(e){
    wx.navigateTo({
      url: '/pages/chushilist/chushilist'
    })
  },
  //点击咖啡屋图标跳转
  fngotofoodlist1:function(e){
    wx.navigateTo({
      url: '/pages/foodlist/foodlist'
    })
  },

  
  getUserInfo: function(e) {
    
  }
})
