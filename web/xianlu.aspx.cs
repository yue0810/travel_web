using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

public partial class 线路 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["name"] == null)
        {
            Response.Write("<script>alert('您还没有登录，请返回登录');window.location.href='denglu.aspx?'</script>");
        }
    }
    protected void dpline_DataBound(object sender, EventArgs e)
    {
        dpline.Items.Insert(0, "请选择");
    }
    protected void dpline_SelectedIndexChanged(object sender, EventArgs e)
    {
        dpdate.Items.Clear();
        ArrayList a = new ArrayList();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();
        string sql = string.Format("select * from line1 where 线路='{0}'", dpline.Text);
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
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
    protected void dpdate_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();
        string sql = string.Format("select * from line1 where 线路='{0}' and 日期='{1}'", dpline.SelectedValue, dpdate.SelectedValue);
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            txtline.Text = reader[0].ToString();
            txtchufa.Text = reader[1].ToString();
            txtdaoda.Text = reader[2].ToString();
            txtdate.Text = reader[3].ToString();
            txtjiage.Text = reader[4].ToString();
            txtminge.Text = reader[5].ToString();
            txtsheng.Text = reader[6].ToString();
            txtjianjie.Text = reader[7].ToString();
            imgurl.Text = reader[8].ToString();
            liang.Text = reader[9].ToString();
            anpai.Text = reader[10].ToString();
            tuiding.Text = reader[11].ToString();
            shuoming.Text = reader[12].ToString();
        }
        reader.Close();
        con.Close();
    }
    protected void update_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();

        string str = "";
        string sql1 = string.Format("select id from line1 where 线路='{0}' and 日期='{1}'", dpline.SelectedValue, dpdate.SelectedValue);
        SqlCommand com2 = new SqlCommand(sql1, con);
        SqlDataReader read = com2.ExecuteReader();
        while (read.Read())
        {
            str = read[0].ToString();
        }
        read.Close();

        string sql = string.Format("update line1 set 线路='{0}',出发城市='{1}',到达城市='{2}',日期='{3}',价格={4},名额={5},剩余名额={6},简介='{7}',图片='{8}',行程亮点='{9}',行程安排='{10}',退订须知='{11}',费用说明='{12}' where id='{13}'", txtline.Text, txtchufa.Text, txtdaoda.Text, txtdate.Text, int.Parse(txtjiage.Text), int.Parse(txtminge.Text), int.Parse(txtsheng.Text), txtjianjie.Text, imgurl.Text, liang.Text, anpai.Text, tuiding.Text, shuoming.Text, str);
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('修改成功')</script>");
        dpdate.Items.Clear();
        dpdate.Items.Insert(0, "请选择");
        txtline.Text = "";
        txtchufa.Text = "";
        txtdaoda.Text = "";
        txtdate.Text = "";
        txtjiage.Text = "";
        txtminge.Text = "";
        txtsheng.Text = "";
        txtjianjie.Text = "";
        imgurl.Text = "";
        liang.Text = "";
        anpai.Text = "";
        tuiding.Text = "";
        shuoming.Text = "";
    }
    protected void insert_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;  
        con.Open();

        string sql1 = string.Format("select * from line1 where 线路='{0}' and 日期='{1}'", txtline.Text, txtdate.Text);
        SqlCommand com2 = new SqlCommand(sql1, con);
        SqlDataReader reader = com2.ExecuteReader();
        if (reader.HasRows)
        {
            reader.Close();
            con.Close();
            Response.Write("<script>alert('已存在该路线，请修改路线信息')</script>");
        }
        else
        {
            reader.Close();
            string sql = string.Format("insert into line1 values('{0}','{1}','{2}','{3}',{4},{5},{6},'{7}','{8}','{9}','{10}','{11}','{12}')", txtline.Text, txtchufa.Text, txtdaoda.Text, txtdate.Text, int.Parse(txtjiage.Text), int.Parse(txtminge.Text), int.Parse(txtsheng.Text), txtjianjie.Text, imgurl.Text, liang.Text, anpai.Text, tuiding.Text, shuoming.Text);
            SqlCommand com = new SqlCommand(sql, con);
            com.ExecuteNonQuery();
            Response.Write("<script>alert('添加成功')</script>");
            txtline.Text = "";
            txtchufa.Text = "";
            txtdaoda.Text = "";
            txtdate.Text = "";
            txtjiage.Text = "";
            txtminge.Text = "";
            txtsheng.Text = "";
            txtjianjie.Text = "";
            imgurl.Text = "";
            liang.Text = "";
            anpai.Text = "";
            tuiding.Text = "";
            shuoming.Text = "";
            dpdate.Items.Clear();
            dpdate.Items.Insert(0, "请选择");
            con.Close();
        }


    }
}