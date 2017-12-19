<%@ Page Title="" Language="C#" MasterPageFile="~/Personnel/personnel.Master" AutoEventWireup="true" CodeBehind="editappointment.aspx.cs" Inherits="Online_Hospital.Personnel.editappointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Edit Apointment</h1>
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

                <asp:Panel runat="server" ID="tckontrol">
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

                </asp:Panel>
                <asp:RadioButtonList runat="server" ID="appointments">
                </asp:RadioButtonList>

                <div class="form-group ">
                    <asp:Button ID="Control" runat="server" Text="Control" TabIndex="4" OnClick="Control_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />

                </div>
                <div class="form-group ">
                    <asp:Button Visible="false" ID="Control2" runat="server" Text="Control" TabIndex="4" OnClick="Control2_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />

                </div>




                <asp:Panel runat="server" ID="info" Visible="false">
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Now Time</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="nowtime" CssClass="form-control" Enabled="false"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="nowtime" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                            </div>
                        </div>
                    </div>


                    <div class="form-group" style="visibility: hidden">
                        <label for="name" class="cols-sm-2 control-label">Enter new Time</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="newtime" placeholder="Enter new time" CssClass="form-control"></asp:TextBox>

                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">Now Date</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="nowdate" CssClass="form-control" Enabled="false"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredDate" ForeColor="Red" ControlToValidate="nowdate" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                            </div>
                        </div>
                    </div>




                    <div class="active">
                        <h6 class="orange">
                            <asp:Literal runat="server" ID="ltlrl_Calendar"></asp:Literal></h6>
                        <div class="active">
                            <asp:Calendar ID="Calendar" runat="server" Visible="false" OnSelectionChanged="Calendar_SelectionChanged" Width="353px" />

                            SelectedDate="<%# DateTime.Today %>"
                            <h6 class="orange">
                                <asp:Literal runat="server" ID="ltrl_SelectDate"></asp:Literal></h6>
                            <h6 class="orange" style="color: darkgray; border: 2px;">
                                <asp:Literal runat="server" ID="ltrl_SelectedDate"></asp:Literal></h6>
                        </div>
                    </div>

                    <div class="active">
                        <h6 class="orange">
                            <asp:Literal runat="server" ID="ltrl_SelectTime"></asp:Literal></h6>
                        <div class="active">
                            <asp:RadioButtonList runat="server" ID="rbtnl_AvailableTimes" BorderStyle="Solid" BorderColor="Orange" Width="350px" DataTextField="WorkHour" DataValueField="Type"></asp:RadioButtonList>


                            <asp:Label runat="server" ID="lbl_TimeViolation" ForeColor="red" Font-Bold="true" Text="Please, select one of the time interval to get your appointment." Visible="False"></asp:Label>


                        </div>

                    </div>





                    <div class="form-group ">
                        <asp:Button ID="Savebtn" runat="server" Text="Save" TabIndex="4" OnClick="Savebtn_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />
                    </div>

                </asp:Panel>
            </div>
        </div>
    </div>



</asp:Content>

