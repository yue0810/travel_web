<%@ Page Language="C#" AutoEventWireup="true" CodeFile="selectyouke.aspx.cs" Inherits="selectyouke" %>

<!DOCTYPE html>

<html>
<head>
<meta content ="text/html" ;charset="utf-8" />
<title>已报人员管理</title>
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
<li><a href ="#renyuan" >游客管理</a></li>
<li ><a href ="denglu.aspx" >退出</a></li>
</ul>
</div>
</div>

<div class ="imglugai">
<img src ="image/游客查询.png" alt ="" />
</div>

<br /><br /><br /><br />

<div class ="zhongbu">

<div class ="text">
    <br />
    <span class="style1"><strong>请选择线路：<asp:DropDownList ID="dpline" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="线路" DataValueField="线路" 
        ondatabound="dpline_DataBound" 
        onselectedindexchanged="dpline_SelectedIndexChanged" 
        style="font-size: large" AutoPostBack="True">
    </asp:DropDownList>
    <br />
    <br />
    请选择日期：<asp:DropDownList ID="dpdate" runat="server" 
        style="font-size: large" AutoPostBack="True">
    </asp:DropDownList>
    <br />
    <br />
    请输入姓名：</strong></span><asp:TextBox ID="txtname" 
        runat="server" style="font-size: large"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnselect" runat="server" 
        style="font-size: large; color: #FFFFFF; background-color: #8E2323;" 
        Text="查询" onclick="btnselect_Click" />
    <br />
    <br />
    <br />
    <strong><span class="style1">查询条件：</span><asp:RadioButtonList ID="fangxing" 
        runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" 
        style="font-size: large">
        <asp:ListItem>家庭房</asp:ListItem>
        <asp:ListItem>大床房</asp:ListItem>
        <asp:ListItem>双人标间</asp:ListItem>
    </asp:RadioButtonList>
    </strong>
    <br />
    <br />
    <br />
    <strong><span class="style1">查询结果：<br />
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" style="font-size: large">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />
    <br />
    <asp:Button ID="down" runat="server" onclick="down_Click" 
        style="font-size: large; color: #FFFFFF; background-color: #8E2323" Text="完成" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
        SelectCommand="SELECT * FROM [line1]"></asp:SqlDataSource>
    <br />
    </span></strong><br />
    <br />
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
