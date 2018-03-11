<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yonghu.aspx.cs" Inherits="yonghu" %>

<!DOCTYPE html><html>
<head>
<meta content ="text/html" ;charset="utf-8" />
<title>用户管理</title>
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
<img src ="image/用户信息管理.png" alt ="" />
</div>

<br /><br /><br /><br />

<div class ="zhongbu">

<div class ="text">
    <br />
    <span class="style1"><strong>请输入昵称：<asp:TextBox ID="selname" runat="server" 
        style="font-size: large"></asp:TextBox>
&nbsp;
    <asp:Button ID="btnselect" runat="server" 
        style="font-size: large; color: #FFFFFF; background-color: #8E2323;" 
        Text="查询" onclick="btnselect_Click" CausesValidation="False" />
    <br />
    <br />
    结果：<br />
    <br />
    昵称：</strong></span>&nbsp;&nbsp; 
    <asp:TextBox ID="txtnicheng" runat="server" style="font-size: large"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="*" ControlToValidate="txtnicheng" Display="Dynamic" 
        ForeColor="Red" style="font-size: large"></asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    <strong><span class="style1">权限：</span><asp:RadioButtonList ID="quanxian" 
        runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" 
        style="font-size: large">
        <asp:ListItem>用户</asp:ListItem>
        <asp:ListItem Value="管理员"></asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <br />
    </strong>
    <br />
    <span class="style1"><strong>密码：</strong></span>&nbsp;&nbsp; 
    <asp:TextBox ID="txtpsw" runat="server" style="font-size: large"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="*" ControlToValidate="txtpsw" Display="Dynamic" 
        ForeColor="Red" style="font-size: large"></asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    <span class="style1"><strong>确认密码：</strong> </span> <asp:TextBox ID="txtpsw2" 
        runat="server" CssClass="style1"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="*" ControlToValidate="txtpsw2" ForeColor="Red" 
        CssClass="style1"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ErrorMessage="密码输入不一致" ControlToCompare="txtpsw" 
        ControlToValidate="txtpsw2" Display="Dynamic" ForeColor="Red" 
        CssClass="style1"></asp:CompareValidator>
    <br class="style1" />
    <br class="style1" />
    <br class="style1" />
    <span class="style1"><strong>联系方式：</strong> </span> <asp:TextBox ID="txtphone" 
        runat="server" CssClass="style1"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="*" ControlToValidate="txtphone" ForeColor="Red" 
        CssClass="style1"></asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnadd" runat="server" 
        style="font-size: large; color: #FFFFFF; background-color: #8E2323;" 
        Text="添加" onclick="btnadd_Click" />
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnupdate" runat="server" 
        style="font-size: large; color: #FFFFFF; background-color: #8E2323;" 
        Text="修改" onclick="btnupdate_Click" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btndelete" runat="server" 
        style="font-size: large; color: #FFFFFF; background-color: #8E2323;" 
        Text="删除" onclick="btndelete_Click" />
&nbsp;
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
        SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
    <br class="style1" />
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
