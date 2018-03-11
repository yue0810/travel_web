<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
<title >云南</title>
   <style  type ="text/css" >
    #header
    {
        height:100px;
        background-color :White ;
    }
    a
    {
        text-decoration :none;
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
        clear :both ;
        padding :-1px 0;
        padding-top :0;
        background-color :gray  ;
    }
    .top p
    {
        text-align :left ;
        font-size:14px;
        background-color :gray;
    }
    .top a
    {
    }
    .footer
   {
       clear :both ;
       padding :5px 0;
       background-color :Gray ;
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
   .jianjie
   {
       padding :20px 30px 10px 30px;
       width :1200px;
   }
   
   #menu2
    {
        float :left ;
        width:1200px ;
        height :100px;
        background-color :White ;
    }
    #menu2 ul
    {
        margin :0;
        padding :60px 20px 0 0;
        list-style :none;
        
    }
    #menu2 li
    {
        display :inline ;
    }
    #menu2 li a
    {
        float :left ;
        margin:0 0 0 2px;
        width :120px;
        height :25px;
        padding :9px 0 0 0;
        text-decoration :none;
        text-align :center ;
        font-size:1.1em;
        font-weight :bold ;
        color :#000000;
        background-color :White ;
    }
    #menu2 a:hover
    {
        background-color :#FF6602;
    }
       .style2
       {
           font-size: large;
       }
       .style4
       {
           font-size: large;
       }
       .tupian
       {
           height :700px;
       }
       body
       {
           background-image :url(image/首页背景.png);
       }
       .tupian
       {
           height :660px;
           width :1200px;  
           background-image :url(image/介绍背景.png); 
           
       }
       .style5
       {
           width: 709px;
       }
    </style>
</head>

<body >
    <form id="form1" runat="server">
        <div class ="top">
            <p>欢迎来到旅行社官方网站</p>
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
                        <li ><a href ="http://xiecheng.com">飞机票预定</a></li>
                        <li ><a href ="shouye.aspx#ayunnan" >热门线路</a></li>
                        <li ><a href ="mine.aspx" >个人中心</a></li>
                        <li ><a href ="denglu.aspx" >登录/注册</a></li>
                    </ul>
                </div>
        </div>

        <br/><br/>
        <hr/>
        <div class ="tupian">
            <table border ="3" width ="1200">
                <tr>
                    <td width="600" align ="center" height="660">
                        <asp:Image ID="tu" runat="server" Height="650px" Width="600px" />
                    </td>
                    <td width="600" height="660" class="style5">
                        <div style="height: 660px" >
                            <strong><span class="style2">&nbsp; 
                            <br />                <br />
                            &nbsp; 请选择日期：</span></strong>
                            <asp:DropDownList   ID="dpdate" runat="server" AutoPostBack="True" CssClass="style4"  ondatabound="dpdate_DataBound" 
                                onselectedindexchanged="dpdate_SelectedIndexChanged">
                            </asp:DropDownList>
                            <strong><br />        <br />     <br /> 
                            &nbsp;&nbsp;&nbsp;
                            <asp:Label ID="date" runat="server" style="font-size: large"></asp:Label>
                            <br />      <br />     <br />
                            &nbsp;&nbsp;<span class="style2">请选择旅客类型&nbsp;</span>&nbsp; 
                            <br />          </strong>
                            <asp:RadioButtonList ID="people" runat="server" AutoPostBack="True" 
                                CellPadding ="30" CellSpacing ="10" RepeatDirection="Horizontal" 
                                style="font-size: large" Height="80px" 
                                onselectedindexchanged="people_SelectedIndexChanged">
                                <asp:ListItem>儿童</asp:ListItem>
                                <asp:ListItem>成人</asp:ListItem>
                                <asp:ListItem>老人</asp:ListItem>
                            </asp:RadioButtonList>
                            <strong>    <br />
                            &nbsp;&nbsp; <span class="style2">请选择房间类型：</span></strong>
                            <asp:RadioButtonList  ID="fangjian" runat="server" RepeatDirection="Horizontal" CellPadding ="30" 
                                CellSpacing ="10" style="font-size: large" Height="80px" AutoPostBack="True" 
                                onselectedindexchanged="fangjian_SelectedIndexChanged">
                                <asp:ListItem>大床房</asp:ListItem>
                                <asp:ListItem>家庭房</asp:ListItem>
                                <asp:ListItem>双人标间</asp:ListItem>
                            </asp:RadioButtonList>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="chakan" runat="server"    Text="查看价格"      onclick="chakan_Click" 
                                style="color: #FFFFFF; font-size: large; background-color: #FF0000"     />
                            <asp:Label ID="sum" runat="server" style="font-size: large"></asp:Label>
                            <br />     <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnbuy" runat="server" Text="立即预定" onclick="btnbuy_Click" BorderColor="Red" 
                            style="font-size: large; color: #FFFFFF; background-color: #FF0000"      />
                            &nbsp;&nbsp;
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
                                 SelectCommand="SELECT * FROM [beijingline1]"></asp:SqlDataSource>
                                &nbsp;
                            <br />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <br/><br/><br/><br/>
        <div id="menu2">
            <ul >
                <li><a href ="#liangdian" >行程亮点</a></li>
                <li ><a href ="#anpai" >行程安排</a></li>
                <li ><a href ="#tuiding" >退订须知</a></li>
                <li ><a href ="#feiyong" >费用说明</a></li>
            </ul>
        </div>

        <br/><br/>

        <div  class ="jianjie">
        <br />
        <a name="liangdian">行程亮点</a>       
        <br />
        <br />
        <br />
        <asp:Label ID="liang" runat="server"></asp:Label>
        <br />
        <br />
        <a name="anpai">行程安排</a><br />
        <br />
        <asp:Label ID="an" runat="server"></asp:Label>
        <br />
        <br />
        <a name ="tuiding" >退订须知</a>
        <br />
        <br />
        <asp:Label ID="tui" runat="server"></asp:Label>
        <br />
        <br />
        <a name ="feiyong" >费用说明</a>
        <br />
        <br />
        <asp:Label ID="fei" runat="server"></asp:Label>

</div>
<div  class ="footer">
<p>总部地址：河北工业大学<br/><br/>版权所有：网络C144 王晓玥<br/><br/>联系方式：244413000</p>

</div>
    </form>
</body>
</html>

