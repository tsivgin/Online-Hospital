<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="listdepartment.aspx.cs" Inherits="Online_Hospital.Admin.listdepartment" %>

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
                    <asp:RadioButtonList runat="server" ID="rbtnl_department" BorderStyle="Solid" BorderColor="Orange" Width="350px"></asp:RadioButtonList>

                </div>
            </div>


            <div class="btn-block">
                <asp:Button runat="server" ID="add_deparment" OnClick="add_deparment_Click" CssClass=" btn btn-primary btn-m" Text="Add Deparment" />
                <asp:Button runat="server" ID="edit_department" OnClick="edit_department_Click" CssClass="btn btn-primary btn-m" Text="Edit Deparment" />
                <asp:Button runat="server" ID="delete_department" OnClick="delete_department_Click" CssClass="btn btn-primary btn-m" Text="Delete Deparment" />
            </div>


        </asp:Panel>
        <%-- End Of Default --%>

        <%--Add Department --%>
        <asp:Panel runat="server" ID="adddepartment" Visible="false">
            <div class="isa_success">
                <i class="fa fa-check"></i>
                <asp:Label ID="lbl_Succeed3" runat="server" Text="Kaydınız başarıyla gerçekleşmiştir!" Visible="false" ForeColor="red"></asp:Label>
            </div>
            <div class="isa_error">
                <i class="fa fa-times-circle"></i>
                <asp:Label ID="lbl_Failed3" runat="server" Text="Kayıt esnasında bir hata oluştur, lütfen girdiğiniz bilgileri kontrol ederek tekrar deneyiniz." Visible="false"></asp:Label>
            </div>

            <div class="row main">
                <div class="main-login main-center">


                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Department Name</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="DepartmentName" placeholder="Enter Department Name" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredName" ForeColor="Red" ControlToValidate="DepartmentName" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>


                                <%--<input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name"/>--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Department Building No</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="BuildingNo" placeholder="Enter Address" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredBuildingNo" ForeColor="Red" ControlToValidate="BuildingNo" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                <%--<input type="text" class="form-control" name="name" id="lastname"  placeholder="Enter your Last Name"/>--%>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">Deparment of Policinic</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                <asp:DropDownList CssClass="select-style select" runat="server" DataTextField="PolicinicName" DataValueField="PolicinicID" ID="dwn_policinic" Visible="true">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>


                    <div class="form-group ">
                        <asp:Button ID="registerbtn" runat="server" Text="Register" TabIndex="4" OnClick="registerbtn_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />

                    </div>



                </div>
            </div>


        </asp:Panel>

        <%--End of Add Department --%>
        <%-- Edit Department --%>
        <asp:Panel runat="server" ID="editdepartment" Visible="false">
            <div class="isa_success">
                <i class="fa fa-check"></i>
                <asp:Label ID="Label1" runat="server" Text="Kaydınız başarıyla gerçekleşmiştir!" Visible="false" ForeColor="Red"></asp:Label>
            </div>
            <div class="isa_error">
                <i class="fa fa-times-circle"></i>
                <asp:Label ID="Label2" runat="server" Text="Kayıt esnasında bir hata oluştur, lütfen girdiğiniz bilgileri kontrol ederek tekrar deneyiniz." Visible="false"></asp:Label>
            </div>

            <div class="row main">
                <div class="main-login main-center">


                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Department Name</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="namedepartment" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="namedepartment" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>


                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Deparment BuildingNo</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="DeparmentBuildingNo"  CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="DeparmentBuildingNo" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                           </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Department of Policinic Now</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="depofpolicinic"  CssClass="form-control" Enabled="false"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="depofpolicinic" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                            </div>
                        </div>
                    </div>
                    

                    <div class="form-group">
                        <label for="username" class="cols-sm-2 control-label">Select Policinic</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                <asp:DropDownList CssClass="select-style select" runat="server" DataTextField="PolicinicName" DataValueField="PolicinicID" ID="policinic2" Visible="true">
                                </asp:DropDownList>
                           </div>
                        </div>
                    </div>
                    

                    <div class="form-group ">
                        <asp:Button ID="Save" runat="server" Text="Save" TabIndex="4" OnClick="Save_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />

                    </div>

                </div>
            </div>
        </asp:Panel>

        <%--End of Edit Department --%>


    </div>

</asp:Content>

