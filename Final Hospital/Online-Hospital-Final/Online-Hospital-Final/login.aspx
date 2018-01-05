<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Online_Hospital.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="padding-top: 8em">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-login">


                    <asp:Panel ID="pnlgiris" runat="server">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-4">
                                </div>
                                <div class="col-xs-4">
                                    <a href="#" class="active" id="login-form-link" style="font-size: 26px;">Login</a>
                                </div>
                                <div class="col-xs-4">
                                </div>
                            </div>

                        </div>

                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="form-group">
                                        
                                        <asp:TextBox ID="TC" runat="server" placeholder="TC Number" TabIndex="1" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        
                                        <asp:TextBox ID="Password" runat="server" placeholder="PASSWORD" TabIndex="1" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        
                                    </div>
                                    <div class="form-group text-center">
                                        <input type="checkbox" tabindex="3" class="" name="remember" id="remember" />
                                        <label for="remember">Remember Me</label>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-offset-3">
                                               


                                                <asp:Button ID="loginbtn" runat="server" Text="Login" TabIndex="4" CssClass="form-control btn btn-login" OnClick="loginbtn_Click" />
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="text-center">
                                                    <a href="#" tabindex="5" class="forgot-password">Forgot Password?</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pnluser" runat="server">
                        Welcome,
                        <asp:Label ID="lblusername" Text="" runat="server"></asp:Label>
                        <asp:Button ID="btnlogout" Text="Logout" runat="server" OnClick="btnlogout_Click" />
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-12">
            <ul>

                <li>
                    <asp:Label ID="lbl_UyariText" runat="server" Visible="true" Text="Please fill the boxes carefully, if you are not a member of the system please"></asp:Label><a style="font-weight: bold" href="register.aspx"> register.</a> </li>
                <li>
                    <asp:Label ID="lbl_UyariText2" ForeColor="Red" runat="server" Visible="true" Text="Register feature is only available for the patients."></asp:Label></li>
            </ul>
        </div>

    </div>



</asp:Content>
