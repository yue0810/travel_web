<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xianlu.aspx.cs" Inherits="线路" %>

<!DOCTYPE html><html>
<head>
<meta content ="text/html" ;charset="utf-8" />
<title>线路管理</title>
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
        height:800px;
        width:1350px;
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
        float :left ;
        height: 780px;
        width: 350px;
        font-size: large;
        margin-left :50px;
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
       margin-top:0;
       padding :0;
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
    
    .t1
    {
        margin-top :325;
        width: 360px;
        margin-left: 609px;
        margin-bottom :300px;
        margin-right: 0px;
    }
    .wenben
    {
        height :300px;
        width :600px;
        float :right ;
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
<img src ="image/修改线路.png" alt ="" />
</div>

<br /><br /><br /><br />

<div class ="zhongbu">

 <div  class ="sidebar" style="left" >
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


        <div class ="text">
            <br />
            线路：<asp:DropDownList ID="dpline" runat="server" CssClass="style1" 
                DataSourceID="SqlDataSource2" DataTextField="线路" DataValueField="线路" 
                ondatabound="dpline_DataBound" AutoPostBack="True" 
                onselectedindexchanged="dpline_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
            日期：<asp:DropDownList ID="dpdate" runat="server" AutoPostBack="True" 
                onselectedindexchanged="dpdate_SelectedIndexChanged" style="font-size: large">
            </asp:DropDownList>
            <br />
            <br />
            线路：<asp:TextBox ID="txtline" runat="server" style="font-size: large"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="txtline" Display="Dynamic" ErrorMessage="*" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            出发城市：<asp:TextBox ID="txtchufa" runat="server" CssClass="style1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtchufa" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            到达城市：<asp:TextBox ID="txtdaoda" runat="server" CssClass="style1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtdaoda" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            日期：<asp:TextBox ID="txtdate" runat="server" CssClass="style1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtdate" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            价格：<asp:TextBox ID="txtjiage" runat="server" CssClass="style1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtjiage" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            名额：<asp:TextBox ID="txtminge" runat="server" CssClass="style1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtminge" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            剩余名额：<asp:TextBox ID="txtsheng" runat="server" CssClass="style1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="txtsheng" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            简介：<asp:TextBox ID="txtjianjie" runat="server" CssClass="style1" Height="85px" 
                TextMode="MultiLine" Width="323px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="txtjianjie" Display="Dynamic" ErrorMessage="*" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            配图（url）：<asp:TextBox ID="imgurl" runat="server" style="font-size: large"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="imgurl" Display="Dynamic" ErrorMessage="*" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
                SelectCommand="SELECT [线路] FROM [line1]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
                SelectCommand="SELECT DISTINCT [线路] FROM [line1]"></asp:SqlDataSource>
            <br />
        </div>

            <div class ="wenben">

                <strong><span class="style1">行程亮点：</span></strong><asp:TextBox 
                    ID="liang" runat="server" TextMode="MultiLine" 
                    Height="100px" style="margin-left: 0px" Width="380px"></asp:TextBox>
                <br />
                <br />
                <br />
                <strong><span class="style1">行程安排：</span></strong><asp:TextBox 
                    ID="anpai" runat="server" TextMode="MultiLine" Height="100px" Width="380px"></asp:TextBox>
                <br />
                <br />
                <br />
                <strong><span class="style1">退订须知：</span></strong><asp:TextBox 
                    ID="tuiding" runat="server" TextMode="MultiLine" Height="100px" Width="380px"></asp:TextBox>
                <br />
                <br />
                <br />
                <strong><span class="style1">费用说明：</span></strong><asp:TextBox ID="shuoming" runat="server" TextMode="MultiLine" Height="100px" Width="380px"></asp:TextBox>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="update" runat="server" 
                style="font-size: large; color: #FFFFFF; background-color: #8E2323" 
                Text="修改" onclick="update_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="insert" runat="server" 
                style="font-size: large; color: #FFFFFF; background-color: #8E2323" 
                Text="添加" onclick="insert_Click" />
            </div>

               

</div>


<div  class ="footer">
<p>总部地址：河北工业大学<br/><br/>版权所有：网络C144 王晓玥<br/><br/>联系方式：244413000</p>
</div>
    </form>
</body>
</html>
