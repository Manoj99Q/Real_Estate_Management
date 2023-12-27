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
    public partial class About : Page
    {
        DataBaseClass Database = new DataBaseClass();
        string InsertQuery = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                InsertQuery = "select * from public.ADDRESS where user_id=" + Session["UserID"] + "";
                DataTable dt = new DataTable();
                dt = Database.FetchData(InsertQuery);
                if (dt.Rows.Count > 0)
                {
                    for(int i = 0; i < dt.Rows.Count; i++)
                    {
                        useraddress.Items.Insert(i, dt.Rows[i]["address_id"].ToString() + "-" + dt.Rows[i]["street_number"].ToString() + " " + dt.Rows[i]["zip"].ToString());
                    }
                     
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }

                InsertQuery = "select * from credit_card_info where user_id=" + Session["UserID"] + "";
                
                dt = Database.FetchData(InsertQuery);
                if (dt.Rows.Count > 0)
                {
                    GridView2.DataSource = dt;
                    GridView2.DataBind();
                }
            }
            catch(Exception ex)
            {

            }
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();

                GridView2.PageIndex = e.NewPageIndex;
                GridView2.DataBind();

            }
            catch (Exception ex)
            {

            }

        }
        protected void SaveAddress_Click(object sender, EventArgs e)
        {
            try
            {
                try
                {


                    InsertQuery = "INSERT INTO ADDRESS (apartment_number, street_number,street_name, city, state, zip,user_id) " +
                        " VALUES ('" + Aptno.Text + "', '" + StNo.Text + "','" + street_name.Text + "', '" + city.Text + "', '" + state.Text + "', '" + zipcode.Text + "'," + Session["UserID"] + ")";

                    if (Database.InsertData(InsertQuery))
                    {
                                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success')", true);
                     }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed')", true);
                    }

                }
                catch (Exception ex)
                {

                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void AddPayment_Click(object sender, EventArgs e)
        {
            try
            {
                string[] seladd = useraddress.SelectedValue.Split('-');

                InsertQuery = "insert into credit_card_info(credit_card_number, name_on_card, expiry_date, address_id,user_id) " +
                           " values(" + cardno.Text + ",'" + name.Text + "','" + expdate.Text + "'," + seladd[0] + "," + Session["UserID"] + ")";

                if (Database.InsertData(InsertQuery))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed')", true);
                }


            }
            catch (Exception ex)
            {

            }
        }
    }
}