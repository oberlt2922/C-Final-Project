<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FinalProject.WebForm1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-group">
        <label class="col-sm-1"><strong>County: </strong></label>
        <asp:DropDownList ID="ddlCounties" runat="server" DataSourceID="SqlDataSource1" 
            CssClass="col-sm-2" DataTextField="County" DataValueField="County">
        </asp:DropDownList>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" DataSourceMode="DataReader" 
        ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        SelectCommand="SELECT DISTINCT [County] FROM [Properties]"></asp:SqlDataSource>
    <asp:Panel ID="ContentArea" runat="server"></asp:Panel>
</asp:Content>




