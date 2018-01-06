<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/patient.Master" AutoEventWireup="true" CodeBehind="ListAppointment.aspx.cs" Inherits="Online_Hospital.Patient.ListAppointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="container">
            <div class="col-md-12" style="text-align: center">
                <h2>List Appointment</h2>
                <asp:GridView CssClass="table table-hover table-striped" runat="server" ID="listappointment" >

                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
