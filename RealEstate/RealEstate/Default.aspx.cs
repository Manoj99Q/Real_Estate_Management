using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class _Default : Page
    {
        DataBaseClass Database = new DataBaseClass();
        string InsertQuery = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
                {


                    if (Session["Role"].ToString() == "Agent")
                    {
                       
                    }
                    else
                    {

                    }

                    InsertQuery = " select p.property_id,p.rental_or_sale,p.property_type,p.description,p.neighborhood_name, r.monthlyRent,s.propertyCost from " +
                        "PROPERTY p left join public.rent r on r.property_id=p.property_id left join public.sale s on s.property_id=p.property_id " +
                        " where p.property_id is not null ";
                    DataTable dt = new DataTable();
                    dt = Database.FetchData(InsertQuery);
                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        GridView1.Visible = true;
                    }
                    else
                    {
                        GridView1.DataSource = null;
                        GridView1.DataBind();
                        GridView1.Visible = false;
                    }

                    InsertQuery = "select * from credit_card_info where user_id = " + Session["UserID"].ToString() + " ";
                    dt.Rows.Clear();
                    dt.Columns.Clear();
                    dt.Clear();
                    dt = Database.FetchData(InsertQuery);
                    if(dt.Rows.Count > 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            pid.Items.Insert(i, dt.Rows[0]["credit_card_number"] + "-" + dt.Rows[0]["name_on_card"]);

                        }
                    }



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

                InsertQuery = "delete from SALE where property_id = " + ID + "";
                Database.InsertData(InsertQuery);
                InsertQuery = "delete from RENT where property_id = " + ID + "";
                Database.InsertData(InsertQuery);
                InsertQuery = "delete from APARTMENTS where property_id = " + ID + "";
                Database.InsertData(InsertQuery);
                InsertQuery = "delete from VACATION_HOUSE where property_id = " + ID + "";
                Database.InsertData(InsertQuery);
                InsertQuery = "delete from COMMERCIAL_BUILDING where property_id = " + ID + "";
                Database.InsertData(InsertQuery);
                InsertQuery = "delete from HOUSE where property_id = " + ID + "";
                Database.InsertData(InsertQuery);
                InsertQuery = "delete from PROPERTY where property_id = " + ID + "";
                Database.InsertData(InsertQuery);

            }
            catch (Exception ex)
            {

            }
        }

        protected void Book_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                string ID = btn.CommandArgument[0].ToString();

                ref1.Text = "Booking for property id : " + ID + "";
                Session["BPID"] = ID;
                reserid.Visible = true;

            }
            catch (Exception ex)
            {

            }
        }



        protected void Filter_Click(object sender, EventArgs e)
        {
            try
            {
                InsertQuery = " select p.property_id,p.rental_or_sale,p.property_type,p.description,p.neighborhood_name, r.monthlyRent,s.propertyCost from " +
                       "PROPERTY p left join public.rent r on r.property_id=p.property_id left join public.sale s on r.property_id=p.property_id " +
                       " where p.property_id is not null ";

                InsertQuery = InsertQuery + " and p.rental_or_sale = '" + rs.SelectedValue + "' ";

                InsertQuery = InsertQuery + " and p.property_type = '" + property_type.SelectedValue + "' ";

                DataTable dt = new DataTable();
                dt = Database.FetchData(InsertQuery);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    GridView1.Visible = true;
                }
                else
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                    GridView1.Visible = false;
                }



            }
            catch (Exception ex)
            {

            }
        }



        protected void confirmbooking_Click(object sender, EventArgs e)
        {
            try
            {
                string[] psplit = pid.SelectedValue.Split('-');


                DateTime dt1 = DateTime.ParseExact(midate.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                DateTime dt2 = DateTime.ParseExact(modate.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
                int monthsApart = (dt2.Year - dt1.Year) * 12 + dt2.Month - dt1.Month; ;


                InsertQuery = "INSERT INTO BOOKINGS ( end_date, start_date, rental_period, credit_card_number, property_id, user_id) " +
                    " VALUES ('" + modate.Text + "', '" + midate.Text + "', '" + monthsApart + "', " + psplit[0] + ", " + Session["BPID"].ToString() + ", " + Session["UserID"].ToString() + ")";


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
            catch (Exception ex)
            {

            }
        }





    }
}