<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="ListPolicinic.aspx.cs" Inherits="Online_Hospital.Admin.ListPolicinic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-lg-4"></div>
    <div class="col-lg-4">

        <%-- DefaultPage --%>
        <asp:Panel runat="server" ID="list" Visible="true">
            <h1>ADMİN PAGE</h1>
            <div class="active">
                <h6 class="orange">
                    <asp:Literal runat="server" ID="ltrl_SelectTime"></asp:Literal></h6>
                <div class="active">
                    <asp:RadioButtonList runat="server" ID="rbtnl_policinic" BorderStyle="Solid" BorderColor="Orange" Width="350px"></asp:RadioButtonList>

                </div>
            </div>


            <div class="btn-block">
                <asp:Button runat="server" ID="add_policinic" OnClick="Add_policinic_Click" CssClass=" btn btn-primary btn-m" Text="Add Policinic" />
                <asp:Button runat="server" ID="edit_policinic" OnClick="edit_policinic_Click" CssClass="btn btn-primary btn-m" Text="Edit Policinic" />
                <asp:Button runat="server" ID="delete_policinic" OnClick="delete_policinic_Click" CssClass="btn btn-primary btn-m" Text="Delete Policinic" />
            </div>


        </asp:Panel>
        <%-- End Of Default --%>


        <%-- Add Policinic --%>
        <asp:Panel runat="server" ID="addpolicinic" Visible="false">
            <div class="isa_success">
                <i class="fa fa-check"></i>
                <asp:Label ID="lbl_Succeed" runat="server" Text="Kaydınız başarıyla gerçekleşmiştir!" Visible="false" ForeColor="red"></asp:Label>
            </div>
            <div class="isa_error">
                <i class="fa fa-times-circle"></i>
                <asp:Label ID="lbl_Failed" runat="server" Text="Kayıt esnasında bir hata oluştur, lütfen girdiğiniz bilgileri kontrol ederek tekrar deneyiniz." Visible="false"></asp:Label>
            </div>

            <div class="row main">
                <div class="main-login main-center">


                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Policinic Name</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="PolicinicName" placeholder="Enter Policinic Name" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredName" ForeColor="Red" ControlToValidate="PolicinicName" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>


                           </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Policinic Address</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="Address" placeholder="Enter Address" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredLastName" ForeColor="Red" ControlToValidate="Address" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                           </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">Policinic Phone</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="Phone" placeholder="Enter Phone" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="Requiredemail" ForeColor="Red" ControlToValidate="Phone" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                           </div>
                        </div>
                    </div>


                    <div class="form-group ">
                        <asp:Button ID="registerbtn" runat="server" Text="Register" TabIndex="4" OnClick="registerbtn_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />

                    </div>



                </div>
            </div>


        </asp:Panel>

        <%--End Of Add Policinic  --%>


        <%--Edit Policinic --%>
        <asp:Panel runat="server" ID="editpolicinic" Visible="false">
            <div class="isa_success">
                <i class="fa fa-check"></i>
                <asp:Label ID="lbl_Succeed2" runat="server" Text="Kaydınız başarıyla gerçekleşmiştir!" Visible="false" ForeColor="Red"></asp:Label>
            </div>
            <div class="isa_error">
                <i class="fa fa-times-circle"></i>
                <asp:Label ID="Label2" runat="server" Text="Kayıt esnasında bir hata oluştur, lütfen girdiğiniz bilgileri kontrol ederek tekrar deneyiniz." Visible="false"></asp:Label>
            </div>

            <div class="row main">
                <div class="main-login main-center">


                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Policinic Name</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="PolicinicName2" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="PolicinicName2" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>


                                <%--<input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name"/>--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Policinic Address</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="Policinicaddress2" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="Policinicaddress2" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                <%--<input type="text" class="form-control" name="name" id="lastname"  placeholder="Enter your Last Name"/>--%>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">Policinic Phone</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="PolicinicPhone2" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="PolicinicPhone2" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                <%--<input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email"/>--%>
                            </div>
                        </div>
                    </div>


                    <div class="form-group ">
                        <asp:Button ID="Save" runat="server" Text="Save" TabIndex="4" OnClick="Save_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />

                        <%--<a href="#" target="_blank" type="button" id="button" class="btn btn-primary btn-lg btn-block login-button">Register</a>--%>
                    </div>



                </div>
            </div>
        </asp:Panel>

    </div>
</asp:Content>
