<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageBookings.aspx.cs" Inherits="RealEstate.ManageBookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div>

        <center>
           <h2>Manage your Bookings</h2>

              <asp:GridView ID="GridView1" runat="server" CssClass="leftmargin table table-bordered table-condensed table-responsive table-hover" AutoGenerateColumns="false" AllowPaging="false"
                OnPageIndexChanging="OnPaging" PageSize="10">
                <Columns>
                         <asp:BoundField ItemStyle-Width="150px" DataField="booking_id" HeaderText="booking_id" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="start_date" HeaderText="start_date" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="end_date" HeaderText="end_date" />
                  <asp:BoundField ItemStyle-Width="150px" DataField="credit_card_number" HeaderText="credit_card_number" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="property_id" HeaderText="property_id" />

                    <asp:BoundField ItemStyle-Width="150px" DataField="rental_period" HeaderText="rental_period" />
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Button ID="Deletion" runat="server" CommandArgument='<%#Eval("booking_id")%>' Text="Cancel"
                                CommandName="ThisBtnClick" CssClass="badge-danger" OnClick="Deletion_Click" BackColor="Red" ForeColor="white" />

                                                </ItemTemplate>
                    </asp:TemplateField>    
                    
                  
                </Columns>
            </asp:GridView>


            </center>



    </div>


</asp:Content>
