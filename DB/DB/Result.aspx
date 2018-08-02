<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="DB.Result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" id="dbd">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
    
    
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="1/bootstrap-datepicker.js"></script>
    <link type="text/css" href="2/bootstrap-datepicker.css" rel="stylesheet" />

    <script type="text/javascript">  
        $(function () {  
            $("#datepicker").datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true
            });  
        });  
</script>
    <script runat="server">
        void CustomersGridView_RowDataBound(Object sender, GridViewRowEventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                if (GridView1.Rows[i].Cells[3].Text == "IN")
                {
                    GridView1.Rows[i].CssClass = "antonOpacity";

                }
                else if (GridView1.Rows[i].Cells[3].Text == "OUT")
                {
                    GridView1.Rows[i].CssClass = "antonNextopacity";                    
                }
            }
            GridView1.HeaderStyle.CssClass = "antonTableHeader";
        }
    </script>
    <style>
      .antonNextopacity {
          color:#000;
          background-color:rgba(233,150,122,0.3);
      }
      .antonOpacity {
          color:#000;
          background-color:rgba(107,142,35,0.3);
      }
              .antonTableHeader {
            color:#000;
            background-color:rgba(255,255,255,0.3)
        }
      .antonButton {
          background-color:crimson;
          border:none;
          border-radius:5px;
          color:white;
          transition:0.5s;
          margin:25px;
      }
      .antonButton:hover {
          background-color:#ed375b;
          transition:0.5s;
          box-shadow: 0px 0px 20px crimson;
      }
      .antondroplist {
          border-color:lightgray;
          margin:25px;
      }


    </style>


</head>
<body style="background-image:url(site-img99.jpg); background-repeat:no-repeat; background-position:100%; background-attachment:fixed;">
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
    <div class="container">
        <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SPGAcademyConnectionString %>" SelectCommand="SELECT Event.EventID, Employee.FIO, Event.EventDescriptionID, Event.EventDate, CASE WHEN Event.EventDescriptionID = 45 THEN 'IN' ELSE 'OUT' END AS CONDITION FROM Employee INNER JOIN Event ON Employee.EmployeeID = Event.EmployeeID WHERE Employee.FIO = @fio and Event.EventDate between @firstDate and @secondDate ORDER BY Event.EventDate DESC">
                <SelectParameters>
                    <asp:QueryStringParameter Name="fio" QueryStringField="Employee.FIO" />
                    <asp:QueryStringParameter Name="firstDate" QueryStringField="Event.EventDay" />
                    <asp:QueryStringParameter Name="secondDate" QueryStringField="Event.EventDay" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SPGAcademyConnectionString %>" SelectCommand="SELECT * FROM ( SELECT Event.EventID, Employee.FIO, Event.EventDescriptionID, Event.EventDate, CASE WHEN Event.EventDescriptionID = 45 THEN 'IN' ELSE 'OUT' END AS Condition, row_number() OVER(partition BY Employee.FIO ORDER BY Event.EventDate DESC) AS rn FROM Employee INNER JOIN Event ON Employee.EmployeeID = Event.EmployeeID ) t WHERE t.rn = 1"></asp:SqlDataSource>
            <br />
            <div class="d-flex justify-content-center p-3 m-5">
            <asp:DropDownList CssClass="antondroplist" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="FIO" DataValueField="FIO" style="float:left;" Height="35px">
            </asp:DropDownList>
                <input name="lineForDate" type="text" style="height:35px; width:200px;  float:left;" autocomplete="off" id="datepicker" class="form-control m-4" placeholder="yyyy-mm-dd" />
                    <asp:Button CssClass="antonButton" ID="Button1" runat="server" OnClick="Button1_Click" Text="Show" Width="139px" style=" height:36px" />
            <br />
                <br />
            <br />
            </div>
            <div class="table table-hover  row text-center justify-content-center" style="font-family: 'Quicksand', sans-serif; margin-bottom:120px;"
            <asp:GridView  CssClass=" antonNextopacity antonOpacity antonTableHeader" onrowdatabound="CustomersGridView_RowDataBound"  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EventID" DataSourceID="SqlDataSource1" style="width:650px">
                <Columns>
                    <asp:BoundField DataField="EventID" HeaderText="EventID" InsertVisible="False" ReadOnly="True" SortExpression="EventID" />
                    <asp:BoundField DataField="FIO" HeaderText="Name" SortExpression="FIO" />
                    <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" />
                    <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" ReadOnly="True" />
                </Columns>
            </asp:GridView>
            </div>
        </div>
        </div>
    <footer class="page-footer font-small blue fixed-bottom bg-dark";>
        <div class="footer-copyright text-center py-3" style="color:white;">
            <a href="Home.aspx" style="color:white;"> MyPage:</a>
    SPG.com
        </div>
    </footer>
    </form>
    </body>
</html>
