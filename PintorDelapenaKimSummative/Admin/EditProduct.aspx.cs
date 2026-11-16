using DataAccess;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace PintorDelapenaKimSummative.Admin
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        DataHandler DataHandler = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDelete.Visible = false;
            lblEdit.Visible = false;
            if (!IsPostBack)
            {
                if (!drpProducts.Items.Contains(new ListItem("Select Product"))) drpProducts.Items.Add("Select Product");
                foreach (DataRow dr in DataHandler.GetProducts().Rows)
                {
                    if (!drpProducts.Items.Contains(new ListItem(dr["ProductName"].ToString())))
                    {
                        drpProducts.Items.Add(dr["ProductName"].ToString());
                    }
                }
            }
        }

        protected void drpProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpProducts.SelectedIndex == 0) return;
            foreach (DataRow dr in DataHandler.GetProducts().Rows)
            {
                if (dr["ProductName"].Equals(drpProducts.SelectedItem.Text))
                {
                    lblProductNumber.Text = dr["ProductNumber"].ToString();
                    txtProductID.Text = dr["ProductID"].ToString();
                    txtProductName.Text = dr["ProductName"].ToString();
                    txtStocks.Text = dr["Stocks"].ToString();
                    txtPrice.Text = dr["Price"].ToString();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            DataHandler.UpdateProduct(lblProductNumber.Text, txtProductID.Text, txtProductName.Text, txtStocks.Text, txtPrice.Text);
            lblEdit.Visible = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DataHandler.DeleteProduct(lblProductNumber.Text);
            lblDelete.Visible = true;
            drpProducts.SelectedIndex = 0;
            lblProductNumber.Text = string.Empty;
            txtProductID.Text = string.Empty;
            txtProductName.Text = string.Empty;
            txtStocks.Text = string.Empty;
            txtPrice.Text = string.Empty;
        }
    }
}