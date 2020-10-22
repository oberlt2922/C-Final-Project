<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="FinalProject.WebForm3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    
    <label><b>Select a house and enter your information to schedule a viewing of a house.</b></label>
    <br />
    <div class="form-group">
        <label class="col-sm-1"><b>County: </b></label>
        <asp:DropDownList ID="ddlCounties" runat="server" DataSourceID="SqlDataSource1"
            DataTextField="County" DataValueField="County" CssClass="col-sm-2"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
            SelectCommand="SELECT DISTINCT [County] FROM [Properties]"></asp:SqlDataSource>
        <asp:Button ID="btnSearch" runat="server" Text="Search" CausesValidation="false" CssClass="col-sm-1" OnClick="btnSearch_Click" />
    </div>
    <br />
    <asp:Label ID="lblSchedule" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
    <br />
    <br />


    <div class="form-group">
        <div id="txtBoxes" class="col-sm-5">
            <div class="form-group">
                <label class="col-sm-4">Name: </label>
                <asp:TextBox ID="txtName" runat="server" CssClass="col-sm-8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger" 
                    ErrorMessage="Name is Required" ControlToValidate="txtName" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <br />
            <div class="form-group">
                <label class="col-sm-4">Email: </label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="col-sm-8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="text-danger" 
                    ErrorMessage="Email is Required" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ErrorMessage="Must be a valid email" ControlToValidate="txtEmail" CssClass="text-danger" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <br />
            <div class="form-group">
                <label class="col-sm-4">Phone: </label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="col-sm-8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="Phone number is required." ControlToValidate="txtPhone"
                      CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ErrorMessage="Must be a valid phone number" ControlToValidate="txtPhone" 
                    ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Display="Dynamic"
                     CssClass="text-danger"></asp:RegularExpressionValidator>
            </div>
        </div>


        <div id="calendar" class="col-sm-5">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                    <br />
                    <asp:Label ID="lblCalValid" runat="server" CssClass="text-danger" Visible="false">
                        Selected date must be today or later.
                    </asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <br />
    

    
    
    <asp:Repeater ID="rptrHouses" runat="server" DataSourceID="SqlDataSource2">
        <HeaderTemplate>
            <table border="1" class="table table-bordered">
                <tr>
                    <td><b>Select</b></td>
                    <td><b>County</b></td>
                    <td><b>Address</b></td>
                    <td><b>City</b></td>
                    <td><b>State</b></td>
                    <td><b>Zip</b></td>
                </tr>        
        </HeaderTemplate>
        <ItemTemplate>
                <tr>
                    <td>
                        <asp:Button ID="btnSelect" runat="server" Text="Select" 
                            CausesValidation="true" OnClick="btnSelect_Click"/>
                    </td>
                    <td>
                        <asp:Label ID="lblCounty" runat="server"
                            text='<%# Eval("County") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lblAddress" runat="server" 
                            text='<%# Eval("Address") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="lblCity" runat="server" 
                            text='<%# Eval("City") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="lblState" runat="server" 
                            text='<%# Eval("State") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="lblZip" runat="server" 
                            text='<%# Eval("Zip") %>'/>
                    </td>
                </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <br />
    
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        SelectCommand="SELECT [County], [Address], [City], [State], [Zip] FROM [Properties] WHERE ([County] = @County)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCounties" PropertyName="SelectedValue" Name="County" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
