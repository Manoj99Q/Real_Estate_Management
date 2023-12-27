using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogoutUser_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Clear();
                Response.Redirect("Login.aspx");
            }
            catch(Exception ex)
            {

            }
        }
    }
}