from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.views.decorators.clickjacking import xframe_options_exempt
from django.http import HttpResponse
import pymysql
import datetime
import os

conn=pymysql.connect(
    user='root',
    password='123456',
    port=3307,
    host='127.0.0.1',
    db='myshop',
    charset='utf8'
)
cursor=conn.cursor()
cursor.execute('set names utf8')
cursor.execute('set autocommit=1')




@xframe_options_exempt
def getfoodbyid(request):
    id= request.POST.get("id")
    strsql = "select id,proname,price,brief,descriptions,istop,isstar,imgurl,typeid from tbproduct where id="+id
    cursor.execute(strsql)
    conn.commit()
    foodlist = []
    row = cursor.fetchone()
    if row:
        foodlist.append({"id": row[0], "proname": row[1], "price":str(row[2]), "brief": row[3], "descriptions": row[4],"istop": row[5],"isstar": row[6],"imgurl": row[7],"typeid": row[8]})
    s = str(foodlist)
    s = s.replace("'", "\"")
    response = HttpResponse(s)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

@xframe_options_exempt
def getchushibyid(request):
    id= request.POST.get("id")
    strsql = "select id,tbname,tblevel,tbgood,tbcontents,imgurl from tbchushi where id="+id
    cursor.execute(strsql)
    conn.commit()
    chushilist = []
    row = cursor.fetchone()
    if row:
        chushilist.append({"id": row[0], "tbname": row[1], "tblevel":row[2], "tbgood": row[3], "tbcontents": row[4],"imgurl": row[5]})
    s = str(chushilist)
    s = s.replace("'", "\"")
    response = HttpResponse(s)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

@xframe_options_exempt
def getfoodlist(request):
    key= request.POST.get("key")
    strsql = "select id,proname,price,brief,descriptions,istop,isstar,imgurl,typeid from tbproduct order by id desc "
    if not key.strip()=="":
        strsql = "select id,proname,price,brief,descriptions,istop,isstar,imgurl,typeid from tbproduct where proname like '%"+key+"%'  order by id desc "
    cursor.execute(strsql)
    conn.commit()
    foodlist = []
    row = cursor.fetchone()
    while row:
        foodlist.append({"id": row[0], "proname": row[1], "price":str(row[2]), "brief": row[3], "descriptions": row[4],"istop": row[5],"isstar": row[6],"imgurl": row[7],"typeid": row[8]})
        row = cursor.fetchone()
    s = str(foodlist)
    s = s.replace("'", "\"")
    response = HttpResponse(s)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

@xframe_options_exempt
def getchushilist(request):
    key= request.POST.get("key")
    strsql = "select id,tbname,tblevel,tbgood,tbcontents,imgurl from tbchushi order by id desc "
    if not key.strip()=="":
        strsql = "select id,tbname,tblevel,tbgood,tbcontents,imgurl from tbchushi where tbname like '%"+key+"%'  order by id desc "
    cursor.execute(strsql)
    conn.commit()
    chushilist = []
    row = cursor.fetchone()
    while row:
        chushilist.append({"id": row[0], "tbname": row[1], "tblevel":row[2], "tbgood": row[3], "tbcontents": row[4],"imgurl": row[5]})
        row = cursor.fetchone()
    s = str(chushilist)
    s = s.replace("'", "\"")
    response = HttpResponse(s)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

@xframe_options_exempt
def getmylist(request):
    order= request.POST.get("order")
    strsql = "select id,orderid,proid,proname,price,procount,imgurl from v_order where memberid = 2 order by id desc "
    if not order.strip()=="":
        strsql = "select id,proname,price,brief,descriptions,istop,isstar,imgurl,typeid from tbproduct where proname like '%"+order+"%'  order by id desc "
    cursor.execute(strsql)
    conn.commit()
    mylist = []
    row = cursor.fetchone()
    while row:
        mylist.append({"id": row[0], "orderid": row[1], "proid":str(row[2]), "proname": row[3], "price": row[4],"procount": row[5],"imgurl": row[6]})
        row = cursor.fetchone()
    s = str(mylist)
    s = s.replace("'", "\"")


    response = HttpResponse(s)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

