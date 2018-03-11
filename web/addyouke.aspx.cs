using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

public partial class addyouke : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["name"] == null)
        {
            Response.Write("<script>alert('您还没有登录，请返回登录');window.location.href='denglu.aspx?'</script>");
        }
    }
    protected void xiangmu_SelectedIndexChanged(object sender, EventArgs e)
    {
        dpdate.Items.Clear();
        ArrayList a = new ArrayList();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource2.ConnectionString;
        con.Open();
        string sql = string.Format("select * from line1 where 线路='{0}'", xiangmu.Text);
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            a.Add (reader[3].ToString());
        }
        dpdate.Items.Insert(0, "请选择");   
        foreach (var s in a)
        {
            dpdate.Items .Add (s.ToString());
        }
        reader.Close();
        con.Close();
    }
    protected void xiangmu_DataBound1(object sender, EventArgs e)
    {
        xiangmu.Items.Insert(0, "请选择");
    }

    protected void dpdate_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource2.ConnectionString;
        con.Open();
        string sql = string.Format("select * from line1 where 线路='{0}' and 日期='{1}'", xiangmu.Text, dpdate.Text);
        SqlCommand com = new SqlCommand(sql, con);
        SqlDataReader reader = com.ExecuteReader();
        while (reader.Read())
        {
            minge.Text = reader[6].ToString();
        }
        reader.Close();
        con.Close();
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource2.ConnectionString;
        con.Open();
        string sql3 = string.Format("select * from beijingline1 where 身份证号={0}", txtnum.Text);
        SqlCommand com3 = new SqlCommand(sql3, con);
        SqlDataReader reader = com3.ExecuteReader();
        if (reader.HasRows)
        {
            Response.Write("<script>alert('已存在信息，不能重复添加')</script>");
            con.Close();
        }
        else
        {
            reader.Close();
            string sql = string.Format("insert into beijingline1 values('{0}','{1}','{2}','{3}','{4}','{5}',{6},'{7}','{8}')", txtname.Text, sex.SelectedValue, txtnum.Text, txtphone.Text, leixing.SelectedValue, dpdate.SelectedValue, int.Parse(txtprice.Text), fangjian.SelectedValue, beizhu.Text);
            SqlCommand com = new SqlCommand(sql, con);
            com.ExecuteNonQuery();
            Response.Write("<script>alert('添加成功')</script>");

            int money = int.Parse(minge.Text);
            int add = money - 1;

            
            string sql1 = string.Format("update line1 set 剩余名额={0} where 线路='{1}' and 日期='{2}'", add, xiangmu.Text, dpdate.Text);
            SqlCommand cmd = new SqlCommand(sql1 ,con );
            cmd.ExecuteNonQuery();
            con.Close();

            txtname.Text = "";
            txtnum.Text = "";
            txtphone.Text = "";
            txtprice.Text = "";
            beizhu.Text = "";
        }
    }
    protected void select_Click(object sender, EventArgs e)
    {
        //if (xiangmu.Text != "请选择"&& dpdate.Text != "请选择")
        //{
            SqlConnection con = new SqlConnection();
            con.ConnectionString = SqlDataSource1.ConnectionString;
            con.Open();

            string sql = string.Format("select * from beijingline1 where 身份证号={0}", txtnum.Text);
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader reader = com.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())//数据行流
                {
                    txtname.Text = reader[0].ToString();
                    string str = reader[1].ToString();
                    if (str == "女")
                    {
                        sex.Items[0].Selected = true;
                    }
                    else
                        sex.Items[1].Selected = true;
                    txtnum.Text = reader[2].ToString();
                    txtphone.Text = reader[3].ToString();
                    string str1 = reader[4].ToString();
                    if (str1 == "儿童")
                    {
                        leixing.Items[0].Selected = true;
                    }
                    else if (str1 == "成人")
                    {
                        leixing.Items[1].Selected = true;
                    }
                    else
                        leixing.Items[2].Selected = true;

                    dpdate.Items.Clear();
                    dpdate.Items.Add(reader[5].ToString());


                    txtprice.Text = reader[6].ToString();

                    string str2 = reader[7].ToString();
                    if (str2 == "双人标间")
                    {
                        fangjian.Items[0].Selected = true;
                    }
                    else if (str2 == "大床房")
                    {
                        fangjian.Items[1].Selected = true;
                    }
                    else
                        fangjian.Items[2].Selected = true;

                    beizhu.Text = reader[8].ToString();
                    xiangmu.Items.Clear();
                    xiangmu.Items.Add("石家庄-北京");
                }
            }
            else

                Response.Write("<script>alert('没有信息')</script>");
            reader.Close();
            con.Close();
        //}
        //else
        //    Response.Write("<script>alert('请选择路线')</script>");
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        ArrayList b = new ArrayList();
        SqlConnection con = new SqlConnection();
        con.ConnectionString = SqlDataSource1.ConnectionString;
        con.Open();
        string sql = string.Format("update beijingline1 set 顾客姓名='{0}',性别='{1}',身份证号='{2}',联系方式='{3}',类型='{4}',日期='{5}',价格={6},住房类型='{7}',备注='{8}' where 身份证号='{9}'", txtname.Text, sex.SelectedValue, txtnum.Text, txtphone.Text, leixing.SelectedValue, dpdate.SelectedValue, int.Parse(txtprice.Text), fangjian.SelectedValue, beizhu.Text,txtnum.Text  );
        SqlCommand com = new SqlCommand(sql, con);
        com.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('修改成功')</script>");

        xiangmu.Items.Clear();
        dpdate.Items.Clear();
        SqlConnection con2 = new SqlConnection();
        con2.ConnectionString = SqlDataSource2.ConnectionString;
        con2.Open();
        string sql2 = "select distinct 线路 from line1";
        SqlCommand com2 = new SqlCommand(sql2, con2);
        SqlDataReader reader = com2.ExecuteReader();
        while (reader.Read())
        {
            b.Add(reader[0].ToString());
        }
        xiangmu.Items.Insert(0, "请选择");
        foreach (var s in b)
        {
            xiangmu.Items.Add(s.ToString());
        }
        reader.Close();
        con2.Close();
        minge.Text = "";
        txtname.Text = "";
        txtnum.Text = "";
        txtphone.Text = "";
        txtprice.Text = "";
        beizhu.Text = "";
    }
}