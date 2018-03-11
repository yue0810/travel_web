<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shouye.aspx.cs" Inherits="shouye" %>

<!DOCTYPE html ><html >
<head>
<meta charset="utf-8" />
    <title>首页</title>
    <style  type ="text/css" >
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
   .sidebar
   {
       float:left;
       width :200px;
       height :600px;
       background-color :#a8a8a8;
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
       color :Red ;
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
   .aimg
   {
       width :680px;
       height :600px;
       padding-left:30px;
       margin-left :30px;
       float :left ;
   } 
   #frame{/*----------图片轮播相框容器----------*/  
            position: absolute; /*--绝对定位，方便子元素的定位*/  
            width: 800px;  
            height: 600px;  
            overflow: hidden;/*--相框作用，只显示一个图片---*/  
            border-radius:5px;  
        }  
        #dis {/*--绝对定位方便li图片简介的自动分布定位---*/  
            position: absolute;  
            left: -1000px;  
            top: -10px;  
            opacity: 0.5;  /*不透明级别*/
        }  
        #dis li {  /*简介*/
            display: inline-block;  
            width: 880px;  
            height: 20px;  
            margin: 0 5px;  
            float:right ;
            text-align: center;  
            color: #fff;   
            background: #000;  
        }  
        #photos img {  
            float: left;  
            width:880px;  
            height:600px;  
        }  
        #photos {/*---设置总的图片宽度--通过位移来达到轮播效果----*/  
            position: absolute;z-index:900px;  
            width: calc(880px * 5);/*---修改图片数量的话需要修改下面的动画参数*/  
        }  
        .play{  
            animation: ma 20s ease-out infinite alternate;/**/  
        }  
        @keyframes ma
        {
            /*{每次移动的大小*/ 
             0%,20% {       margin-left: 0px;       }  
            25%,40% {       margin-left: -880px;    }  
            45%,60% {       margin-left: -1760px;   }  
            65%,80% {       margin-left: -2640px;   }  
            85%,100% {      margin-left: -3520px;   }  
        }  
        .num{  
            position:absolute;z-index:10;  
            display:inline-block;  
            right:10px;top:565px;  
            border-radius:100%;  
            background:#f00;  
            width:25px;height:25px;  
            line-height:25px;  
            cursor:pointer;  
            color:#fff;  
            text-align:center;  
            opacity:0.8;  
        } 
        .num:hover{background:#00f;}
        .num:hover,#photos:hover{animation-play-state:paused;}  
        .num:nth-child(2){margin-right:30px}  
        .num:nth-child(3){margin-right:60px}  
        .num:nth-child(4){margin-right:90px}  
        .num:nth-child(5){margin-right:120px}  
        #a1:hover ~ #photos{animation: ma5 .5s ease-out forwards;}  
        #a2:hover ~ #photos{animation: ma2 .5s ease-out forwards;}  
        #a3:hover ~ #photos{animation: ma3 .5s ease-out forwards;}  
        #a4:hover ~ #photos{animation: ma4 .5s ease-out forwards;}  
        #a5:hover ~ #photos {animation: ma5 .5s ease-out forwards;}  
        @keyframes ma1 
        {0%{margin-left:-3520px;}100%{margin-left:-0px;} }  
        @keyframes ma2 {0%{margin-left:-3520px;}100%{margin-left:-880px;}   }  
        @keyframes ma3 {100%{margin-left:-1760px;}   }  
        @keyframes ma4 {100%{margin-left:-2640px;}   }  
        @keyframes ma5 {100%{margin-left:-3520px;}  }  
   .zhongbu
   {
       height :620px;
   }
   .gundong
   {
       float :right ;
   }
   .gundong table
   {
       text-align :center ;
       line-height :30px;
   }
   body
   {
       padding :0;
       margin :0;
       background-image :url(image/首页背景.png);
       background-repeat :no-repeat ;
       background-position :bottom ;
   }
   .yunnan
   {
   }
   .yunnan a
   {
       line-height :30px;
   }
   .beijing
   {
   }
   .beijing a
   {
       line-height :30px;
   }
   .beijing img
   {
       margin-bottom :0;
   }
        .style1
        {
            font-size: large;
            color: #000000;
            background-color: #CCCCCC;
        }
        .style2
        {
            font-size: large;
            color: #000000;
        }
   .sou
   {
       float:right ;
       height :60px;
       width :740px;
       margin-top:0;
       padding-top :0;
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
<li ><a href ="mine.aspx" >个人中心</a></li>
</ul>
</div>
</div>
    <span class="style2"><strong>
    
    <br/>

<div class ="sou">
出发城市：</strong></span><asp:DropDownList ID="chufa" runat="server" 
        CssClass="style1" DataSourceID="SqlDataSource1" DataTextField="出发城市" 
        DataValueField="出发城市" AutoPostBack="True" ondatabound="chufa_DataBound" 
        onselectedindexchanged="chufa_SelectedIndexChanged" >
    </asp:DropDownList>
&nbsp; <span class="style2"><strong>目的城市：</strong></span><asp:DropDownList 
        ID="mudi" runat="server" CssClass="style1" AutoPostBack="True" 
        ondatabound="mudi_DataBound">
    </asp:DropDownList>
&nbsp;
    <asp:Button ID="search" runat="server" BackColor="#8E2323" CssClass="style1" 
        ForeColor="White" Text="搜索" onclick="search_Click" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
        SelectCommand="SELECT DISTINCT [出发城市] FROM [line1]"></asp:SqlDataSource>
</div>
<br/><br/><br/>
<div  class ="zhongbu">

<div  id ="lay" class ="sidebar" style="left" >
<ul >
   <li >
    <h2 >热门推荐</h2>
    <ul  type="disc">
        <li ><strong ><a href ="#ayunnan" >云南</a></strong></li>
        <li ><strong ><a href ="#abeijing" >北京</a></strong></li>
        <li ><a href ="#ayunnan" >桂林</a></li>
    </ul>        
   </li>
  <li>
    <h2 >国内游</h2>
    <ul type="disc">
        <li ><a href ="#ayunnan" >厦门</a></li>
        <li ><a href ="#ayunnan" >天津</a></li>
        <li ><a href ="#ayunnan" >四川</a></li>
    </ul>
   </li>
   <li>
    <h2 >国际游</h2>
    <ul type="disc">
        <li ><a href ="#ayunnan" >普吉岛</a></li>
        <li ><a href ="#ayunnan" >毛里求斯</a></li>
        <li ><a href ="#ayunnan" >巴黎</a></li>
    </ul>
   </li>
   <li >
   <h2 >友情链接</h2>
   <ul type="disc">
   <li ><a href ="http://www.kanghui.com" ><img src ="image/康辉logo.png" alt="" width ="110" height ="32" /></a></li>
   </ul>
   </li>
</ul>
</div>

<div class ="aimg" >
 <div id="frame" >  
        <a id="a1" class="num">1</a>  
        <a id="a2" class="num">2</a>  
        <a id="a3" class="num">3</a>  
        <a id="a4" class="num">4</a>  
        <a id="a5" class="num">5</a>  
        <div id="photos" class="play">  
              <a href ="yunnan1.aspx"><img src="images/1.jpg" width ="860" height ="600"></a>  
              <a href ="yunnan1.aspx"><img src="images/2.jpg" width ="860" height ="600" ></a>
              <a href ="yunnan1.aspx"><img src="images/3.png" width ="860" height ="600" ></a>
              <a href ="yunnan1.aspx"><img src="images/4.jpg" width ="860" height ="600" ></a>
              <a href ="yunnan1.aspx"><img src="images/5.jpg" width ="860" height ="600" >
              <ul id="dis">  
                <li>中国标志性建筑：天坛</li>  
                <li>中国标志性建筑：温泉</li>  
                <li>中国标志性建筑：布达拉宫</li>  
                <li>中国标志性建筑：长城</li>  
                <li>中国标志性建筑：天坛</li>  
              </ul>  
        </div>  
</div>  
</div>

<div class="gundong">
<marquee direction="up" behavior="scroll" scrollamount="3"width="200" height="300" bgcolor="#FF9966" hspace="0" vspace="0">公告<br />04月16日00时25分在日本九州岛发生7.3级地震，震源深度10千米，地震发生后中青旅紧急联系在日本的中青旅游客团，经确认，目前有20人旅游团虽身处震中，但都安全无虞，同时中青旅遨游网及日本中青旅，与当地救援队伍密切配合，正全力协助客人转移.</marquee>
<br/><br/>

<table align="center" border ="5" width ="200" bordercolorlight="white" borderblacklight="orange">
<tr height="50">
<td>服务保障<br/>专属客服服务<br/>随时随地轻松出行</td>
</tr>
<tr height="50">
<td >产品丰富<br/>一站式预订全球旅游产品<br/>海量玩法边走边订</td>
</tr>
<tr height="50">
<td >30余年品牌历程<br/>5A级旅行社</td>
</tr>
</table>
</div>
</div> 
<br />
    <br />
    <br />
    
<div  class ="yunnan" >
<a name="ayunnan"><img src ="image/云南标题.png" alt =""  /><br /></a>
&nbsp;<asp:DataList 
        ID="DataList1" runat="server" CellSpacing="100" 
        DataSourceID="SqlDataSource2" Height="15px" HorizontalAlign="Center" 
        RepeatDirection="Horizontal" Width="130px">
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("云南图片") %>' />
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("云南介绍") %>' OnClick ="link_Click"></asp:LinkButton>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
        SelectCommand="SELECT * FROM [remen]"></asp:SqlDataSource>
    <br />
</div>

<br />
<hr/>
<br />

<div  class ="beijing">
<a name="abeijing"><img src ="image/北京标题.png" alt ="" /><br /></a>
    <asp:DataList ID="DataList2" runat="server" CellSpacing="100" 
        DataSourceID="SqlDataSource2" Height="15px" HorizontalAlign="Center" 
        RepeatDirection="Horizontal" Width="130px" 
        onitemcommand="DataList2_ItemCommand">
        <ItemTemplate>
            <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("北京图片") %>' />
            <br />
            <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("北京介绍") %>' OnClick ="link_Click"></asp:LinkButton>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <br />
</div>
<div  class ="footer">
<p>总部地址：河北工业大学<br/><br/>版权所有：网络C144 王晓玥<br/><br/>联系方式：244413000</p>
</div>
    </form>
</body>
</html>
