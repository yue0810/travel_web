<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xinxiqueren.aspx.cs" Inherits="xinxiqueren" %>

<!DOCTYPE html><html>
<head>
<meta content ="text/html" ;charset="utf-8" />
<title>确认信息</title>
<style type ="text/css" >
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
    .lay
    {
        height:458px;
        background-color :transparent;
    }
    .imglugai
    {
        width :1600px;
        height :30px;
        padding-bottom :40px;
        padding-left :250px;
        padding-top :40px;
    }
    .imglugai img
    {
        width :150px;
        height :50px;
        
    }
    .text
    {
        width :680px;
        height :640px;
        margin-left :390px;
        margin-right :330px;
    }
    body
    {
        background-image :url(image/背景.png);
        background-repeat :no-repeat ;
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
<li><a href ="shouye.aspx" >首页</a></li>
<li ><a href ="aboutus.aspx" >关于我们</a></li>
<li><a href ="http://www.12306.com" >火车票预定</a></li>
<li ><a href ="http://xiecheng.com">飞机票预定</a></li>
<li ><a href ="2.htm" >热门线路</a></li>
<li ><a href ="denglu.aspx" >登录/注册</a></li>
</ul>
</div>
</div>


<div class ="lay">
<div class ="imglugai">
<img src ="image/信息确认logo.png" alt ="" />
</div>
<div class ="text">

    <strong><span class="style1">姓名：</span></strong>&nbsp;&nbsp;
    <asp:TextBox ID="txtname" runat="server" style="font-size: large"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtname" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <span class="style1"><strong>性别：</strong><asp:RadioButtonList ID="sex" 
        runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" 
        style="font-size: large">
        <asp:ListItem>女</asp:ListItem>
        <asp:ListItem>男</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    </span>
    <br />
    <strong><span class="style1">身份证号：</span></strong><asp:TextBox ID="txtnum" 
        runat="server" style="font-size: large"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtnum" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="txtnum" Display="Dynamic" ErrorMessage="请输入正确的格式" 
        ForeColor="Red" ValidationExpression="\d{17}[\d|X]|\d{15}"></asp:RegularExpressionValidator>
    <br />
    <br />
    <span class="style1"><strong>联系方式：</strong></span><asp:TextBox ID="txtphone" 
        runat="server" style="font-size: large"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="txtphone" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <strong><span class="style1">游客类型：</span></strong><asp:Label ID="lbleixing" 
        runat="server" style="font-size: large"></asp:Label>
    <br />
    <br />
    <span class="style1"><strong>所选项目：</strong></span><asp:Label ID="lbxiangmu" 
        runat="server" style="font-size: large"></asp:Label>
    <br />
    <strong>
    <br class="style1" />
    <span class="style1">日期：</span></strong><asp:Label ID="lbdate" runat="server" 
        style="font-size: large"></asp:Label>
    <br />
    <br />
    <strong><span class="style1">房型：</span></strong><asp:Label ID="lbfang" 
        runat="server" style="font-size: large"></asp:Label>
    <br />
    <br />
    <strong><span class="style1">备注：</span></strong><asp:TextBox ID="beizhu" 
        runat="server" Height="137px" TextMode="MultiLine" Width="331px"></asp:TextBox>
    <strong><span class="style1">(若没有请填无)<asp:RequiredFieldValidator 
        ID="RequiredFieldValidator4" runat="server" ControlToValidate="beizhu" 
        Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    </span></strong>
    <br />
    <strong>
    <br class="style1" />
    <span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    金额：</span></strong><asp:Label ID="lbsum" runat="server" 
        style="font-size: large"></asp:Label>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
        SelectCommand="SELECT * FROM [yunnanline1]"></asp:SqlDataSource>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnzhifu" runat="server" 
        style="color: #FFFFFF; font-size: large; background-color: #FF0000" 
        Text="确认支付" onclick="btnzhifu_Click" />

    <br />

</div>

</div>
    </form>
</body>
</html>
