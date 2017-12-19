<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Online_Hospital.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="padding-top:8em">
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
							<label for="name" class="cols-sm-2 control-label">Your Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                    <asp:TextBox runat="server" ID="Name" placeholder="Enter your Name" CssClass="form-control"></asp:TextBox>
									<asp:RequiredFieldValidator runat="server" ID="RequiredName" ForeColor="Red" ControlToValidate="Name" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                    
                                </div>
							</div>
						</div>
                        <div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Your Last Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                    <asp:TextBox runat="server" ID="LastName" placeholder="Enter Your Last Name" CssClass="form-control"></asp:TextBox>
									<asp:RequiredFieldValidator runat="server" ID="RequiredLastName" ForeColor="Red" ControlToValidate="LastName" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                </div>
							</div>
						</div>
                        <div class="form-group">
							<label for="gender" class="cols-sm-2 control-label">Gender</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                    <asp:TextBox runat="server" ID="Gender" placeholder="Enter your Gender" CssClass="form-control" MaxLength="11"></asp:TextBox>
									<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="Gender" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>
                                   
                                 </div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                    <asp:TextBox runat="server" ID="email" placeholder="Enter your Email" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="Requiredemail" ForeColor="Red" ControlToValidate="email" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regexEmailValid" ForeColor="Red" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                    
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

                                </div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <asp:TextBox runat="server" ID="password2" placeholder="Confirm your Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
									<asp:RequiredFieldValidator runat="server" ID="Requiredpassword2" ForeColor="Red" ControlToValidate="password2" ErrorMessage="Please fill the box."></asp:RequiredFieldValidator>

                                </div>
							</div>
						</div>
                  

						<div class="form-group ">
                            <asp:Button ID="registerbtn" runat="server" Text="Register" TabIndex="4" OnClick="registerbtn_Click" CssClass="btn btn-primary btn-lg btn-block login-button"  />
                            
						</div>

                  
						
					
				</div>
			</div>
		</div>

                 

</asp:Content>