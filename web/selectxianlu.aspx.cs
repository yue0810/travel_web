using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

public partial class selectxianlu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.Cookies["name"] == null )
        {
            Response.Write("<script>alert('您还没有登录，请返回登录');window.location.href='denglu.aspx?'</script>");
        }
    }
    protected void btnselect_Click(object sender, EventArgs e)
    {
        //if (txtmudi.SelectedValue != "请选择" && txtchufa.SelectedValue != "请选择")
        //{
                SqlConnection con = new SqlConnection();
                con.ConnectionString = SqlDataSource1.ConnectionString;
                con.Open();
                if (txtmudi.SelectedValue == "请选择" &&txtchufa.SelectedValue != "请选择")
                {
                    string sql = string.Format("select 线路,出发城市,到达城市,日期,价格,剩余名额,简介 from line1 where 出发城市='{0}'", txtchufa.SelectedValue);
                    SqlCommand com = new SqlCommand(sql, con);
                    SqlDataReader reader = com.ExecuteReader();
                    if (reader.HasRows)
                    {
                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                    }
                    reader.Close();
                //}
                //else if (txtchufa.SelectedValue  == "请选择" && txtmudi.SelectedValue != "请选择")
                //{
                //    string sql = string.Format("select 线路,出发城市,到达城市,日期,价格,剩余名额,简介 from line1 where 到达城市='{0}'", txtmudi.SelectedValue);
                //    SqlCommand com = new SqlCommand(sql, con);
                //    SqlDataReader reader = com.ExecuteReader();
                //    if (reader.HasRows)
                //    {
                //        GridView1.DataSource = reader;
                //        GridView1.DataBind();
                //    }
                //    reader.Close();
                }
                else if(txtmudi.SelectedValue != "请选择" && txtchufa.SelectedValue != "请选择")
                {
                    string sql = string.Format("select 线路,出发城市,到达城市,日期,价格,剩余名额,简介 from line1 where 到达城市='{0}' and 出发城市='{1}'", txtmudi.SelectedValue, txtchufa.SelectedValue);
                    SqlCommand com = new SqlCommand(sql, con);
                    SqlDataReader reader = com.ExecuteReader();
                    if (reader.HasRows)
                    {
                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                    }
                    reader.Close();
                
                con.Close();
            }
        //}
        else
            Response.Write("<script>alert('请选择城市')</script>");
    }
    protected void txtchufa_DataBound(object sender, EventArgs e)
    {
        txtchufa.Items.Insert(0, "请选择");
    }
    protected void txtchufa_SelectedIndexChanged(object sender, EventArgs e)
    {
        ArrayList a = new ArrayList();
        txtmudi.Items.Clear();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();
        string sql=string .Format ("select distinct 到达城市 from line1 where 出发城市='{0}'",txtchufa .SelectedValue);
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            txtmudi.Items.Clear();
            a.Add(reader[0].ToString());
        }
        txtmudi.Items.Insert(0, "请选择");
        foreach (var s in a)
        {
            txtmudi.Items.Add(s.ToString());
        }
        reader.Close();
        con.Close();
    }
}