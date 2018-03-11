using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

public partial class mine : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies ["putong"] == null)
            {
                Response.Write("<script>alert('您还没有登录，请返回登录');window.location.href='denglu.aspx?'</script>");
            }
            else
            {
                xingcheng.Visible = false;
                updatemima.Visible = false;
                kefu.Visible = false;
            }
        }
    }
    protected void select_Click(object sender, EventArgs e)
    {
        xingcheng.Visible = true;
        updatemima.Visible = false;
        kefu.Visible = false;
    }
    protected void dpxingcheng_DataBound(object sender, EventArgs e)
    {
        dpxingcheng.Items.Insert(0, "请选择");
    }
    protected void dpxingcheng_SelectedIndexChanged(object sender, EventArgs e)
    {
        dpdate.Items.Clear();
        ArrayList a = new ArrayList();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();
        string sql = string.Format("select * from line1 where 线路='{0}'", dpxingcheng.Text);
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            dpdate.Items.Clear();
            a.Add(reader[3].ToString());
        }
        dpdate.Items.Insert(0, "请选择");
        foreach (var s in a)
        {
            dpdate.Items.Add(s.ToString());
        }
        reader.Close();
        con.Close();
    }
    protected void btnselect_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();
        if (dpxingcheng.SelectedItem.Text == "北京云南1" && dpdate.SelectedItem.Text == "2016.5.3-2016.5.9")
        {
            string sql = string.Format("select * from yunnanline1 where 身份证号='{0}'", txtnum.Text);
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                GridView1.Caption = "您的行程为";
                GridView1.DataSource = reader;
                GridView1.DataBind();
            }
            else
                Response.Write("<script>alert('没有您的记录')</script>");
            reader.Close();
        }
        else if (dpxingcheng.SelectedValue == "北京云南1" && dpdate.SelectedValue == "2015.7.8-2016.7.13")
        {
            string sql = string.Format("select * from yunnanline2 where 身份证号='{0}'", txtnum.Text);
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                GridView1.Caption = "您的行程为";
                GridView1.DataSource = reader;
                GridView1.DataBind();
            }
            else
                Response.Write("<script>alert('没有您的记录')</script>");
            reader.Close();
        }
        else if (dpxingcheng.SelectedValue == "佛山-北京" && dpdate.SelectedValue == "2016.2.1-2016.2.5")
        {
            string sql = string.Format("select * from beijingline1 where 身份证号='{0}'", txtnum.Text);
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                GridView1.Caption = "您的行程为";
                GridView1.DataSource = reader;
                GridView1.DataBind();
            }
            else
                Response.Write("<script>alert('没有您的记录')</script>");
            reader.Close();
        }
        else
            Response.Write("<script>alert('没有您的记录')</script>");
        con.Close();
    }
    protected void btndown_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource2.ConnectionString;
        con.Open();
        string sql = string.Format("update [user] set 密码='{0}' where 用户名='{1}'", txtpsw1.Text, Request.QueryString["name"].ToString());
        SqlCommand com = new SqlCommand(sql, con);
        com.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('修改成功')</script>");
        txtpsw1.Text = "";
        txtpsw2.Text = "";

    }
    protected void mima_Click(object sender, EventArgs e)
    {
        xingcheng.Visible = false;
        updatemima.Visible = true;
        kefu.Visible = false;
    }
    protected void quit_Click(object sender, EventArgs e)
    {
        HttpCookie cok1 = new HttpCookie("putong");
        cok1.Expires = DateTime.Now;
        Response.Cookies.Add(cok1);
        Response.Redirect("denglu.aspx");
    }
    protected void fanhui_Click(object sender, EventArgs e)
    {
        Response.Redirect("shouye.aspx");
    }
    protected void lianxi_Click(object sender, EventArgs e)
    {
        xingcheng.Visible = false;
        updatemima.Visible = false;
        kefu.Visible = true ;
    }
    protected void tijiao_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource3.ConnectionString;
        con.Open();
        string sql = string.Format("insert into liuyan values('{0}','{1}')", Request.QueryString["name"].ToString(), liuyan.Text);
        SqlCommand com = new SqlCommand(sql, con);
        com.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('已成功提交给客服，请耐心等待')</script>");
        liuyan.Text = "";
    }
}