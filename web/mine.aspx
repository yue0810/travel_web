<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mine.aspx.cs" Inherits="mine" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>个人中心</title>
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
    .menu
    {
        background-color :transparent;
        float :left;
        padding-left :0;
        margin-left :0;
        height :300px;
        width :239px;
            margin-top: 0px;
        }
        .style1
        {
            font-size: x-large;
            color: #FFFFFF;
            background-color: #C68C53;
        }
        #form1
        {
            height: 120px;
        }
        .text
        {
            background-color :Blue;
            width :925px;
            height :543px;
        }
        .zhongbu
        {
            background-image :url('image/mine背景.jpg');
            width :1350px;
            height :490px;
        }
        .style2
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
</div>
<br /><br />
    <br />
    <br />

    <div class="zhongbu">
<div class="menu">
    <br />
    <br />
    <br />
    <asp:Button ID="select" runat="server" CssClass="style1" Text="查询/取消行程" 
        onclick="select_Click" Width="213px" CausesValidation="False" />
    <br />
    <br />
    <br />
    <asp:Button ID="mima" runat="server" CssClass="style1" Text="修改密码" 
        onclick="mima_Click" CausesValidation="False" />
    <br />
    <br />
    <br />
    <asp:Button ID="fanhui" runat="server" onclick="fanhui_Click" 
        style="color: #FFFFFF; font-size: x-large; background-color: #C68C53" 
        Text="去首页" Width="107px" />
    <br />
    <br />
    <asp:Button ID="lianxi" runat="server" CausesValidation="False" 
        style="font-size: x-large; color: #FFFFFF; background-color: #C68C53" 
        Text="联系客服" onclick="lianxi_Click" />
    <br />
    <br />
    <br />
    <asp:Button ID="quit" runat="server" 
        style="font-size: x-large; color: #FFFFFF; background-color: #C68C53" 
        Text="退出" onclick="quit_Click" CausesValidation="False" />
    <br />
</div>
<br/>
        <asp:Panel ID="updatemima" runat="server" Height="232px">
            &nbsp;<br />
            <asp:Label ID="lb1" runat="server" style="font-size: large; font-weight: 700" 
                Text="请输入新密码"></asp:Label>
            <asp:TextBox ID="txtpsw1" runat="server" style="font-size: large"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtpsw1" Display="Dynamic" ErrorMessage="*" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <br />
            <asp:Label ID="lb2" runat="server" style="font-size: large; font-weight: 700" 
                Text="请确认密码："></asp:Label>
            <asp:TextBox ID="txtpsw2" runat="server" style="font-size: large"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txtpsw2" Display="Dynamic" ErrorMessage="*" 
                ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txtpsw1" ControlToValidate="txtpsw2" Display="Dynamic" 
                ErrorMessage="密码输入不一致" ForeColor="Red"></asp:CompareValidator>
            <br />
            <br />
            <asp:Button ID="btndown" runat="server" onclick="btndown_Click" 
                style="color: #FFFFFF; font-size: large; background-color: #C68C53" 
                Text="修改" />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
                SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
        </asp:Panel>
        <br />
    <asp:Panel ID="xingcheng" runat="server" Height="475px" 
        style="margin-left: 246px; margin-right: 7px; margin-top: 0px" Width="770px">
        <br />
        <br />
        <br />
        <span class="style2"><strong>请选择您的行程：</strong><asp:DropDownList 
            ID="dpxingcheng" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="线路" DataValueField="线路" 
            ondatabound="dpxingcheng_DataBound" 
            onselectedindexchanged="dpxingcheng_SelectedIndexChanged" 
            style="font-size: large">
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <strong>请选择你的出发日期：</strong><asp:DropDownList ID="dpdate" runat="server" 
            AutoPostBack="True" style="font-size: large">
        </asp:DropDownList>
        <br />
        <br />
        <strong>请输入您的身份证号:</strong><asp:TextBox ID="txtnum" runat="server" 
            style="font-size: large"></asp:TextBox>
        <br />
        <br />
        </span>
        <asp:Button ID="btnselect" runat="server" onclick="btnselect_Click" 
            style="font-size: large; color: #FFFFFF; background-color: #C68C53" Text="查询" />
        <asp:GridView ID="GridView1" runat="server" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ForeColor="Black" GridLines="Vertical" style="font-size: large">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
            SelectCommand="SELECT DISTINCT [线路] FROM [line1]"></asp:SqlDataSource>
        <br />
    </asp:Panel>
        <br />
        <asp:Panel ID ="kefu" runat ="server"  Height="232px" 
            style="margin-left: 245px; margin-right: 335px">
            <strong><span class="style2">请写下留言，我们会第一时间处理：<br /> 
            <br />
            </span>
            <asp:TextBox ID="liuyan" runat="server" Height="126px" TextMode="MultiLine" 
                Width="293px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp; </strong>
            <asp:Button ID="tijiao" runat="server" onclick="tijiao_Click" 
                style="font-size: large; color: #FFFFFF; background-color: #C68C53" Text="提交" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringweb %>" 
                SelectCommand="SELECT * FROM [liuyan]"></asp:SqlDataSource>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
