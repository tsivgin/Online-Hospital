<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/Doctor.Master" AutoEventWireup="true" CodeBehind="doctornotworks.aspx.cs" Inherits="Online_Hospital.Doctor.doctornotworks" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <div class="container" style="padding-top: 8em">

        <%-- Succeed Label --%>
        <div class="isa_success">
            <i class="fa fa-check"></i>
            <asp:Label ID="lbl_Succeed" runat="server" Text="Kaydınız başarıyla gerçekleşmiştir!" Visible="false" ForeColor="Red"></asp:Label>
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


                <%-- Calender --%>
                
                <div class="active" style="margin:auto">
                    <h6 class="orange">
                        <asp:Literal runat="server" ID="ltlrl_Calendar"></asp:Literal></h6>
                    <div class="active">
                        <asp:Calendar ID="Calendar" runat="server" SelectedDate="<%# DateTime.Today %>" OnDayRender="Calendar_DayRender" OnSelectionChanged="Calendar_SelectionChanged" Width="353px" />
                        <h6 class="orange" style="color:red">
                            <asp:Literal runat="server" ID="ltrl_SelectDate"></asp:Literal></h6>
                        <h6 class="orange" style="color: darkgray; border: 2px;">
                            <asp:Literal runat="server" ID="ltrl_SelectedDate"></asp:Literal></h6>
                    </div>
                </div>
                    

                <%-- Save Button --%>
                
                <div class="form-group ">
                    <asp:Button ID="Save" runat="server" Text="Save" TabIndex="4" OnClick="Save_Click" CssClass="btn btn-primary btn-lg btn-group-sm login-button" />
                </div>


            </div>
        </div>
        <%-- End of Content --%>
    </div>
    </center>




</asp:Content>
