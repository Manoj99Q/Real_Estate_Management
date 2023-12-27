using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealEstate
{
    public partial class Contact : Page
    {
        DataBaseClass Database = new DataBaseClass();
        string InsertQuery = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(!IsPostBack)
                {
                    InsertQuery = "select * from NEIGHBORHOOD";
                    DataTable dt = new DataTable();
                    dt = Database.FetchData(InsertQuery);
                    if (dt.Rows.Count > 0)
                    {
                        neighborhood_names.Items.Clear();
                        neighborhood_names.Items.Insert(0, "--select--");
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            neighborhood_names.Items.Insert(i + 1, dt.Rows[i]["neighborhood_name"].ToString());
                        }
                    }
                    InsertQuery = "select * from ADDRESS ";
                    DataTable dt2 = new DataTable();
                    dt2 = Database.FetchData(InsertQuery);
                    if (dt2.Rows.Count > 0)
                    {
                        address_id.Items.Insert(0, "--select--");
                        for (int i = 0; i < dt2.Rows.Count; i++)
                        {
                            address_id.Items.Insert(1, dt.Rows[i]["address_id"].ToString() + "-" + dt.Rows[i]["apartment_number"].ToString() + " " + dt.Rows[i]["street_name"].ToString() + " " + dt.Rows[i]["city"].ToString() + " " + dt.Rows[i]["state"].ToString() + " " + dt.Rows[i]["zip"].ToString());

                        }



                    }
                }
            }
            catch(Exception ex)
            {

            }
        }

        protected void property_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (property_type.SelectedValue == "OPENLAND")
                {
                    OPENLAND.Visible = true;
                    HOUSES.Visible = false;
                    COMMERCIALBUILDINGS.Visible = false;
                    VACATIONHOUSE.Visible = false;
                    APARTMENTS.Visible = false;
                }
                else if (property_type.SelectedValue == "HOUSES")
                {
                    OPENLAND.Visible = false;
                    HOUSES.Visible = true;
                    COMMERCIALBUILDINGS.Visible = false;
                    VACATIONHOUSE.Visible = false;
                    APARTMENTS.Visible = false;
                }
                else if (property_type.SelectedValue == "COMMERCIALBUILDINGS")
                {
                    OPENLAND.Visible = false;
                    HOUSES.Visible = false;
                    COMMERCIALBUILDINGS.Visible = true;
                    VACATIONHOUSE.Visible = false;
                    APARTMENTS.Visible = false;
                }
                else if (property_type.SelectedValue == "VACATIONHOUSE")
                {
                    OPENLAND.Visible = false;
                    HOUSES.Visible = false;
                    COMMERCIALBUILDINGS.Visible = false;
                    VACATIONHOUSE.Visible = true;
                    APARTMENTS.Visible = false;
                }
                else if (property_type.SelectedValue == "APARTMENTS")
                {
                    OPENLAND.Visible = false;
                    HOUSES.Visible = false;
                    COMMERCIALBUILDINGS.Visible = false;
                    VACATIONHOUSE.Visible = false;
                    APARTMENTS.Visible = true;
                }


            }
            catch(Exception ex)
            {

            }
        }

        protected void UpdateProperty_Click(object sender, EventArgs e)
        {
            try
            {
                InsertQuery = "select COALESCE(max(property_id)+1,1) as PID from PROPERTY";
                DataTable dt = new DataTable();
                dt = Database.FetchData(InsertQuery);

                string propid = dt.Rows[0]["PID"].ToString();
                string[] addsplit = address_id.SelectedValue.Split('-');

                InsertQuery = "insert into PROPERTY(property_id,rental_or_sale, property_type, description, availability_date, address_id, agency_id, neighborhood_name) " +
                    " values(" + propid + ",'" + rentsale.SelectedValue.ToString() + "','" + property_type.SelectedValue + "', '" + description.Text + "', '" + availability_date.Text + "'," + addsplit[0] + " , " + agency_id.Text + ", '" + neighborhood_names.SelectedValue + "')";

                if (Database.InsertData(InsertQuery))
                {
                   
                    if (rentsale.SelectedValue == "rent")
                    {
                        InsertQuery = "INSERT INTO RENT (deposit, monthlyRent, wifi, electricity, gas, property_id) " +
                             " VALUES (256 , " + price.Text + "," + wifi.Text + " ," + electricity.Text + "," + gas.Text + ", " + propid + ")";
                    }
                    else
                    {
                        InsertQuery = "INSERT INTO SALE (propertyCost, registrationFee, wifi, electricity, gas, property_id) " +
                             " VALUES (" + price.Text + ",257 ," + wifi.Text + ", " + electricity.Text + "," + gas.Text + ", " + propid + ")";
                    }
                    
                    if (Database.InsertData(InsertQuery))
                    {
                        if (property_type.SelectedValue == "OPENLAND")
                        {
                            InsertQuery = "INSERT INTO OPEN_LAND (property_id, square_footage, has_road_access, residental, water_availability) " +
                                " values(" + propid + "," + square_footage.Text + "," + has_road_access.SelectedValue + "," + residental.SelectedValue + "," + water_availability.SelectedValue + ")";

                        }
                        else if (property_type.SelectedValue == "HOUSES")
                        {
                            InsertQuery = "INSERT INTO HOUSES (property_id, square_footage, no_of_bathrooms, no_of_bedrooms, parking) " +
                                " values(" + propid + "," + square_footage.Text + "," + no_of_bathrooms.Text + "," + no_of_bedrooms.Text + "," + parking.SelectedValue + ")";
                        }
                        else if (property_type.SelectedValue == "COMMERCIALBUILDINGS")
                        {
                            InsertQuery = "INSERT INTO COMMERCIAL_BUILDINGS (property_id, square_footage, no_of_cameras, types_of_business, alarm) " +
                                " values(" + propid + "," + square_footage.Text + "," + no_of_cameras.Text + ",'" + types_of_business.Text + "'," + alarm.SelectedValue + ")";
                        }
                        else if (property_type.SelectedValue == "VACATIONHOUSE")
                        {
                            InsertQuery = "INSERT INTO VACATION_HOUSE (property_id, square_footage, occupancy_limit, pool_size, types_of_vacation, no_of_bedrooms, home_theater) " +
                                " values(" + propid + "," + square_footage.Text + "," + occupancy_limit.Text + "," + pool_size.Text + ",'" + types_of_vacation.Text + "'," + no_of_bedroomsvh.Text + "," + home_theater.SelectedValue + ")";
                        }
                        else if (property_type.SelectedValue == "APARTMENTS")
                        {
                            InsertQuery = "INSERT INTO APARTMENTS (property_id, building_type, no_of_bedrooms, no_of_bathrooms, pets_allowed) " +
                                " values(" + propid + ",'" + building_type.Text + "'," + no_of_bedroomsa.Text + "," + no_of_bathroomsa.Text + "," + pets_allowed.SelectedValue + ")";
                        }
                    }

                    if (Database.InsertData(InsertQuery))
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Success')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed, Please try again')", true);
                    }


                }


            }
            catch (Exception ex) { 
            
            }
        }
    }
}