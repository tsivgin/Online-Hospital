<%@ Page Title="" Language="C#" MasterPageFile="~/Personnel/personnel.Master" AutoEventWireup="true" CodeBehind="EnterLabResult.aspx.cs" Inherits="Online_Hospital.Personnel.EnterLabResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Enter Lab Result</h1>

    <div class="container" style="padding-top: 8em">
        <div class="isa_success">
            <i class="fa fa-check"></i>
            <asp:Label ID="lbl_Succeed" runat="server" Text="Kaydınız başarıyla gerçekleşmiştir!" Visible="false" ForeColor="Red"></asp:Label>
        </div>
        <div class="isa_error">
            <i class="fa fa-times-circle"></i>
            <asp:Label ID="lbl_Failed" runat="server" Text="Kayıt esnasında bir hata oluştur, lütfen girdiğiniz bilgileri kontrol ederek tekrar deneyiniz." Visible="false"></asp:Label>
        </div>

        <div class="row main">
            <div class="main-login main-center">
                <asp:Panel runat="server" ID="labresult">
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Enter TC number</label>
                        <div class="cols-sm-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="TC" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Enter Lab Result</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:TextBox runat="server" ID="enterlabresult" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">Select Department</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                <asp:DropDownList runat="server" ID="departmentname" CssClass="form-control"></asp:DropDownList>
                                </div>
                        </div>
                    </div>


                      <div class="form-group ">
                        <asp:Button ID="savebtn" runat="server" Text="Save" TabIndex="4" OnClick="savebtn_Click" CssClass="btn btn-primary btn-lg btn-block login-button" />

                        <%--<a href="#" target="_blank" type="button" id="button" class="btn btn-primary btn-lg btn-block login-button">Register</a>--%>
                    </div>

                </asp:Panel>



            </div>
        </div>


    </div>
</asp:Content>
