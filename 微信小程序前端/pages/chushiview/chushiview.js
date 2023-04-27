// pages/chushiview/chushiview.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    tbname:'',//厨师姓名
    tblevel:'',//厨师级别
    tbcontents:'',
    imgurl:'',
    tbgood:'',
    liuyanlist:[],
    key:'',
    cid:0
  },
  
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that=this;
     console.log(options.id);
     var id=options.id;
     that.setData({
       cid:id
     });
     that.fnbindata(id);

  },
  fnbindata:function(id){
    var that=this;
    wx.request({
      url: 'http://localhost:8000/dcapi/getchushibyid',
      method: 'POST',
      data: {
        id: id
      },
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      dataType: 'json',
      success(cc) {
        console.log(cc.data);
        that.fngetliuyandata();
        that.setData({
          id:cc.data[0].id,
          tblevel:cc.data[0].tblevel,
          tbname: cc.data[0].tbname,
          tbgood: cc.data[0].tbgood,
          tbcontents: cc.data[0].tbcontents,
          imgurl:"http://localhost:8000/static/uploadimg/"+cc.data[0].imgurl
        });
      }
    });
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },
  
  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },


  // 留言输入模块开始
  liuyantext:function(e){
    var that=this;
    console.log(e.detail.value);
    that.setData({
      text:e.detail.value
    });
  },

  liuyansb:function(e){
    var that=this;
      var text= this.data.text;
      var currentusertruename = wx.getStorageSync("currentusertruename");
      var currentuserid = wx.getStorageSync("currentuserid");
      console.log(text);
      console.log(currentusertruename);

      if(currentusertruename.length<1)
      {
          
        wx.showToast({
          title: '你还没有登录',
          icon:'none'
        });
        setTimeout(function(){
          wx.navigateTo({
            url: '/pages/login/login'
          });
        },2000);        
      }
      else
    {
      
      wx.request({
        url: 'http://127.0.0.1:8000/dcapi/getliuyanlist',//从前端获取输入的留言插入数据库
        method: 'POST',
        data: {
          text: that.data.text,
          truename:currentusertruename,
          userid:currentuserid
        },
        header: {
          'content-type': 'application/x-www-form-urlencoded' // 默认值
        },
        dataType: 'json',
        success(cc) {
          console.log(cc.data);
          var id=that.data.cid;
          that.fnbindata(id);

          wx.showToast({
            title: '提交成功!'
          });
        }
      });

    } 
  },
  // 留言输入模块结束

  // 留言列表模块开始

  // 点击留言的函数：
  // fngotoliuyanview:function(ex){
  //   var id=ex.currentTarget.dataset.id;
  //   wx.navigateTo({
  //     url: '/pages/foodview/foodview?id='+id,
  //   })
  // },
  
  fngetliuyandata:function()
  {
    var that=this;
    var key=getApp().globalData.key;
    if(key==undefined||key==null||key=="undefined")
    {
      key="";
    }
    wx.request({
      url: 'http://localhost:8000/dcapi/All_liuyanlist',//从数据库获取留言
      method: 'POST',
      data: {
        key:key
      },
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      dataType: 'json',
      success(cc) {
        console.log(cc.data);
        that.setData({
          liuyanlist:cc.data//把后端查询出来的菜品列表信息存放到foodlist数组中
        });
      }
    });
  },
    // 留言列表模块结束
})