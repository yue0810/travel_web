using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class xinxiqueren : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["putong"] == null)
        {
            Response.Write("<script>alert('您还没有登录，请返回登录');window.location.href='denglu.aspx?'</script>");
        }
        else
        {
            if (Request.QueryString["leixing"] == null || Request.QueryString["xiangmu"] == null || Request.QueryString["riqi"] == null || Request.QueryString["fangjian"] == null || Request.QueryString["jiage"] == null)
            {
                Response.Write("<script>alert('请返回完善信息');window.location.href='yunnan1.aspx'</script>");
            }
            else
            {
                lbleixing.Text = Request.QueryString["leixing"].ToString();
                lbfang.Text = Request.QueryString["fangjian"].ToString();
                lbdate.Text = Request.QueryString["riqi"].ToString();
                lbsum.Text = Request.QueryString["jiage"].ToString();
                lbxiangmu.Text = Request.QueryString["xiangmu"].ToString();
            }
        }
    }
    protected void btnzhifu_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();
        string sql1 = string.Format("select * from yunnanline1 where 身份证号='{0}'", txtnum.Text);
        SqlCommand com2 = new SqlCommand(sql1, con);
        SqlDataReader reader = com2.ExecuteReader();
        if (reader .HasRows )
        {
            Response.Write("<script>alert('您已购买该旅程')</script>");
            reader.Close();
            con.Close();
        }
        else
        {
            reader.Close();
            string sql = string.Format("insert into yunnanline1 values('{0}','{1}','{2}','{3}','{4}','{5}',{6},'{7}')", txtname.Text, txtnum.Text,lbleixing .Text , lbfang.Text, txtphone.Text, lbdate.Text, int.Parse(lbsum.Text),beizhu .Text );
            SqlCommand com = new SqlCommand(sql, con);
            com.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('支付成功，确认返回首页');window.location.href='shouye.aspx'</script>");
            con.Close();
        }

    }
}