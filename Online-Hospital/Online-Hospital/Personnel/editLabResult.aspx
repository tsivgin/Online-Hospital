<%@ Page Title="" Language="C#" MasterPageFile="~/Personnel/personnel.Master" AutoEventWireup="true" CodeBehind="editLabResult.aspx.cs" Inherits="Online_Hospital.Personnel.editLabResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Edit Lab Result</h1>

    <div class="container" style="color: red; padding-top: 2em">
        <asp:Label runat="server" ID="PatientName" CssClass="h3" Visible="false"></asp:Label>
    </div>


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


                                <%--<input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name"/>--%>
                            </div>
                        </div>
                    </div>

                </asp:Panel>
                <asp:RadioButtonList runat="server" ID="rbtn_LabResults">
                </asp:RadioButtonList>

                <div class="form-group ">
                    <asp:Button ID="Control" runat="server" Text="Control" TabIndex="4" OnClick="Control_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />

                    <%--<a href="#" target="_blank" type="button" id="button" class="btn btn-primary btn-lg btn-block login-button">Register</a>--%>
                </div>
                <div class="form-group ">
                    <asp:Button Visible="false" ID="Control2" runat="server" Text="Control" TabIndex="4" OnClick="Control2_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />

                    <%--<a href="#" target="_blank" type="button" id="button" class="btn btn-primary btn-lg btn-block login-button">Register</a>--%>
                </div>




                <asp:Panel runat="server" ID="info" Visible="false">

                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Enabled Lab Result</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="nowlabresult" CssClass="form-control" Enabled="false"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="nowlabresult" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                <%--<input type="text" class="form-control" name="name" id="lastname"  placeholder="Enter your Last Name"/>--%>
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Enter new Lab Result</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="newlabresult" placeholder="Enter new time" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="Requirednewlabresult" ForeColor="Red" ControlToValidate="newlabresult" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                <%--<input type="text" class="form-control" name="name" id="lastname"  placeholder="Enter your Last Name"/>--%>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">Now Department</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="nowdepartment" CssClass="form-control" Enabled="false"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="Requirednowdepartment" ForeColor="Red" ControlToValidate="nowdepartment" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                <%--<input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email"/>--%>
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">New Department</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                <asp:DropDownList runat="server" ID="newdepartment" CssClass="form-control"></asp:DropDownList>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="newdepartment" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                <%--<input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email"/>--%>
                            </div>
                        </div>
                    </div>







                    <div class="form-group ">
                        <asp:Button ID="Savebtn" runat="server" Text="Save" TabIndex="4" OnClick="Savebtn_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />

                        <%--<a href="#" target="_blank" type="button" id="button" class="btn btn-primary btn-lg btn-block login-button">Register</a>--%>
                    </div>

                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
