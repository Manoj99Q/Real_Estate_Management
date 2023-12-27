<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RealEstate._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <style>

        .btnExample {
  background-color: #007bff;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
    </style>

    <main>
       

        <div class="row">
    

              <table>
                    <tr>
                       
                        <th>
                            <div style="padding-left: 10px">
                                  Rent/Sale: <asp:DropDownList runat="server" ID="rs" >
               <asp:ListItem Value="rent" Text="rent"></asp:ListItem>
               <asp:ListItem Value="sale" Text="sale"></asp:ListItem>
                           </asp:DropDownList>
                                
                                
                          
                               
                            </div>
                        </th>
                        <th>
                            <div style="padding-left: 10px">
                           Property Type:  <asp:DropDownList runat="server" ID="property_type" autopostback="true" >
               <asp:ListItem Value="OPENLAND" Text="OPEN_LAND"></asp:ListItem>
               <asp:ListItem Value="HOUSES" Text="HOUSES"></asp:ListItem>
                <asp:ListItem Value="COMMERCIALBUILDINGS" Text="COMMERCIAL_BUILDINGS"></asp:ListItem>
                <asp:ListItem Value="VACATIONHOUSE" Text="VACATION_HOUSE"></asp:ListItem>
                <asp:ListItem Value="APARTMENTS" Text="APARTMENTS"></asp:ListItem>
                               </asp:DropDownList>
                                </div>
                        </th>
                        <th>
                           
                        </th>
                        <th>
                           
                        </th>
                        <th>
                            <div style="padding-left: 10px">
                                <asp:Button runat="server" CssClass="button" Text="Filter" ID="Filter" onclick="Filter_Click" ForeColor="white" BackColor="black" />
                            </div>
                        </th>
                    </tr>
                    <tr>
                    </tr>
                </table>

            <br />
            <br />


            
            
               <asp:GridView ID="GridView1" runat="server" CssClass="leftmargin table table-bordered table-condensed table-responsive table-hover" AutoGenerateColumns="false" AllowPaging="false"
                OnPageIndexChanging="OnPaging" PageSize="10">
                <Columns>
                         <asp:BoundField ItemStyle-Width="150px" DataField="property_id" HeaderText="property_id" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="rental_or_sale" HeaderText="rental_or_sale" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="property_type" HeaderText="property_type" />
                  <asp:BoundField ItemStyle-Width="150px" DataField="description" HeaderText="description" />
                  

                    <asp:BoundField ItemStyle-Width="150px" DataField="neighborhood_name" HeaderText="neighborhood_name" />
                     <asp:BoundField ItemStyle-Width="150px" DataField="monthlyRent" HeaderText="monthlyRent" />
                     <asp:BoundField ItemStyle-Width="150px" DataField="propertyCost" HeaderText="propertyCost" />

                   
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="150px">
                        <ItemTemplate>
                            
                             <%
                    if (Session["Role"].ToString() == "Agent")
                    {

                    %>

                            <asp:Button ID="Deletion" runat="server" CommandArgument='<%#Eval("property_id")%>' Text="Delete"
                                CommandName="ThisBtnClick" CssClass="badge-danger" OnClick="Deletion_Click" ForeColor="white" BackColor="Red"  />
                             <%
              }

 %>

                                                </ItemTemplate>
                    </asp:TemplateField>    
                    

                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="150px">
                        <ItemTemplate>
                            
                            <asp:Button ID="Book" runat="server" CommandArgument='<%#Eval("property_id")%>' Text="Book"
                                CommandName="ThisBtnClick" CssClass="badge-danger" OnClick="Book_Click"  ForeColor="white" BackColor="Green"  />


                        </ItemTemplate>
                    </asp:TemplateField>    



                   
                </Columns>
            </asp:GridView>


               <br />
               <br />

               <div id="reserid" runat="server" visible="false">
                   <asp:Label Text="" ID="ref1" runat="server" Visible="false"></asp:Label><br />
                   <br />
                    Move In date: <asp:TextBox runat="server" ID="midate" Type="date" ></asp:TextBox>
                   
                    Move Out date: <asp:TextBox runat="server" ID="modate" Type="date" ></asp:TextBox>
                   Payment ID : <asp:DropDownList runat="server" ID="pid"></asp:DropDownList>

                   <br />
                   <br />

                   <asp:Button runat="server" Text="Confirm Booking" id="confirmbooking" OnClick="confirmbooking_Click" ForeColor="white" BackColor="green"/>
               </div>



               
        
        </div>
    </main>

</asp:Content>
