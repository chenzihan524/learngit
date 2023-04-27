// pages/liuyan/liuyan.js
Page({

  /**
   * 页面的初始数据
   */
  data: {

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

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
        url: 'http://127.0.0.1:8000/dcapi/getliuyanlist',
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
          wx.showToast({
            title: '下单成功!'
          });
          wx.switchTab({
            url: '/pages/my/my',
          })
        }
      });

    } 
  },
  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})
