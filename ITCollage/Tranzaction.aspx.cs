using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITCollage
{
    public partial class Tranzaction : System.Web.UI.Page
    {
        public static string connectionstring = ConfigurationManager.ConnectionStrings["ITCollage"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionstring);
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd1 = new SqlCommand();
        SqlTransaction tran;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(DropDownList1.SelectedValue);
            decimal amount = Convert.ToDecimal(TextBox1.Text);
            conn.Open();
            tran = conn.BeginTransaction();
            try
            {
                cmd.CommandText = "insert into PaymentsDate(IDStudent, PayDate) values(@id, @Date)";
                cmd.Connection = conn;
                cmd.Transaction = tran;
                cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
                cmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = DateTime.Now;
                cmd.ExecuteNonQuery();

                cmd1.CommandText = "insert into Payments(IdStudent, Amount) values (@id, @amount)";
                cmd1.Connection = conn;
                cmd1.Transaction = tran;
                cmd1.Parameters.Add("@id", SqlDbType.Int).Value = id;
                cmd1.Parameters.Add("@amount", SqlDbType.Decimal).Value = amount;
                cmd1.ExecuteNonQuery();

                tran.Commit();
                GridView1.DataBind();
                GridView2.DataBind();
                Label1.Text = "Транзакция принята";

            }
            catch (SqlException sqlex)
            {
                tran.Rollback();
                Label1.Text = "Транзакция отменена:" + sqlex;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }
    }
}