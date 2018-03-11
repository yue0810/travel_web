using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

public partial class selectyouke : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.Cookies["name"] == null )
        {
            Response.Write("<script>alert('您还没有登录，请返回登录');window.location.href='denglu.aspx?'</script>");
        }
        if (!IsPostBack)
        {
            down.Visible = false ;
        }
    }
    protected void btnselect_Click(object sender, EventArgs e)
    {
        down.Visible =true ;
        if (dpline.Text != "请选择" && dpdate.Text != "请选择")
        {
            if (dpline.SelectedItem.Text == "北京云南1")
            {
                if (dpdate.SelectedItem.Text == "2016.5.3-2016.5.9")
                {
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = SqlDataSource1.ConnectionString;
                    con.Open();
                    if (fangxing.SelectedItem == null && txtname.Text == "")
                    {
                        string sql = "select * from yunnanline1";
                        SqlCommand com = new SqlCommand(sql, con);
                        SqlDataReader reader = com.ExecuteReader();
                        GridView1.DataSource = reader;
                        if (reader.HasRows)
                        {
                            GridView1.DataBind();
                            reader.Close();
                            con.Close();
                        }
                        else
                            Response.Write("<script>alert('没有符合条件的游客')</script>");
                    }
                    else if (fangxing.SelectedItem == null)
                    {
                        string sql = string.Format("select * from yunnanline1 where 顾客姓名='{0}'", txtname.Text);
                        SqlCommand com = new SqlCommand(sql, con);
                        SqlDataReader reader = com.ExecuteReader();
                        GridView1.DataSource = reader;
                        if (reader.HasRows)
                        {
                            GridView1.DataBind();
                            reader.Close();
                            con.Close();
                        }
                        else
                            Response.Write("<script>alert('没有符合条件的游客')</script>");
                    }
                    else if (txtname.Text == "")
                    {
                        string sql = string.Format("select * from yunnanline1 where 住房类型='{0}'", fangxing.SelectedItem.Text);
                        SqlCommand com = new SqlCommand(sql, con);
                        SqlDataReader reader = com.ExecuteReader();
                        if (reader.HasRows)
                        {
                            GridView1.DataSource = reader;
                            GridView1.DataBind();
                            reader.Close();
                            con.Close();
                        }
                        else
                            Response.Write("<script>alert('没有符合条件的游客')</script>");
                    }
                    else
                    {
                        string sql = string.Format("select * from yunnanline1 where 顾客姓名='{0}' and 住房类型='{1}'", txtname.Text, fangxing.SelectedItem.Text);
                        SqlCommand com = new SqlCommand(sql, con);
                        SqlDataReader reader = com.ExecuteReader();
                        GridView1.DataSource = reader;
                        if (reader.HasRows)
                        {
                            GridView1.DataBind();
                            reader.Close();
                            con.Close();
                        }
                        else
                            Response.Write("<script>alert('没有符合条件的游客')</script>");
                    }
                }

                else
                {
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = SqlDataSource1.ConnectionString;
                    con.Open();
                    if (fangxing.SelectedItem == null)
                    {
                        string sql = string.Format("select * from yunnanline2 where 顾客姓名='{0}'", txtname.Text);
                        SqlCommand com = new SqlCommand(sql, con);
                        SqlDataReader reader = com.ExecuteReader();
                        GridView1.DataSource = reader;
                        if (reader.HasRows)
                        {
                            GridView1.DataBind();
                            reader.Close();
                            con.Close();
                        }
                        else
                            Response.Write("<script>alert('没有符合条件的游客')</script>");
                    }
                    else if (txtname.Text == "")
                    {
                        string sql = string.Format("select * from yunnanline2 where 住房类型='{0}'", fangxing.SelectedItem.Text);
                        SqlCommand com = new SqlCommand(sql, con);
                        SqlDataReader reader = com.ExecuteReader();
                        if (reader.HasRows)
                        {
                            GridView1.DataSource = reader;
                            GridView1.DataBind();
                            reader.Close();
                            con.Close();
                        }
                        else
                            Response.Write("<script>alert('没有符合条件的游客')</script>");
                    }
                    else
                    {
                        string sql = string.Format("select * from yunnanline2 where 顾客姓名='{0}' and 住房类型='{1}'", txtname.Text, fangxing.SelectedItem.Text);
                        SqlCommand com = new SqlCommand(sql, con);
                        SqlDataReader reader = com.ExecuteReader();
                        GridView1.DataSource = reader;
                        if (reader.HasRows)
                        {
                            GridView1.DataBind();
                            reader.Close();
                            con.Close();
                        }
                        else
                            Response.Write("<script>alert('没有符合条件的游客')</script>");
                    }
                }
            }

            else if ((dpline.SelectedItem.Text == "石家庄-北京"))
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = SqlDataSource1.ConnectionString;
                con.Open();
                if (fangxing.SelectedItem == null && txtname.Text == "")
                {
                    string sql = "select * from beijingline1";
                    SqlCommand com = new SqlCommand(sql, con);
                    SqlDataReader reader = com.ExecuteReader();
                    GridView1.DataSource = reader;
                    if (reader.HasRows)
                    {
                        GridView1.DataBind();
                        reader.Close();
                        con.Close();
                    }
                    else
                        Response.Write("<script>alert('没有符合条件的游客')</script>");
                }
                else if (fangxing.SelectedItem == null)
                {
                    string sql = string.Format("select * from beijingline1 where 顾客姓名='{0}'", txtname.Text);
                    SqlCommand com = new SqlCommand(sql, con);
                    SqlDataReader reader = com.ExecuteReader();
                    GridView1.DataSource = reader;
                    if (reader.HasRows)
                    {
                        GridView1.DataBind();
                        reader.Close();
                        con.Close();
                    }
                    else
                        Response.Write("<script>alert('没有符合条件的游客')</script>");
                }
                else if (txtname.Text == "")
                {
                    string sql = string.Format("select * from beijingline1 where 住房类型='{0}'", fangxing.SelectedItem.Text);
                    SqlCommand com = new SqlCommand(sql, con);
                    SqlDataReader reader = com.ExecuteReader();
                    if (reader.HasRows)
                    {
                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                        reader.Close();
                        con.Close();
                    }
                    else
                        Response.Write("<script>alert('没有符合条件的游客')</script>");
                }
                else
                {
                    string sql = string.Format("select * from beijingline1 where 顾客姓名='{0}' and 住房类型='{1}'", txtname.Text, fangxing.SelectedItem.Text);
                    SqlCommand com = new SqlCommand(sql, con);
                    SqlDataReader reader = com.ExecuteReader();
                    GridView1.DataSource = reader;
                    if (reader.HasRows)
                    {
                        GridView1.DataBind();
                        reader.Close();
                        con.Close();
                    }
                    else
                        Response.Write("<script>alert('没有符合条件的游客')</script>");
                }
            }
        }
        else
        {
            Response.Write("<script>alert('请选择线路')</script>");
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
    protected void down_Click(object sender, EventArgs e)
    {
        dpdate.Items.Clear();
        dpdate.Items.Insert(0, "请选择");
        txtname.Text = "";
        GridView1.DataSource = null;
        GridView1.DataBind();
        down.Visible = false;
    }
}