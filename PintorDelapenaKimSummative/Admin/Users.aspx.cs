using DataAccess;
using System;

namespace PintorDelapenaKimSummative.Admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        DataHandler DataHandler = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = DataHandler.GetAdmins();
            GridView1.DataBind();

            GridView2.DataSource = DataHandler.GetUsers();
            GridView2.DataBind();
        }
    }
}