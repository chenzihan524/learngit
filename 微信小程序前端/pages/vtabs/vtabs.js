Page({
  data: {
    vtabs: [],
    vtabcontents:[],
    activeTab: 0,
  },

  onLoad() {
    const titles = ['特色推荐', '川菜', '粤菜',
      '湘菜',  '生活美食', '其他菜品']
    const vtabs = titles.map(item => ({title: item}))
    var vtabcontents=[
      {
          "id":"1",
          "prolist":[
              {
                  "pid":"1",
                  "pname":"肉丝1",
                  "imgurl":""
              },
              {
                  "pid":"2",
                  "pname":"肉丝2"
              },
              {
                  "pid":"3",
                  "pname":"肉丝3"
              },{
                "pid":"4",
                "pname":"肉丝4"
            }]
      },
      {
          "id":"2",
          "prolist":[
              {
                  "pid":"1",
                  "pname":"肉丝1"
              },
              {
                  "pid":"2",
                  "pname":"肉丝2"
              }]
      },
      {
          "id":"3",
          "prolist":[
              {
                  "pid":"1",
                  "pname":"肉丝1"
              },
              {
                  "pid":"2",
                  "pname":"肉丝2"
              }]
      },
      {
          "id":"4",
          "prolist":[
              {
                  "pid":"1",
                  "pname":"肉丝1"
              },
              {
                  "pid":"2",
                  "pname":"肉丝2"
              }]
      },
      {
          "id":"5",
          "prolist":[
              {
                  "pid":"1",
                  "pname":"肉丝1"
              },
              {
                  "pid":"2",
                  "pname":"肉丝2"
              }]
      },
      {
          "id":"6",
          "prolist":[
              {
                  "pid":"1",
                  "pname":"肉丝1"
              },
              {
                  "pid":"2",
                  "pname":"肉丝2"
              }]
      }]
  
    this.setData({
      vtabs:vtabs,
      vtabcontents:vtabcontents
    });
  },

  onTabCLick(e) {
    const index = e.detail.index
    console.log('tabClick', index)
  },

  onChange(e) {
    const index = e.detail.index
    console.log('change', index)
  }

})
