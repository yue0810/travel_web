using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

public partial class sou : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ArrayList jianjie = new ArrayList();
        ArrayList img = new ArrayList();
        ArrayList url = new ArrayList();
        if (Request.QueryString["chufa"] == null || Request.QueryString["mudi"] == null)
        {
            Response.Write("<script>alert('请返回首页进行查询');window.location.href='denglu.aspx?'</script>");
        }
        else
        {
            string s1 = Request.QueryString["chufa"].ToString();
            string s2 = Request.QueryString["mudi"].ToString();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = SqlDataSource1.ConnectionString;
            con.Open();
            string sql = string.Format("select * from line1 where 出发城市='{0}' and 到达城市='{1}'", s1, s2);
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader reader = com.ExecuteReader();
            while (reader.Read())
            {
                jianjie.Add(reader[7].ToString());
                img.Add(reader[8].ToString());
            }
            reader.Close();
            con.Close();
            for (int i = 0; i < img.Count; i++)
            {
                TableCell cell = new TableCell();
                TableRow row = new TableRow();
                Image im = new Image();
                im.ID = "im" + i.ToString();
                im.ImageUrl = img[i].ToString();
                row.Cells.Add(cell);
                image.Rows.Add(row);
                cell.Controls.Add(im);
            }
            for (int i = 0; i < jianjie.Count; i++)
            {
                TableCell cell = new TableCell();
                cell.Height = 210;
                cell.Width = 300;
                TableRow row = new TableRow();
                LinkButton lk = new LinkButton();
                lk.ID = "lk" + i.ToString();
                lk.Text = jianjie[i].ToString();
                row.Cells.Add(cell);
                jieshao.Rows.Add(row);
                cell.Controls.Add(lk);
                lk.Click += new EventHandler(lk_Click);
            }
        }
    }
    protected void lk_Click(object sender, EventArgs e)
    {
        LinkButton hl = (LinkButton)sender;
        string s1 = hl.Text;
        SqlConnection con = new SqlConnection();
        con.ConnectionString =SqlDataSource1.ConnectionString ;
        con.Open ();
        string sql=string .Format ("select * from line1 where 简介='{0}'",s1);
        SqlCommand com=new SqlCommand (sql,con);
        SqlDataReader reader=com.ExecuteReader ();
        while (reader.Read())
        {
            string s2 = reader[7].ToString();
            HttpCookie cok = new HttpCookie("url");
            cok.Value = s2;
            cok.Expires = DateTime.Now;
            cok.Expires = DateTime.Now.AddMinutes(20);
            Response.Cookies.Add(cok);
            Response.Redirect("Default3.aspx");
        }
    }
}