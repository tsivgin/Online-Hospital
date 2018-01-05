<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/Doctor.Master" AutoEventWireup="true" CodeBehind="Listappointments.aspx.cs" Inherits="Online_Hospital_Final.Doctor.Listappointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="padding-top: 8em">

        <%-- Succeed Label --%>
        <div class="isa_success">
            <i class="fa fa-check"></i>
            <asp:Label ID="lbl_Succeed" runat="server" Text="Kaydınız başarıyla gerçekleşmiştir!" Visible="false"></asp:Label>
        </div>

        <%-- Failed Label --%>
        <div class="isa_error">
            <i class="fa fa-times-circle"></i>
            <asp:Label ID="lbl_Failed" runat="server" Text="Kayıt esnasında bir hata oluştur, lütfen girdiğiniz bilgileri kontrol ederek tekrar deneyiniz." Visible="false"></asp:Label>
        </div>

        <%-- Content --%>
        <div class="row main">
            <div class="main-login main-center">

                <%-- Tc Number Text --%>
                <%--<div class="form-group">
                    <label for="name" class="cols-sm-2 control-label">Enter TC number</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <asp:TextBox runat="server" ID="TC" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredTC" ForeColor="Red" ControlToValidate="TC" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>--%>

                <%-- Save Button --%>
                <%--<center>
                <div class="form-group ">
                    <asp:Button ID="List" runat="server" Text="List" TabIndex="4" OnClick="List_Click" CssClass="btn btn-primary btn-lg btn-group-sm login-button" />
                </div>
                </center>--%>

                <%-- Calender --%>
                <asp:Panel runat="server" ID="appointments" Visible="false">
                    <center>
                <div class="row">
                    <div class="container">
                        <div class="col-md-12" style="text-align: center">
                            <h2>List Appointment</h2>
                            <asp:GridView CssClass="table table-hover table-striped" runat="server" ID="listappointment" >
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                </center>
                </asp:Panel>


            </div>
        </div>
        <%-- End of Content --%>
    </div>

</asp:Content>
