<%@ Page Title="" Language="C#" MasterPageFile="~/Personnel/personnel.Master" AutoEventWireup="true" CodeBehind="doctorworks.aspx.cs" Inherits="Online_Hospital.Personnel.doctorworks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="padding-top: 8em">
        <div class="isa_success">
            <i class="fa fa-check"></i>
            <asp:Label ID="lbl_Succeed" runat="server" Text="Kaydınız başarıyla gerçekleşmiştir!" Visible="false"></asp:Label>
        </div>
        <div class="isa_error">
            <i class="fa fa-times-circle"></i>
            <asp:Label ID="lbl_Failed" runat="server" Text="Kayıt esnasında bir hata oluştur, lütfen girdiğiniz bilgileri kontrol ederek tekrar deneyiniz." Visible="false"></asp:Label>
        </div>
        <div class="row main">
            <div class="main-login main-center">


                <div class="form-group">
                    <label for="name" class="cols-sm-2 control-label">Enter TC number</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <asp:TextBox runat="server" ID="TC" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredTC" ForeColor="Red" ControlToValidate="TC" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>


                        </div>
                    </div>
                </div>

                <div class="active">
                    <h6 class="orange">
                        <asp:Literal runat="server" ID="ltlrl_Calendar"></asp:Literal></h6>
                    <div class="active">
                        <asp:Calendar ID="Calendar" runat="server" SelectedDate="<%# DateTime.Today %>" OnSelectionChanged="Calendar_SelectionChanged" Width="353px" />
                        <h6 class="orange">
                            <asp:Literal runat="server" ID="ltrl_SelectDate"></asp:Literal></h6>
                        <h6 class="orange" style="color: darkgray; border: 2px;">
                            <asp:Literal runat="server" ID="ltrl_SelectedDate"></asp:Literal></h6>
                    </div>
                </div>



                <div class="form-group ">
                    <asp:Button ID="Control" runat="server" Text="Control" TabIndex="4" OnClick="Control_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />

                </div>
            </div>
        </div>
    </div>







</asp:Content>
