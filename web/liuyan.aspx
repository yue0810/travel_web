<%@ Page Language="C#" AutoEventWireup="true" CodeFile="liuyan.aspx.cs" Inherits="liuyan" %>

<!DOCTYPE html>

<html>
<head>
<meta content ="text/html" ;charset="utf-8" />
<title>查询线路</title>
<style type ="text/css" >
    #header
    {
        height:100px;
    } 
    #logo
    {
        width :50px;
        float :left ;
    }
    #menu
    {
        width :650px;
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
    .zhongbu
    {
        height:600px;
    }
    .imglugai
    {
        width :1000px;
        height :30px;
        padding-bottom :40px;
        padding-left :250px;
        padding-top :40px;
    }
    .imglugai img
    {
        width :322px;
        height :112px;
    }
    .text
    {
        height: 620px;
        width: 1100px;
        float :right 
    }
    body
    {
        background-image :url(image/背景.png);
        padding :0;
        margin :0;
    }
    .sidebar
   {
       float:left;
       width :200px;
       height :620px;
       background-color :#FF6602;
   }
   .sidebar ul
   {
       margin :0;
       padding :0;
       list-style :none;
       line-height :normal ;
   }
   .sidebar li
   {
   }
   .sidebar li ul
   {
   }
   .sidebar li li
   {
       padding :6px 0 6px 10px;
       border-bottom :1px solid #373B41;
   }
   .sidebar li li a
   {
       text-decoration :none;
       color :White ;
   }
   .sidebar li li a:hover
   {
       color :#8e2323;
   }
   .sidebar li h2
   {
       
        font-weight :bold ;
       color :White ;
       padding-top :0px;
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
    .style1
    {
        font-size: large;
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
<div id ="header">
    <div id ="logo">
<img src ="image/logo.png"  alt =""  height ="100px" width ="250px"/>
    </div>

<div id ="menu">
<ul >
<li><a href ="#xianlu" >线路管理</a></li>
<li ><a href ="#yonghu" >用户管理</a></li>
<li><a href ="#renyuan" >人员管理</a></li>
<li ><a href ="window.close();" >退出</a></li>
</ul>
</div>
</div>

<div class ="imglugai">
<img src ="image/线路查询.png" alt ="" />
</div>

<br /><br /><br /><br />

<div class ="zhongbu">

<div class ="text">
  
    <asp:Label ID="xianshi" runat="server" 
        style="font-size: large; font-weight: 700"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="chakan" runat="server" 
        style="color: #FFFFFF; font-size: large; background-color: #973F43" 
        Text="查看" onclick="chakan_Click" />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
        SelectCommand="SELECT * FROM [liuyan]"></asp:SqlDataSource>
    <br />
    <asp:Panel ID ="xian" runat ="server" >
    <strong><span class="style1">请选择用户&nbsp; </span></strong>
    <asp:DropDownList ID="yonghu" runat="server" 
        style="font-size: large" AutoPostBack="True" ondatabound="yonghu_DataBound" 
            onselectedindexchanged="yonghu_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
    <br />
    <span class="style1"><strong>消息：</strong></span><br />
    <asp:TextBox ID="txtxian" runat="server" Height="116px" 
        style="font-size: large" TextMode="MultiLine" Width="278px"></asp:TextBox>
&nbsp;&nbsp;
    <asp:Button ID="chuli" runat="server" 
        style="color: #FFFFFF; font-size: large; background-color: #973F43" 
        Text="已处理" onclick="chuli_Click" />
  </asp:Panel>
</div>


<div  id ="lay" class ="sidebar" style="left" >
<ul >
   <li >
    <a name="yonghu"><h2 >用户管理</h2></a>
    <ul  type="disc">
        <li ><strong ><a href ="yonghu.aspx" >查询/删除</a></strong></li>
        <li ><strong ><a href ="yonghu.aspx" >增加/修改</a></strong></li>
        <li ><strong ><a href ="liuyan.aspx" >留言处理</a></strong></li>

    </ul>        
   </li>
  <li>
    <a name="xianlu">"<h2 >线路管理</h2></a> 
    <ul type="disc">
        <li ><a href ="selectxianlu.aspx" >查询</a></li>
        <li ><a href ="xianlu.aspx" >修改/添加</a></li>
    </ul>
   </li>
   <li>
    <a name ="renyuan">"<h2 >游客管理</h2></a> 
    <ul type="disc">
        <li ><a href ="selectyouke.aspx" >查询</a></li>
        <li ><a href ="addyouke.aspx" >添加/修改</a></li>
    </ul>
   </li>
   <li >
   <h2 >退出登录</h2>
   <ul type="disc">
   <li ><a href ="shouye.aspx" >退出</a></li>
   </ul>
   </li>
</ul>
</div>
</div>

<br /><br /><br />
<div  class ="footer">
<p>总部地址：河北工业大学<br/><br/>版权所有：网络C144 王晓玥<br/><br/>联系方式：244413000</p>
</div>
    </form>
</body>
</html>
