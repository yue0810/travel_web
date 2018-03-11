<%@ Page Language="C#" AutoEventWireup="true" CodeFile="zhuce.aspx.cs" Inherits="shouye" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>注册</title>
    <style type ="text/css" >
     #header
    {
        height:100px;
        background-repeat :repeat  ;
    } 
    #logo
    {
        width :250px;
        float :left ;
    }
    .zhuce
    {
        height:458px;
        background-color :transparent;
    }
    .imgzhuce
    {
        width :1600px;
        height :30px;
        padding-bottom :40px;
        padding-left :250px;
        padding-top :40px;
    }
    .imgzhuce img
    {
        width :150px;
        height :50px;
        
    }
    .text
    {
        width :680px;
        height :321px;
        margin-left :390px;
        margin-right :330px;
    }
    
   .footer
   {
       clear :both ;
       background-color :Gray ;
       margin-bottom :0;
       margin-top :0;
   }
   .footer p
   {
       text-align :center ;
       font-size :14px;
       color :#000000;
       margin :0;
       padding :0;
   }
   .footer a
   {
       color :#ffffff;
   }
   body
   {
       background-image :url(image/背景.png);
       margin :0;
       padding :0;
   }
    </style>
</head>
<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<div id ="header">
        <div id ="logo">
<img src ="image/logo.png" alt =""  height ="100px" width ="250px"/>
        </div>
        </div> 


<div class ="zhuce">
<div class="imgzhuce">
&nbsp;<img src ="image/注册logo.png" alt ="" />
</div>

<div class="text">


    &nbsp;
    <br />
    <br />


    昵称：&nbsp;&nbsp; <asp:TextBox ID="txtnicheng" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="*" ControlToValidate="txtnicheng" Display="Dynamic" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    密码：&nbsp;&nbsp; <asp:TextBox ID="txtpsw" runat="server" 
        TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="*" ControlToValidate="txtpsw" Display="Dynamic" 
        ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    确认密码： <asp:TextBox ID="txtpsw2" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ErrorMessage="*" ControlToValidate="txtpsw2" ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ErrorMessage="密码输入不一致" ControlToCompare="txtpsw" 
        ControlToValidate="txtpsw2" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
    <br />
    <br />
    <br />
    联系方式： <asp:TextBox ID="txtphone" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="*" ControlToValidate="txtphone" ForeColor="Red"></asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnsure" runat="server" Text="确认注册" 
        style="font-size: large; color: #FFFFFF; background-color: #FF6600; text-align: center;" 
        BorderStyle="Double" BorderColor="Red" onclick="btnsure_Click" />


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
        SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>


</div>
</div>

<div  class ="footer">
<p>总部地址：河北工业大学<br/><br/>版权所有：网络C144 王晓玥<br/><br/>联系方式：244413000</p>

</div>
    </form>
</body>
</html>
