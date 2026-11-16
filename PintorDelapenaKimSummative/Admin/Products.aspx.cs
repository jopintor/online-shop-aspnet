using DataAccess;
using System;

namespace PintorDelapenaKimSummative.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        DataHandler DataHandler = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = DataHandler.GetProducts();
            GridView1.DataBind();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/CreateProduct.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/EditProduct.aspx");
        }
    }
}