<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/patient.Master" AutoEventWireup="true" CodeBehind="BookAppointment.aspx.cs" Inherits="Online_Hospital.Patient.BookAppointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <h1>Book Appointment</h1>

        <div class="active">
            <h6 class="orange">- Department-</h6>

        </div>

        <div class="active">
            <h6 class="orange">
                <asp:Literal runat="server" ID="ltrl_SelectHospital"></asp:Literal></h6>
            <div class="active">
                <asp:DropDownList CssClass="select-style select" runat="server" DataTextField="PolicinicName" DataValueField="PolicinicID" ID="dwn_policinic" Visible="true" AutoPostBack="true" OnSelectedIndexChanged="dwn_policinic_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>


        <div class="active">
            <h6 class="orange">
                <asp:Literal runat="server" ID="ltrl_SelectDepartment"></asp:Literal></h6>
            <div class="active">
                <asp:DropDownList CssClass="select-style select" runat="server" DataTextField="DepartmentName" DataValueField="DepartmentID" ID="dwn_Departments" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="dwn_Departments_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>


        <div class="active">
            <h6 class="orange">
                <asp:Literal runat="server" ID="ltrl_SelectDoctor"></asp:Literal></h6>
            <div class="active">

                <asp:DropDownList CssClass="select-style select" runat="server" DataTextField="Name" DataValueField="tc_no" ID="dwn_Doctors" AutoPostBack="true" Visible="false" OnSelectedIndexChanged="dwn_Doctors_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>

        <div class="active">
            <h6 class="orange">
                <asp:Literal runat="server" ID="ltlrl_Calendar"></asp:Literal></h6>
            <div class="active">
                <asp:Calendar ID="Calendar" runat="server" Visible="false" DayNameFormat="FirstLetter" OnDayRender="Calendar_DayRender1"  SelectedDate="<%# DateTime.Today %>" AutoPostBack="true" OnSelectionChanged="Calendar_SelectionChanged" Width="353px" />
                <%--<asp:Calendar Visible="false" ID="Calendar" runat="server" DayNameFormat="FirstLetter" Font-Names="Tahoma" Font-Size="11px" NextMonthText="." PrevMonthText="." SelectMonthText="»" SelectWeekText="›" CssClass="myCalender" OnSelectionChanged="Calendar_SelectionChanged" OnDayRender="Calendar_DayRender" CellPadding="0">
                    <OtherMonthDayStyle ForeColor="#b0b0b0" />
                    <DayStyle CssClass="myCalendarDay" ForeColor="#2d3338" />
                    <DayHeaderStyle CssClass="myCalendarDayHeader" ForeColor="#2d3338" />
                    <SelectedDayStyle Font-Bold="True" Font-Size="12px" CssClass="myCalendarSelector" />
                    <TodayDayStyle CssClass="myCalendarToday" />
                    <SelectorStyle CssClass="myCalendarSelector" />
                    <NextPrevStyle CssClass="myCalendarNextPrev" />
                    <TitleStyle CssClass="myCalendarTitle" />
                </asp:Calendar>--%>
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

        <div>
            <%--<asp:Button runat="server" ID="btn_Continue" CssClass="btn btn-primary btn-lg" Text="Continue" />--%>

            <asp:Button runat="server" ID="btn_Reset" Visible="false" CssClass="btn btn-primary btn-lg" Text="Reset" OnClick="btn_Reset_Click" />

            <asp:Button runat="server" ID="btn_Confirm" Visible="false" CssClass="btn btn-primary btn-lg btn-blg" Text="Confirm" OnClick="btn_Confirm_Click" Width="295px" />

        </div>
    </div>
</asp:Content>
