using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class ManageBookings : System.Web.UI.Page
    {
        DataBaseClass Database = new DataBaseClass();
        string InsertQuery = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    InsertQuery = "select * from BOOKINGS where user_id = " + Session["UserID"].ToString() + "";

                    DataTable dt = new DataTable();
                    dt = Database.FetchData(InsertQuery);
                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }

            }
            catch
            {

            }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {

            }

        }
        protected void Deletion_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                string ID = btn.CommandArgument[0].ToString();

                InsertQuery = "delete from BOOKINGS where booking_id = " + ID + "";

                if (Database.InsertData(InsertQuery))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success')", true);
                    Response.Redirect("ManageBookings.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed')", true);
                }

            }
            catch { }
        }
    }
}