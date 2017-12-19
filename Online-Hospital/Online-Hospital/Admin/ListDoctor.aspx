<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="ListDoctor.aspx.cs" Inherits="Online_Hospital.Admin.ListDoctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <asp:Panel runat="server" ID="list" Visible="true">
            <h1>ADMİN PAGE</h1>
            <div class="active">
                <h6 class="orange">
                    <asp:Literal runat="server" ID="ltrl_SelectTime"></asp:Literal></h6>
                <div class="active">
                    <asp:RadioButtonList runat="server" ID="rbtnl_doctor" BorderStyle="Solid" BorderColor="Orange" Width="350px"></asp:RadioButtonList>

                    <asp:Label runat="server" ID="lbl_TimeViolation" ForeColor="red" Font-Bold="true" Text="Please, select one of the time interval to get your appointment." Visible="False"></asp:Label>

                </div>
            </div>


            <div class="btn-block">
                <asp:Button runat="server" ID="Add_doctor" OnClick="Add_doctor_Click" CssClass=" btn btn-primary btn-m" Text="Add doctor" />
                <asp:Button runat="server" ID="Edit_doctor" OnClick="Edit_doctor_Click" CssClass="btn btn-primary btn-m" Text="Edit doctor" />
                <asp:Button runat="server" ID="Delete_doctor" OnClick="Delete_doctor_Click" CssClass="btn btn-primary btn-m" Text="Delete doctor" />
            </div>
        </asp:Panel>

        <asp:Panel runat="server" ID="add_doctorp" Visible="false">
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
                        <label for="name" class="cols-sm-2 control-label">Doctor Name</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="Name" placeholder="Enter your Name" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredName" ForeColor="Red" ControlToValidate="Name" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>


                                <%--<input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name"/>--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Doctor Last Name</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="LastName" placeholder="Enter Your Last Name" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredLastName" ForeColor="Red" ControlToValidate="LastName" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                <%--<input type="text" class="form-control" name="name" id="lastname"  placeholder="Enter your Last Name"/>--%>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">Doctor Email</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="email" placeholder="Enter your Email" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="Requiredemail" ForeColor="Red" ControlToValidate="email" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexEmailValid" ForeColor="Red" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>

                                <%--<input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email"/>--%>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="username" class="cols-sm-2 control-label">TC Number</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="TC" placeholder="Enter your TC Number" CssClass="form-control" MaxLength="11"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredTC" ForeColor="Red" ControlToValidate="TC" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexForTC" ForeColor="Red" runat="server" ValidationExpression="^\d+$" ControlToValidate="TC" ErrorMessage="Invalid TC Format"></asp:RegularExpressionValidator>

                                <%--<input type="text" class="form-control" name="username" id="TC_num"  placeholder="Enter your TC Number"/>--%>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="cols-sm-2 control-label">Password</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="password1" placeholder="Enter your Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="Requiredpassword1" ForeColor="Red" ControlToValidate="password1" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                <%--<input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>--%>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="policinic" class="cols-sm-2 control-label">Deparment</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <asp:DropDownList CssClass="select-style select" runat="server" DataTextField="DepartmentName" DataValueField="DepartmentID" ID="dwn_Hospitals" Visible="true">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>


                    <div class="form-group ">
                        <asp:Button ID="registerbtn" runat="server" Text="Register" TabIndex="4" OnClick="registerbtn_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />

                        <%--<a href="#" target="_blank" type="button" id="button" class="btn btn-primary btn-lg btn-block login-button">Register</a>--%>
                    </div>



                </div>
            </div>


        </asp:Panel>

        <%--End Of Add Doctor --%>
        <%--Edit Doctor --%>
        <asp:Panel runat="server" ID="edit_doctor2" Visible="false">
            <div class="isa_success">
                <i class="fa fa-check"></i>
                <asp:Label ID="Label1" runat="server" Text="Kaydınız başarıyla gerçekleşmiştir!" Visible="false"></asp:Label>
            </div>
            <div class="isa_error">
                <i class="fa fa-times-circle"></i>
                <asp:Label ID="Label2" runat="server" Text="Kayıt esnasında bir hata oluştur, lütfen girdiğiniz bilgileri kontrol ederek tekrar deneyiniz." Visible="false"></asp:Label>
            </div>

            <div class="row main">
                <div class="main-login main-center">


                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">doctor Name</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="Name2" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="Name2" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>


                                <%--<input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name"/>--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">doctor Last Name</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="lastname2"  CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="LastName2" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                <%--<input type="text" class="form-control" name="name" id="lastname"  placeholder="Enter your Last Name"/>--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">doctor Age</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="Age"  CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="Age" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                <%--<input type="text" class="form-control" name="name" id="lastname"  placeholder="Enter your Last Name"/>--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">doctor Gender</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="gender"  CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ForeColor="Red" ControlToValidate="gender" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                <%--<input type="text" class="form-control" name="name" id="lastname"  placeholder="Enter your Last Name"/>--%>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">doctor Email</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="email2"  CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="email2" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email2" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>

                                <%--<input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email"/>--%>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="username" class="cols-sm-2 control-label">TC Number</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="tcno"  CssClass="form-control" MaxLength="11"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="tcno" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ForeColor="Red" runat="server" ValidationExpression="^\d+$" ControlToValidate="tcno" ErrorMessage="Invalid TC Format"></asp:RegularExpressionValidator>

                                <%--<input type="text" class="form-control" name="username" id="TC_num"  placeholder="Enter your TC Number"/>--%>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="username" class="cols-sm-2 control-label">Now Deparment</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="departmentName"  CssClass="form-control" Enabled="false" ></asp:TextBox>
                                <%--<input type="text" class="form-control" name="username" id="TC_num"  placeholder="Enter your TC Number"/>--%>
                            </div>
                        </div>
                    </div>
                    

                    <div class="form-group">
                        <label for="policinic" class="cols-sm-2 control-label">New Deparment</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                <asp:DropDownList CssClass="select-style select" runat="server" DataTextField="DepartmentName" DataValueField="DepartmentID" ID="department" Visible="true">
                                </asp:DropDownList>
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

