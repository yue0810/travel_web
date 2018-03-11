<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addyouke.aspx.cs" Inherits="addyouke" %>

<!DOCTYPE html>

<html>
<head>
<meta content ="text/html" ;charset="utf-8" />
<title>添加人员</title>
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
<img src ="image/游客信息管理.png" alt ="" />
</div>

<br /><br /><br /><br />

<div class ="zhongbu">

    <div class ="text">

        <strong><span class="style1">
        <br />
        姓名：</span></strong>&nbsp;&nbsp;
    <asp:TextBox ID="txtname" runat="server" style="font-size: large"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtname" Display="Dynamic" ErrorMessage="*" ForeColor="Red" 
            style="font-size: large"></asp:RequiredFieldValidator>
    <br />
    <br />
    <span class="style1"><strong>性别：&nbsp;&nbsp; </strong><asp:RadioButtonList ID="sex" 
        runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" 
        style="font-size: large">
        <asp:ListItem>女</asp:ListItem>
        <asp:ListItem>男</asp:ListItem>
    </asp:RadioButtonList>
    </span>
    <br />
    <br />
    <strong><span class="style1">身份证号:</span><asp:TextBox ID="txtnum" runat="server" 
            style="font-size: large"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtnum" Display="Dynamic" ErrorMessage="*" ForeColor="Red" 
            style="font-size: large"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="txtnum" Display="Dynamic" ErrorMessage="身份证号格式不正确" 
            ForeColor="Red" style="font-size: large" 
            ValidationExpression="\d{17}[\d|X]|\d{15}"></asp:RegularExpressionValidator>
&nbsp;</strong><asp:Button ID="select" runat="server" 
            style="font-size: large; color: #FFFFFF; background-color: #8E2323;" 
            Text="查询" CausesValidation="False" onclick="select_Click" />
    <br />
    <br />
    <span class="style1"><strong>联系方式：</strong><asp:TextBox ID="txtphone" 
        runat="server" style="font-size: large"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txtphone" Display="Dynamic" ErrorMessage="*" ForeColor="Red" 
            style="font-size: large; font-weight: 700"></asp:RequiredFieldValidator>
    </span>
    <br />
    <br />
    <strong><span class="style1">游客类型：</span><asp:RadioButtonList ID="leixing" 
        runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" 
        style="font-size: large">
        <asp:ListItem>儿童</asp:ListItem>
        <asp:ListItem>成人</asp:ListItem>
        <asp:ListItem>老人</asp:ListItem>
    </asp:RadioButtonList>
    </strong>
    <br />
    <br />
    <span class="style1"><strong>所选项目：</strong><asp:DropDownList ID="xiangmu" 
        runat="server" style="font-size: large" AutoPostBack="True" 
            DataSourceID="SqlDataSource2" DataTextField="线路" DataValueField="线路" 
            ondatabound="xiangmu_DataBound1" 
            onselectedindexchanged="xiangmu_SelectedIndexChanged">
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp; <strong>剩余名额：</strong><asp:Label ID="minge" runat="server"></asp:Label>
    </span>
    <br />
    <strong>
    <br class="style1" />
    <span class="style1">日期：</span><asp:DropDownList ID="dpdate" runat="server" 
            AutoPostBack="True" onselectedindexchanged="dpdate_SelectedIndexChanged" 
            style="font-size: large">
        </asp:DropDownList>
    </strong>
    <br />
    <br />
    <strong><span class="style1">房型：</span><asp:RadioButtonList ID="fangjian" 
        runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" 
        style="font-size: large">
        <asp:ListItem>双人标间</asp:ListItem>
        <asp:ListItem>大床房</asp:ListItem>
        <asp:ListItem>家庭房</asp:ListItem>
    </asp:RadioButtonList>
        <br />
        <br />
        <span class="style1">价格：</span><asp:TextBox ID="txtprice" runat="server" 
            style="font-size: large"></asp:TextBox>
    </strong>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="txtprice" Display="Dynamic" ErrorMessage="*" ForeColor="Red" 
            style="font-size: large"></asp:RequiredFieldValidator>
    <br />
    <br />
    <strong><span class="style1">备注：</span></strong><asp:TextBox ID="beizhu" 
        runat="server" Height="137px" TextMode="MultiLine" Width="331px"></asp:TextBox>
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnadd" runat="server" 
            style="font-size: large; color: #FFFFFF; background-color: #8E2323;" 
            Text="添加" onclick="btnadd_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;<asp:Button ID="btnupdate" runat="server" style="font-size: large; color: #FFFFFF; background-color: #8E2323;" 
            Text="修改" onclick="btnupdate_Click" />
    <br />
        <strong><span class="style1">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
            SelectCommand="SELECT * FROM [beijingline1]"></asp:SqlDataSource>
        </span>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
            SelectCommand="SELECT DISTINCT [线路] FROM [line1]"></asp:SqlDataSource>
        </strong>
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
