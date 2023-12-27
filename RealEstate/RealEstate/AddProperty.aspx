<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProperty.aspx.cs" Inherits="RealEstate.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   

    <center>
           <h2>Add New Property</h2>
           Rent/Sale: <asp:DropDownList runat="server" ID="rentsale" >
               <asp:ListItem Value="rent" Text="rent"></asp:ListItem>
               <asp:ListItem Value="sale" Text="sale"></asp:ListItem>
                           </asp:DropDownList>
           Property Type:  <asp:DropDownList runat="server" ID="property_type" autopostback="true" OnSelectedIndexChanged="property_type_SelectedIndexChanged">
               <asp:ListItem Value="OPENLAND" Text="OPEN_LAND"></asp:ListItem>
               <asp:ListItem Value="HOUSES" Text="HOUSES"></asp:ListItem>
                <asp:ListItem Value="COMMERCIALBUILDINGS" Text="COMMERCIAL_BUILDINGS"></asp:ListItem>
                <asp:ListItem Value="VACATIONHOUSE" Text="VACATION_HOUSE"></asp:ListItem>
                <asp:ListItem Value="APARTMENTS" Text="APARTMENTS"></asp:ListItem>

                           </asp:DropDownList>
        Description: <asp:TextBox runat="server" ID="description" ></asp:TextBox> <br /><br />
        Available Date: <asp:TextBox runat="server" ID="availability_date" date="date" ></asp:TextBox>
           
        Square Footage: <asp:TextBox runat="server" ID="square_footage" ></asp:TextBox>
           <br /><br />
           Address:<asp:DropDownList runat="server" ID="address_id" width="150px"></asp:DropDownList>
            Agency:<asp:Textbox runat="server" ID="agency_id" ></asp:Textbox>
            Neighborhood Name:<asp:DropDownList runat="server" ID="neighborhood_names" width="150px"></asp:DropDownList>
           <br /><br />

                    
         Price:<asp:Textbox runat="server" ID="price" ></asp:Textbox>
            Wifi:<asp:Textbox runat="server" ID="wifi" ></asp:Textbox>
            Electricity:<asp:Textbox runat="server" ID="electricity" ></asp:Textbox>
         Gas:<asp:Textbox runat="server" ID="gas" ></asp:Textbox>
           <br /><br />

           
           <div id="OPENLAND" runat="server" visible="false">
               <h3>Openland Details</h3>
               Has road access: <asp:dropdownlist runat="server" ID="has_road_access" >
                    <asp:ListItem Value="True" Text="Yes"></asp:ListItem>
               <asp:ListItem Value="False" Text="No"></asp:ListItem>
                                </asp:dropdownlist>
               Residental:<asp:dropdownlist runat="server" ID="residental" >
                    <asp:ListItem Value="True" Text="Yes"></asp:ListItem>
               <asp:ListItem Value="False" Text="No"></asp:ListItem>
                                </asp:dropdownlist>
               Water Availability:<asp:dropdownlist runat="server" ID="water_availability" >
                    <asp:ListItem Value="True" Text="Yes"></asp:ListItem>
               <asp:ListItem Value="False" Text="No"></asp:ListItem>
                                </asp:dropdownlist>


           </div>


            <div id="HOUSES" runat="server" visible="false">
                <h3>Houses Details</h3>
                 No of bathrooms: <asp:TextBox runat="server" ID="no_of_bathrooms" ></asp:TextBox>
                 No of bedrooms: <asp:TextBox runat="server" ID="no_of_bedrooms" ></asp:TextBox>
                Parking: <asp:dropdownlist runat="server" ID="parking" >
                    <asp:ListItem Value="True" Text="Yes"></asp:ListItem>
               <asp:ListItem Value="False" Text="No"></asp:ListItem>
                                </asp:dropdownlist>

           </div>

            <div id="COMMERCIALBUILDINGS" runat="server" visible="false">
                <h3>Commertial Building Details</h3>
                 No of cameras: <asp:TextBox runat="server" ID="no_of_cameras" ></asp:TextBox>
                 Types_of_business: <asp:TextBox runat="server" ID="types_of_business" ></asp:TextBox>
                safety_measures: <asp:TextBox runat="server" ID="safety_measures" ></asp:TextBox><br /><br />
                Alarm: <asp:dropdownlist runat="server" ID="alarm" >
                    <asp:ListItem Value="True" Text="Yes"></asp:ListItem>
               <asp:ListItem Value="False" Text="No"></asp:ListItem>
                                </asp:dropdownlist>
           </div>

            <div id="VACATIONHOUSE" runat="server" visible="false">
                <h3>Vacation house Details</h3>
                 Occupancy limit: <asp:TextBox runat="server" ID="occupancy_limit" ></asp:TextBox>
                 Pool Size: <asp:TextBox runat="server" ID="pool_size" ></asp:TextBox>
                Types_of_vacation: <asp:TextBox runat="server" ID="types_of_vacation" ></asp:TextBox><br /><br />
                No_of_bedrooms: <asp:TextBox runat="server" ID="no_of_bedroomsvh" ></asp:TextBox>
                Home_theater: <asp:dropdownlist runat="server" ID="home_theater" >
                    <asp:ListItem Value="True" Text="Yes"></asp:ListItem>
               <asp:ListItem Value="False" Text="No"></asp:ListItem>
                                </asp:dropdownlist>

           </div>


            <div id="APARTMENTS" runat="server" visible="false">
                <h3>Appartment Details</h3>
                 building_type: <asp:TextBox runat="server" ID="building_type" ></asp:TextBox>
                 No_of_bedrooms: <asp:TextBox runat="server" ID="no_of_bedroomsa" ></asp:TextBox>
                No_of_bathrooms: <asp:TextBox runat="server" ID="no_of_bathroomsa" ></asp:TextBox>
               <br /><br />
                pets_allowed: <asp:dropdownlist runat="server" ID="pets_allowed" >
                    <asp:ListItem Value="True" Text="Yes"></asp:ListItem>
               <asp:ListItem Value="False" Text="No"></asp:ListItem>
                                </asp:dropdownlist>

           </div>



        <br />
        <br />
        <asp:Button runat="server" ID="UpdateProperty" Text="Save Property" OnClick="UpdateProperty_Click" />
</asp:Content>
