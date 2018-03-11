using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.Cookies["name"] == null)
        //{
        //    Response.Write("<script>alert('您还没有登录，请返回登录');window.location.href='denglu.aspx?'</script>");
        //}
        //else
        //{
        if (!IsPostBack)
        {
            btnbuy.Visible = false;
            dpdate.Items.Insert(0, "请选择");
            ArrayList a = new ArrayList();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = SqlDataSource1.ConnectionString;
            con.Open();
            string sql = "select * from line1 where 线路='北京云南1'";
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader reader = com.ExecuteReader();
            while (reader.Read())
            {
                a.Add(reader[3].ToString());
            }
            foreach (var s in a)
            {

                dpdate.Items.Add(s.ToString());
            }
            reader.Close();
            con.Close();
            //}
        }
        if (Request.Cookies["url"] != null)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = SqlDataSource1.ConnectionString;
            con.Open();
            string sql = string.Format("select * from line1 where 简介='{0}'", Request.Cookies["url"].Value.ToString());
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader reader = com.ExecuteReader();
            while (reader.Read())
            {
                tu.ImageUrl = reader[8].ToString();
                string liang1 = reader[9].ToString();
                liang.Text = liang1.Replace("\r\n", "<br/>");

                string an1 = reader[10].ToString();
                an.Text = an1.Replace("\r\n", "<br/>");

                string tui1 = reader[11].ToString();
                tui.Text = tui1.Replace("\r\n", "<br/>");

                string fei1 = reader[12].ToString();
                fei.Text = fei1.Replace("\r\n", "<br/>");
            }
            reader.Close();
            con.Close();
        }
    }
    protected void dpdate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dpdate.Text != "请选择")
        {
            date.Text = "日期：" + dpdate.SelectedValue;
        }
    }
    protected void dpdate_DataBound(object sender, EventArgs e)
    {
        dpdate.Items.Insert(0, "请选择");
    }
    protected void fangjian_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void btnbuy_Click(object sender, EventArgs e)
    {
        if (date.Text == "" || sum.Text == "")
        {
            Response.Write("<script>alert('请完善日期信息')</script>");
        }
        else
        {
            string s1 = "北京云南1";
            string str = "leixing=" + people.SelectedValue + "&xiangmu=" + s1 + "&riqi=" + date.Text + "&fangjian=" + fangjian.SelectedValue + "&jiage=" + sum.Text;
            Response.Redirect("xinxiqueren.aspx?" + str);
        }
    }
    protected void people_SelectedIndexChanged(object sender, EventArgs e)
    {
        sum.Text = "";
    }
    protected void chakan_Click(object sender, EventArgs e)
    {
        btnbuy.Visible = true;
        sum.Text = "";
        if (fangjian.SelectedItem != null && people.SelectedItem != null && date.Text != "")
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = SqlDataSource1.ConnectionString;
            con.Open();
            string sql = "select * from line1 where 线路='北京云南1' and 日期='" + dpdate.SelectedValue + "'";
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader reader = com.ExecuteReader();
            while (reader.Read())
            {
                if (people.SelectedValue == "儿童")
                {
                    sum.Text = (int.Parse(reader[4].ToString()) * 0.8).ToString();
                }
                else if (people.SelectedValue == "老人")
                {
                    sum.Text = (int.Parse(reader[4].ToString()) * 0.9).ToString();
                }
                else
                    sum.Text = reader[4].ToString();
            }
        }
        else
            Response.Write("<script>alert('请完善信息')</script>");
    }
}