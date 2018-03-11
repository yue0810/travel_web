<%@ Page Language="C#" AutoEventWireup="true" CodeFile="denglu.aspx.cs" Inherits="shouye" %>

<!DOCTYPE html >

<html >
<head>
<title>登录</title>
    <style  type ="text/css" >
    .back
    {
        height :600px;
        width :1500px;
        background-repeat :repeat ;
        float :left ;
        background-image :url(image/登录背景.png);
    }
    .denglu
    {
        background-repeat :no-repeat ;
        width:720px;
        height :400px;
        margin-top :85px;
        float :right ;
    }
    .denglu btnlogin
       {
            height:30px;
        }
    .footer
   {
       clear :both ;
       padding :0px 0 0 0;
       background :gray;
       padding-bottom :0;
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
            font-size: xx-large;
            font-family: 幼圆;
            color: #3333FF;
        }
        .style2
        {
            font-size: xx-large;
            font-family: 幼圆;
            color: #8E2323;
        }
    </style>
</head>
<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<div class="di">

<div  class ="back">
<div class="denglu ">

    <a href ="shouye.aspx">返回首页</a><br />
    <br />
    <strong>
    <span class="style1">&nbsp; </span>
    <span class="style2">登录</span></strong><br />
    <br />
    <br />
    <br />
    <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用户名</strong>：<asp:TextBox ID ="txtname" runat ="server" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtname" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 密码</strong>：&nbsp;<asp:TextBox 
        ID ="txtpsw" runat ="server" TextMode="Password" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtpsw" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnlogin" runat="server" Text="登陆" 
        style="font-size: large; background-color: #8E2323; color: #FFFFFF;" 
        BorderColor="White" onclick="btnlogin_Click"  />
    <br />
    <br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href ="zhuce.aspx" >没有用户？点击注册</a>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
        SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
    <br />
    <br />
    <br />

</div>

</div>



</div>
<div  class ="footer">
<p>总部地址：河北工业大学<br/><br/>版权所有：网络C144 王晓玥<br/><br/>联系方式：244413000</p>

</div>
    </form>
</body>
</html>
