// pages/reg/reg.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    username:'',
    password:'',
    tel:'',
    address:'',
    truename:''
  },
  fnback:function(){
    wx.navigateBack({
      
    });
  },
  fnreg:function(){
    var that = this;
    wx.request({
      url: 'http://localhost:8000/dcapi/reg',//注册请求
      method: 'POST',
      data: {
        username: that.data.username,
        password: that.data.password,
        tel: that.data.tel,
        address: that.data.address,
        truename: that.data.truename
      },
      header: {
        'content-type': 'application/x-www-form-urlencoded' // 默认值
      },
      dataType: 'json',
      success(cc) {
        console.log(cc.data);
        wx.showToast({
          title: '注册成功'
        });
        setTimeout(function(){
          wx.navigateBack({

          });
        },2000);
      }
    });
  },
  fninputedittruename:function(e){
    var that = this;
    var curvalue = e.detail.value;
    that.setData({
      truename: curvalue
    });
  },
  fninputeditusername: function (e) {
    var that = this;
    var curvalue = e.detail.value;
    that.setData({
      username: curvalue
    });
  },
  fninputeditpassword: function (e) {
    var that = this;
    var curvalue = e.detail.value;
    that.setData({
      password: curvalue
    });
  },
  fninputedittel: function (e) {
    var that = this;
    var curvalue = e.detail.value;
    that.setData({
      tel: curvalue
    });
  },
  fninputeditaddress: function (e) {
    var that = this;
    var curvalue = e.detail.value;
    that.setData({
      address: curvalue
    });
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

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})