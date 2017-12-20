<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/patient.Master" AutoEventWireup="true" CodeBehind="cancelappointment.aspx.cs" Inherits="Online_Hospital.Patient.cancelappointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="active">
        <h6 class="orange">
            <asp:Literal runat="server" ID="ltrl_SelectTime"></asp:Literal></h6>
        <div class="active">
            <asp:RadioButtonList runat="server" ID="rbtnl_cancelapp" BorderStyle="Solid" BorderColor="Orange" Width="400px" DataTextField="FullName" DataValueField="appID"></asp:RadioButtonList>
            <asp:Label runat="server" ID="lbl_TimeViolation" ForeColor="red" Font-Bold="true" Text="Please, select one of the time interval to get your appointment." Visible="False"></asp:Label>
        </div>
    </div>

    <div class="form-group ">
        <asp:Button ID="deletebtn" runat="server" Text="Delete" TabIndex="4" OnClick="deletebtn_Click" CssClass="btn btn-primary btn-lg" />

    </div>
</asp:Content>
