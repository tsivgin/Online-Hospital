<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/patient.Master" AutoEventWireup="true" CodeBehind="LabResult.aspx.cs" Inherits="Online_Hospital.Patient.LabResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="wrap">
            <div class="container">
                <div class="col-md-6" style="text-align: center">
                    <h2>Lab Results</h2>
                    <asp:GridView CssClass="table table-hover table-striped" runat="server" ID="labresult"></asp:GridView>
                </div>
            </div>
        </div>
    </div>

    
</asp:Content>
