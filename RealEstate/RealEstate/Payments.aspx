<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="RealEstate.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   


     <main>
          
          <div class="row">

               <section class="col-md-4" aria-labelledby="gettingStartedTitle">

                      <h2>Address</h2>
           Apt No: <asp:TextBox runat="server" ID="Aptno" ></asp:TextBox><br /><br />
           Street No: <asp:TextBox runat="server" ID="StNo" ></asp:TextBox><br /><br />
                   Street Name: <asp:TextBox runat="server" ID="street_name" ></asp:TextBox><br /><br />
        City: <asp:TextBox runat="server" ID="city" ></asp:TextBox><br /><br />
        State: <asp:TextBox runat="server" ID="state" ></asp:TextBox><br /><br />
        Zipcode: <asp:TextBox runat="server" ID="zipcode" ></asp:TextBox><br /><br />

           <br />
           <asp:Button runat="server" ID="SaveAddress" Text="Add/Modify Address" OnClick="SaveAddress_Click" />




                   </section>



               <section class="col-md-8" aria-labelledby="gettingStartedTitle">
                   <asp:GridView ID="GridView1" runat="server" CssClass="leftmargin table table-bordered table-condensed table-responsive table-hover" AutoGenerateColumns="false" AllowPaging="false"
                OnPageIndexChanging="OnPaging" PageSize="10">
                <Columns>
                         <asp:BoundField ItemStyle-Width="100px" DataField="street_number" HeaderText="street_number" />
                    <asp:BoundField ItemStyle-Width="100px" DataField="street_name" HeaderText="street_name" />
                   <%-- <asp:BoundField ItemStyle-Width="50px" DataField="apartment_number" HeaderText="apartment_number" />--%>
                  <asp:BoundField ItemStyle-Width="100px" DataField="city" HeaderText="city" />
                    <asp:BoundField ItemStyle-Width="100px" DataField="state" HeaderText="state" />
                    <asp:BoundField ItemStyle-Width="100px" DataField="zip" HeaderText="zip" />

                 
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Button ID="Deletion" runat="server" Text="Modify/Delete"
                                CommandName="ThisBtnClick" CssClass="badge-danger"  />

                                                </ItemTemplate>
                    </asp:TemplateField>    
                    
                  
                </Columns>
            </asp:GridView>


                   </section>


              </div>


         <div class="row">
              <section class="col-md-4" aria-labelledby="gettingStartedTitle">
            <h2>Card Details</h2>

           Card No: <asp:TextBox runat="server" ID="cardno" ></asp:TextBox><br /><br />
           Name: <asp:TextBox runat="server" ID="name" ></asp:TextBox><br /><br />
        Exp date(MM/YYYY): <asp:TextBox runat="server" ID="expdate" ></asp:TextBox><br /><br />
                  Address: <asp:DropDownList runat="server" ID="useraddress" Width="150px"></asp:DropDownList><br /><br />

                  <asp:Button runat="server" ID="AddPayment" OnClick="AddPayment_Click" Text="Add/Update Card Details" />

                  </section>

             
               <section class="col-md-8" aria-labelledby="gettingStartedTitle">

                   <asp:GridView ID="GridView2" runat="server" CssClass="leftmargin table table-bordered table-condensed table-responsive table-hover" AutoGenerateColumns="false" AllowPaging="false"
                OnPageIndexChanging="OnPaging" PageSize="10">
                <Columns>
                         <asp:BoundField ItemStyle-Width="150px" DataField="credit_card_number" HeaderText="credit_card_number" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="expiry_date" HeaderText="expiry_date" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="name_on_card" HeaderText="name_on_card" />
                  
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Button ID="Deletion" runat="server"  Text="Delete "
                                CommandName="ThisBtnClick" CssClass="badge-danger"  />

                                                </ItemTemplate>
                    </asp:TemplateField>    
                    
                  
                </Columns>
            </asp:GridView>

                   </section>


         </div>



         </main>

</asp:Content>