@xframe_options_exempt
def getfoodlistbyrandom(request):
    strsql = "select id,proname,price,brief,descriptions,istop,isstar,imgurl,typeid from tbproduct order by  RAND() limit 4 "
    cursor.execute(strsql)
    conn.commit()
    foodlist = []
    row = cursor.fetchone()
    while row:
        foodlist.append({"id": row[0], "proname": row[1], "price":str(row[2]), "brief": row[3], "descriptions": row[4],"istop": row[5],"isstar": row[6],"imgurl": row[7],"typeid": row[8]})
        row = cursor.fetchone()
    s = str(foodlist)
    s = s.replace("'", "\"")

    strsql3 = "select id,imgurl from uilunbo order by  RAND() limit 3 "
    cursor.execute(strsql3)
    conn.commit()
    lunbolist = []
    row = cursor.fetchone()
    while row:
        lunbolist.append({"id": row[0], "imgurl": row[1]})
        row = cursor.fetchone()
    sppt = str(lunbolist)
    sppt = sppt.replace("'", "\"")

    strsql4 = "select id,imgurl,tbname,tblevel,tbgood from tbchushi order by  RAND() limit 4 "
    cursor.execute(strsql4)
    conn.commit()
    chushilist = []
    row = cursor.fetchone()
    while row:
        chushilist.append({"id": row[0], "imgurl": row[1], "tbname": row[2], "tblevel": row[3], "tbgood": row[4]})
        row = cursor.fetchone()
    tchushi = str(chushilist)
    tchushi = tchushi.replace("'", "\"")

    sresult = "[{\"foodlist\":"+s+",\"lunbolist\":" + sppt + ",\"chushilist\":" + tchushi + "}]"
    response = HttpResponse(sresult)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

def login(request):
    #print("接收到的参数typeid="+str(request.GET.get("typeid")))
    username=request.POST.get("username")
    password = request.POST.get("password")
    print(username)
    print(password)
    strsql="select id,username,password,truename,tel,address from tbusers where username='"+username+"' and password='"+password+"' "
    cursor.execute(strsql)
    conn.commit()
    row = cursor.fetchone()
    s=""
    if row:
        s=str({"id": row[0], "username": row[1], "password": row[2], "truename": row[3], "tel": row[4], "address": row[5]})
        s=s.replace("'","\"")
    res="["+s+"]"
    response=HttpResponse(res)
    response["Access-Control-Allow-Origin"] ="*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

def reg(request):
    username=request.POST.get("username")
    password = request.POST.get("password")
    tel = request.POST.get("tel")
    address = request.POST.get("address")
    truename = request.POST.get("truename")
    #strsql = "insert into tbusers (username,password,truename,tel,address) values ('"+username+"','"+password+"','"+truename+"','"+tel+"','"+address+"')";
    # cursor.execute(strsql)
    cursor.execute('insert into tbusers (username,password,truename,tel,address) value (%s,%s,%s,%s,%s)',(username,password,truename,tel,address))
    conn.commit()
    s="{\"msg\":\"注册成功\"}"
    res="["+s+"]"
    response=HttpResponse(res)
    response["Access-Control-Allow-Origin"] ="*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

def addtocar(request):
    #接收参数
    userid = request.POST.get('userid')
    proid = request.POST.get('proid')
    proname = request.POST.get('proname')
    procount = request.POST.get('procount')
    imgurl = request.POST.get('imgurl')
    price = request.POST.get('price')

    ctime = datetime.datetime.now().strftime('%F %T')
    #我们将一个菜品加入购物车的时候，首先要判断购物车里面是否已经存在这个菜品了，如果已经存在，就增加数量，如果不存在，就插入一条新的记录。
    strsql1="select id from tbshoppingcar where proid="+proid+" and sessionid="+userid
    cursor.execute(strsql1)
    conn.commit()
    row=cursor.fetchone()
    strsql2 = "insert into tbshoppingcar(sessionid,proname,proid,procount,ctime,imgurl,price) values ("+userid+",'"+proname+"',"+proid+","+procount+",'"+ctime+"','"+imgurl+"',"+price+") "
    if row:
        strsql2="update tbshoppingcar set procount=procount+"+procount+" where proid="+proid+" and sessionid="+userid
    print(strsql2)
    cursor.execute(strsql2)
    conn.commit()
    s = "{\"msg\":\"ok\"}"
    res = "[" + s + "]"
    response = HttpResponse(res)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

@xframe_options_exempt
def getcarlist(request):
    userid= request.POST.get("userid")
    strsql = "select id,sessionid,proname,proid,procount,ctime,imgurl,price from tbshoppingcar where sessionid="+userid
    cursor.execute(strsql)
    conn.commit()
    foodlist = []
    row = cursor.fetchone()
    while row:
        foodlist.append({"id": row[0], "sessionid": row[1], "proname":row[2], "proid": row[3], "procount": row[4],"ctime": row[5],"imgurl": row[6],"price":str(row[7])})
        row = cursor.fetchone()
    s = str(foodlist)
    s = s.replace("'", "\"")
    response = HttpResponse(s)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

@xframe_options_exempt
def deleteitembyid(request):
    id= request.POST.get("id")
    strsql = "delete from tbshoppingcar where id="+id
    cursor.execute(strsql)
    conn.commit()
    s = "{\"msg\":\"ok\"}"
    res = "[" + s + "]"
    response = HttpResponse(s)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

