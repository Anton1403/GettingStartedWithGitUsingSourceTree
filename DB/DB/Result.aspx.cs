using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;


namespace DB
{
    public partial class Result : System.Web.UI.Page
    {

        public void Button1_Click(object sender, EventArgs e)
        {
            string currentValue = DropDownList1.SelectedItem.Value;
            SqlDataSource1.SelectParameters["fio"].DefaultValue = currentValue;
            string strValue = Page.Request.Form["lineForDate"].ToString();
            DateTime currentDate = Convert.ToDateTime(strValue);
            DateTime oneMoreDay = currentDate.AddDays(1);
            SqlDataSource1.SelectParameters["firstDate"].DefaultValue = currentDate.ToString("yyyyMMdd");
            SqlDataSource1.SelectParameters["secondDate"].DefaultValue = oneMoreDay.ToString("yyyyMMdd");


            //System.DateTime date1 = new System.DateTime(2014, 10, 10, 20, 7, 34);
            //System.DateTime date2 = new System.DateTime(2014, 10, 10, 1, 34, 36);
            //System.TimeSpan diff1 = date1.Subtract(date2);
            //System.TimeSpan diff1 = date1 - date2;
            //DateTime date = date1.Add(date2.TimeOfDay);
            //MessageBox.Show(date.ToString());*/
        }
        

    }
}
