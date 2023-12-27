using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class Register : System.Web.UI.Page
    {
        DataBaseClass Database  = new DataBaseClass();
        string InsertQuery = "";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterUser_Click(object sender, EventArgs e)
        {
            try
            {
                if (!agent.Checked)
                {
                    InsertQuery = "INSERT INTO PROSPECTIVE_RENTER ( email_address, password, first_name,  last_name) " +
                        " VALUES ('" + email.Text + "', '" + password.Text + "', '" + firstname.Text + "','" + lastname.Text + "')";

                    if (Database.InsertData(InsertQuery))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success')", true);
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed')", true);
                    }

                }
                else 
                {
                    InsertQuery = "INSERT INTO AGENT (email_address, password, first_name, last_name) " +
                        " values('" + email.Text + "', '" + password.Text + "', '" + firstname.Text + "', '" + lastname.Text + "')";
                    if (Database.InsertData(InsertQuery))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success')", true);
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed')", true);
                    }
                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}