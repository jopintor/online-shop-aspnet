using DataAccess;
using System;
using System.Web.UI;

namespace PintorDelapenaKimSummative.Admin
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        DataHandler DataHandler = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblAdded.Visible = false;
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblAdded.Visible = true;
                DataHandler.CreateProduct(txtProductID.Text, txtProductName.Text, txtStocks.Text, txtSRP.Text);
            }
        }
    }
}