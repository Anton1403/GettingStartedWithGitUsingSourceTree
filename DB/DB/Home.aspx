<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DB.Home" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet"> 
    <style type="text/css">
        #Select1 {
            height: 15px;
            width: 178px;
        }
        #Submit1 {
            width: 186px;
            height: 28px;
            margin-left: 50px;
            margin-top: 29px;
            margin-bottom: 0px;
        }
    </style>
</head>
<body style="background-image:url(site-img.jpg); background-repeat:no-repeat; background-position:100% 100%; background-attachment:fixed;">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="Home.aspx">MyPage.com</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item" style="margin-left:20px;">
                    <a class="nav-link" href="Home.aspx">Home</a>
                </li>
                <li class="nav-item" style="margin-left:10px;">
                    <a class="nav-link" href="Result.aspx">Search</a>
                </li>
            </ul>
        </div>
    </nav>
            <div class="container ">
                <div>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
            <asp:SqlDataSource ConflictDetection="CompareAllValues"  OldValuesParameterFormatString="original_{0}" ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SPGAcademyConnectionString %>" SelectCommand="SELECT * FROM ( SELECT Event.EventID, Employee.FIO, Event.EventDescriptionID, Event.EventDate, CASE WHEN Event.EventDescriptionID = 45 THEN 'IN' ELSE 'OUT' END AS Condition, row_number() OVER(partition BY Employee.FIO ORDER BY Event.EventDate DESC) AS rn FROM Employee INNER JOIN Event ON Employee.EmployeeID = Event.EmployeeID) t WHERE t.rn = 1 ORDER BY t.EventDate DESC"></asp:SqlDataSource>
            <br />
        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick">
        </asp:Timer>
            <br />            
            <h2 style="margin-left:266px; font-family: 'Quicksand', sans-serif;">Last modified</h2>
            <div class="table table-hover table-striped row text-center justify-content-center mw-100" style="font-family: 'Quicksand', sans-serif; margin-bottom:50px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EventID" DataSourceID="SqlDataSource1" Height="177px" Width="572px" style="margin-top: 0px;">
                <Columns>
                    <asp:BoundField DataField="EventID" HeaderText="EventID" InsertVisible="False" ReadOnly="True" SortExpression="EventID" />
                    <asp:BoundField DataField="FIO" HeaderText="Name" SortExpression="FIO" />
                    <asp:BoundField DataField="Condition" HeaderText="Condition" ReadOnly="True" SortExpression="Condition" />
                    <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" />
                </Columns>
            </asp:GridView>
                </div>
            <br />
        </div>
    </form>
        </div>
                </div>
    <footer class="page-footer font-small blue fxied-bottom bg-dark">
        <div class="footer-copyright text-center py-3" style="color: white;">
            <a href="Home.aspx" style="color:white;">© MyPage:</a>
            SPG.com
        </div>
    </footer>
</body>
</html>
