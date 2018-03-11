using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

public partial class shouye : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void chufa_DataBound(object sender, EventArgs e)
    {
        chufa.Items.Insert(0, "请选择");
    }
    protected void chufa_SelectedIndexChanged(object sender, EventArgs e)
    {
        ArrayList a = new ArrayList();
        mudi.Items.Clear();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();
        string sql = string.Format("select distinct 到达城市 from line1 where 出发城市='{0}'", chufa.SelectedValue);
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            a.Add(reader[0].ToString());
        }
        foreach (var x in a)
        {
            mudi.Items.Add(x.ToString());
        }
        reader.Close();
        con.Close();
    }
    protected void mudi_DataBound(object sender, EventArgs e)
    {
        mudi.Items.Insert(0, "请选择");
    }
    protected void search_Click(object sender, EventArgs e)
    {
        string str = "chufa=" + chufa.SelectedValue + "&mudi=" + mudi.SelectedValue;
        Response.Redirect("sou.aspx?" + str);
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        foreach (DataListItem  da in DataList1.Items)
        {
            LinkButton link = (LinkButton)da.FindControl("jianjie");
            link.Click += new EventHandler(link_Click);
        }
    }

    protected void link_Click(object sender, EventArgs e)
    {
        LinkButton link1 = (LinkButton)sender;
        string s2 = link1.Text;
        HttpCookie cok = new HttpCookie("url");
        cok.Value = s2;
        Response.Cookies.Add(cok);
        Response.Redirect("Default3.aspx");
    }

    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {
        foreach (DataListItem da in DataList2.Items)
        {
            LinkButton link = (LinkButton)da.FindControl("jianjie");
            link.Click += new EventHandler(link_Click);
        }
    }
}