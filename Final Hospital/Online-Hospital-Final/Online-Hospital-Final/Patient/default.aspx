<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/patient.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Online_Hospital_Final.Patient._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>default</h1>

    <div class="isa_success">
        <i class="fa fa-check"></i>
        <asp:Label ID="lbl_Succeed" runat="server" Text="Kaydınız başarıyla gerçekleşmiştir!" Visible="false"></asp:Label>
    </div>
    <center>
    <div class="isa_success">
        <i class="fa fa-check"></i>
        <asp:Label ID="Info" runat="server" Text="Sistem Tarafından Değiştirilen randevularınız:" Visible="false" ForeColor="Red"></asp:Label>
    </div>
    </center>
    <asp:Panel ID="panel" runat="server">
        <div class="active">
            <div class="active">
                <asp:GridView runat="server" ID="changeappointment" CssClass="table table-hover table-striped" Visible="false"></asp:GridView>
            </div>
        </div>

        <center>
        <div class="active">
            <div class="active">
                <asp:Button runat="server" ID="confirm" Text="Confirm" OnClick="confirm_Click" Visible="false" CssClass="btn-group-sm btn btn-lg"/>
            </div>
        </div>
        </center>

    </asp:Panel>
</asp:Content>
