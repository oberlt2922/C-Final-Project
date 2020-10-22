<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="House.aspx.cs" Inherits="FinalProject.WebForm4" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="form-group" style="border:solid">
        <div class="col-sm-6">
            <table border="0">
                <tr>
                    <td>
                        <asp:Button ID="btnPrevious" runat="server" Text="<<" Font-Size="20" OnClick="btnPrevious_Click" />
                    </td>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="400" Width="400" />
                    </td>
                    <td>
                        <asp:Button ID="btnNext" runat="server" Text=">>" Font-Size="20" OnClick="btnPrevious_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="houseInfo" class="col-sm-6">
            <asp:Panel ID="ContentArea" runat="server"></asp:Panel>
        </div>
    </div>
    <br />
</asp:Content>




