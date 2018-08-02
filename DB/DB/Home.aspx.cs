using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Timer1 != null)
            {
                Timer1.Enabled = true;
            }
        }
        protected void Page_UnLoad(object sender, EventArgs e)
        {
            if (Timer1 != null)
            {
                Timer1.Enabled = false;
            }
        }
    }
}