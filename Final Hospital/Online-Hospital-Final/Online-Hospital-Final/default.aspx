<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Online_Hospital_Final._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
 


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <script>
      // You can also use "$(window).load(function() {"
      $(function () {
          $("#slider2").responsiveSlides({
              auto: true,
              pager: true,
              speed: 300,
              namespace: "callbacks",
          });
      });
  </script>
    <!--script-nav -->	
			        <script>
			            $("span.menu-info").click(function () {
			                $("ul.cl-effect-21").slideToggle("slow", function () {
			                });
			            });
					</script>
					<!-- /script-nav -->
                    <div class="clearfix"> </div>	
		  
    <div class="header-banner" style="padding-top:-8em">
   <div class="slider">
	    <ul class="rslides" id="slider2">
	      <li><a href="#"><img src="Content/images/11.jpg" class="img-responsive" alt=""/></a></li>
	      <li><a href="#"><img src="Content/images/12.jpg" class="img-responsive" alt=""/></a></li>
	      <li><a href="#"><img src="Content/images/13.jpg" class="img-responsive" alt=""/></a></li>
	    </ul>
    </div>
</div>

<asp:Panel ID="users" runat="server" Visible="true">   
	<div class="container">
		<div class="doctor-self-info">			
			<div class="doctor-self-info-bottom">
				<div class="col-md-4 list">
                    <div class="col-lg-6 ">
					    <img src="Content/images/personal.png" class="img-responsive" alt=""/>
                    </div>
                    <div class="col-lg-6 list-text">
					    <h3>User Login</h3>
						    <p>Need More info?</p>
						  <div class="button"><span><a href="/login.aspx">Login now</a></span></div>
                    </div>
				</div>
                <div class="col-md-4 list">
					<div class="col-lg-6 ">
					    <img src="Content/images/personal.png" class="img-responsive" alt=""/>
                    </div>
					<div class="col-lg-6 list-text">
					    <h3 style="font-size: 1.4em;">Personal Login</h3>
						    <p>Need More info?</p>
						  <div class="button"><span><a href="/login.aspx">Login now</a></span></div>
                    </div>
				</div>
                <div class="col-md-4 list">
					<div class="col-lg-6 ">
					    <img  style="width:200px;height: 225px;" src="Content/images/register.png" class="img-responsive" alt=""/>
                    </div>
					<div class="col-lg-6 list-text">
					    <h3>Register</h3>
						    <p>Need More info?</p>
						  <div class="button"><span><a href="/register.aspx">Register now</a></span></div>
                    </div>
				</div>
				
				<div class="clearfix"> </div>
				</div>
		</div>
	</div>

</asp:Panel>

    <asp:Panel ID="users2" runat="server" Visible="false">
        <div class="container">
		<div class="doctor-self-info">			
			<div class="doctor-self-info-bottom">
				<div class="col-md-6 list" >
                    <div class="col-lg-6 ">
					    <img src="Content/images/onlinerandevu.png" class="img-responsive" alt=""/>
                    </div>
                    <div class="col-lg-6 list-text">
					    <h3>Online Randevu</h3>
						    <p>Need More info?</p>
						  <div class="button"><span><a href="Patient/default.aspx">Go Online Randevu</a></span></div>
                    </div>
				</div>
                <div class="col-md-6 list" >
					<div class="col-lg-6 ">
					    <img src="Content/images/laboratuvar-sonuclari.png" class="img-responsive" alt="" style="width:225px"/>
                    </div>
					<div class="col-lg-6 list-text">
					    <h3 style="font-size: 1.4em;">Lab Result</h3>
						    <p>Need More info?</p>
						  <div class="button"><span><a href="Patient/default.aspx">Go my Lab Result</a></span></div>
                    </div>
				</div>
               
				
				<div class="clearfix"> </div>
				</div>
		</div>
	</div>

    </asp:Panel>

</asp:Content>
