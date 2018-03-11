<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sou.aspx.cs" Inherits="sou" %>

<!DOCTYPE html>
<html>
 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查询结果</title>
    <style type="text/css">
         #header
    {
        height:100px;
    } 
    #logo
    {
        width :250px;
        float :left ;
    }
    #menu
    {
        height :100px;
        float :right ;
    }
    #menu ul
    {
        margin :0;
        padding :60px 20px 0 0;
        list-style :none;
        
    }
    #menu li
    {
        display :inline ;
    }
    #menu li a
    {
        float :left ;
        margin:0 0 0 2px;
        width :120px;
        height :25px;
        padding :9px 0 0 0;
        text-decoration :none;
        text-align:left ;
        font-size:1.1em;
        font-weight :bold ;
        color :White   ;
        background-color :#FF6602;
    }
    #menu a:hover
    {
        color :Black ;
        background-color :#ffff00;
    }
    .top
    {
        margin :0;
        padding :0;
        background-color :Gray ;
        height :20px;
    }
    .top p
    {
        height :20px;
        text-align :left ;
        font-size:14px;
        color :#000000;
        background-color :Gray ;
    }
    .top a
    {
        
    }
        .style1
        {
            font-size: large;
            color: #993333;
        }
        .style2
        {
            width: 52%;
        }
        .style3
        {
            width: 259px;
        }
        
   .footer
   {
       padding :5px 0;
       background:gray;
   }
   .footer p
   {
       text-align :center ;
       font-size :14px;
       color :#000000;
   }
   .footer a
   {
       color :#ffffff;
   }
   body
   {
       margin :0;
       padding :0;
   }
    </style>
</head>
 
<body >
    <form id="form1" runat="server">
    <div class ="top">
<p>欢迎来到中国旅行社</p>
</div>

<div id ="header">
    <div id ="logo">
<img src ="image/logo.png"  alt =""  height ="100px" width ="250px"/>
    </div>

<div id ="menu">
<ul >
<li><a href ="shouye.aspx" >首页</a></li>
<li ><a href ="aboutus.aspx" >关于我们</a></li>
<li><a href ="http://www.12306.com" >火车票预定</a></li>
<li ><a href ="http://www.xiecheng.com">飞机票预定</a></li>
<li ><a href ="#ayunnan" >热门线路</a></li>
<li ><a href ="denglu.aspx" >登录/注册</a></li>
</ul>
</div>
</div>
    <strong>
    <br />
    <br />
    </strong><span class="style1"><strong>搜索结果为：<br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
        SelectCommand="SELECT * FROM [line1]"></asp:SqlDataSource>
    <br />
    </strong>
    </span>
    <table class="style2">
        <tr>
            <td class="style3">
                <asp:Table ID="image" runat="server">
                </asp:Table>
            </td>
            <td>
                <asp:Table ID="jieshao" runat="server" HorizontalAlign="Center">
                </asp:Table>
            </td>
        </tr>
    </table>
<br/>

<div  class ="footer">
<p>总部地址：河北工业大学<br/><br/>版权所有：网络C144 王晓玥<br/><br/>联系方式：244413000</p>
</div>
    </form>
</body>
 
</html>