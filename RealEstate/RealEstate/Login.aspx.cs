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
    public partial class Login : System.Web.UI.Page
    {
        DataBaseClass Database = new DataBaseClass();
        string InsertQuery = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterUser_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                if (!agent.Checked)
                {
                    InsertQuery = "select * from PROSPECTIVE_RENTER where email_address='" + email.Text + "' and password='" + password.Text + "'";
                    dt = Database.FetchData(InsertQuery);
                    if (dt.Rows.Count > 0)
                    {
                        Session["UserID"] = dt.Rows[0]["user_id"];
                        Session["Role"] = "Renter";
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed')", true);
                    }

                }
                else 
                {
                    InsertQuery = "select * from AGENT where email_address='" + email.Text + "' and password='" + password.Text + "'";
                    dt = Database.FetchData(InsertQuery);
                    if (dt.Rows.Count > 0)
                    {
                        Session["UserID"] = dt.Rows[0]["user_id"];
                        Session["Role"] = "Agent";
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed')", true);
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}