def changecarnum(request):
    id= request.POST.get("id")
    typeid = request.POST.get("typeid")
    strsql = "update tbshoppingcar set procount=procount+1 where id=" + id
    if typeid=="0":
        strsql = "update tbshoppingcar set procount = IF(procount > 1, procount - 1,1) where id=" + id
    cursor.execute(strsql)
    conn.commit()
    s = "{\"msg\":\"ok\"}"
    res = "[" + s + "]"
    response = HttpResponse(s)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response
#在线下单功能
@xframe_options_exempt
def saveorder(request):
    t = datetime.datetime.now()
    ctime = t.strftime('%Y-%m-%d %H:%M:%S')
    orderid = datetime.datetime.strftime(t, "%Y%m%d%H%M%S%f")
    userid= request.POST.get("userid")
    sumprice = request.POST.get("sumprice")
    sname = request.POST.get("sname")
    stel = request.POST.get("stel")
    saddress = request.POST.get("saddress")
    ptime = request.POST.get("ptime")
    memo = request.POST.get("memo")
    #插入表头信息
    cursor.execute("insert into tborderhead (orderid,sname,stel,saddress,sumprice,memberid,ctime,ptime,memo) values ('"+orderid+"','"+sname+"','"+stel+"','"+saddress+"',"+sumprice+","+userid+",'"+ctime+"','"+ptime+"','"+memo+"')")
    conn.commit()

    #把购物车里面的数据插入到订单明细表
    #先把购物车里当前这个人的菜品查询出来
    strsql = "select id,sessionid,proname,proid,procount,ctime,imgurl,price from tbshoppingcar where sessionid="+userid
    cursor.execute(strsql)
    conn.commit()
    #构造插入订单明细表的sql语句
    sqllists = []
    row = cursor.fetchone()
    while row:
        #{"id": row[0], "sessionid": row[1], "proname": row[2], "proid": row[3], "procount": row[4], "ctime": row[5],"imgurl": row[6], "price": str(row[7])}
        sqllists.append("insert into tborderitems (orderid,proid,proname,price,procount,imgurl) values ('"+orderid+"',"+str(row[3])+",'"+row[2]+"',"+str(row[7])+","+str(row[4])+",'"+row[6]+"')")
        row = cursor.fetchone()
    #遍历sql列表，执行插入订单明细表操作
    for sqlitem in sqllists:
        cursor.execute(sqlitem)
        conn.commit()
    #清空购物车
    cursor.execute("delete from tbshoppingcar where sessionid="+userid)
    conn.commit()
    s = "{\"msg\":\"ok\"}"
    res = "[" + s + "]"
    response = HttpResponse(s)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

@xframe_options_exempt
def getorderlist(request):
    userid= request.POST.get("userid")
    strsql = "select id,orderid,sname,stel,saddress,sumprice,memberid,ctime,ptime,memo,proname,proid,procount,imgurl,price from v_order where memberid="+userid
    cursor.execute(strsql)
    conn.commit()
    orderlist = []
    row = cursor.fetchone()
    while row:
        orderlist.append({"id": row[0], "orderid": row[1], "sname":row[2], "stel": row[3], "saddress": row[4],"sumprice": str(row[5]),"memberid": str(row[6]),"ctime":row[7],"ptime":row[8],"memo":row[9],"proname":row[10],"proid":row[11],"procount":row[12],"imgurl":row[13],"price":str(row[14])})
        row = cursor.fetchone()
    s = str(orderlist)
    s = s.replace("'", "\"")
    response = HttpResponse(s)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

# 留言前端传入数据库:
@xframe_options_exempt
# 此函数为前端留言写入数据库
def getliuyanlist(request):
    userid = request.POST.get("userid")
    truename = request.POST.get("truename")
    text = request.POST.get("text")

    strsql = "insert into tbliuyan (userid,truename,text) values ("+userid+",'"+truename+"','"+text+"')";
    cursor.execute(strsql)
    conn.commit()
    s="{\"msg\":\"留言成功\"}"
    res="["+s+"]"
    response=HttpResponse(res)
    response["Access-Control-Allow-Origin"] ="*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response

# 此函数为后端从数据库调出留言到前端以列表显示
@xframe_options_exempt
def All_liuyanlist(request):
    key= request.POST.get("key")
    strsql = "select id,truename,text from tbliuyan order by id desc "
    if not key.strip()=="":
        strsql = "select id,truename,text from tbliuyan where proname like '%"+key+"%'  order by id desc "
    cursor.execute(strsql)
    conn.commit()
    liuyanlist = []
    row = cursor.fetchone()
    while row:
        liuyanlist.append({"id": row[0], "truename": row[1], "text":row[2]})
        row = cursor.fetchone()
    s = str(liuyanlist)
    s = s.replace("'", "\"")
    response = HttpResponse(s)
    response["Access-Control-Allow-Origin"] = "*"
    response["Access-Control-Allow-Headers"] = "Content-Type"
    response["Access-Control-Allow-Methods"] = "DELETE, PUT, POST"
    return response



