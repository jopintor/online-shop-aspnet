using DataAccess;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace PintorDelapenaKimSummative.User
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        DataHandler DataHandler = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateLabels();
        }

        private void UpdateLabels()
        {
            DataTable dt = DataHandler.GetCart(Session["UserID"].ToString());

            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            double total = 0;

            foreach (DataRow dr in dt.Rows)
            {
                total += Convert.ToDouble(dr["Price"].ToString());
            }

            lblTotal.Text = "₱ " + (total + (total * 0.10)).ToString();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            DataTable dt = DataHandler.GetFinalUserCart(Session["UserID"].ToString());
            DateTime dateTime = DateTime.Now;
            string saleCode = "OR-" + Session["UserID"].ToString() + dateTime.ToString("yyyyMMddHHmmss");

            //Calculating Total
            double total = 0;
            foreach (DataRow dr in dt.Rows)
            {
                total += (Convert.ToDouble(dr["SRP"].ToString()) * Convert.ToDouble(dr["Amount"].ToString()));
            }

            //Checking if Eligible for Discount
            total = total + (total * 0.10);

            double finalTotal;
            if (total > 10000)
            {
                double userDiscount = Convert.ToDouble(DataHandler.GetUserDiscount(Session["UserID"].ToString()).Rows[0]["Discount"]);
                finalTotal = total - (total * (userDiscount / 100));
            }
            else finalTotal = total;

            //Making Transactions
            foreach (DataRow dr in dt.Rows)
            {
                double taxedPrice = Convert.ToDouble(dr["SRP"]) + (Convert.ToDouble(dr["SRP"]) * 0.10);
                DataHandler.CreateTransaction(saleCode, dr["ProductID"].ToString(), Session["UserID"].ToString(), dr["Amount"].ToString(), taxedPrice.ToString("#.##"), dateTime.ToString(""), finalTotal.ToString("#.##"));
            }

            //Finalizing Transaction
            Session["SaleCode"] = saleCode;
            DataHandler.ClearCart(Session["UserID"].ToString());
            Response.Redirect("/User/Receipt.aspx");
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Label lblProduct = (Label)e.Item.FindControl("lblProductID");
            Label lblAmount = (Label)e.Item.FindControl("lblAmount");
            //DataTable dt = DataHandler.GetCartItem(Session["UserID"].ToString(), lblProduct.Text);

            if (e.CommandName == "Increase")
            {
                DataTable dt = DataHandler.GetProduct(lblProduct.Text);

                if (Convert.ToInt32(dt.Rows[0]["Stocks"].ToString()) > Convert.ToInt32(lblAmount.Text))
                {
                    int newAmount = Convert.ToInt32(lblAmount.Text) + 1;
                    DataHandler.UpdateCart(Session["UserID"].ToString(), lblProduct.Text, newAmount.ToString());
                }
            }
            else if (e.CommandName == "Decrease")
            {
                if (Convert.ToInt32(lblAmount.Text) > 0)
                {
                    int newAmount = Convert.ToInt32(lblAmount.Text) - 1;
                    DataHandler.UpdateCart(Session["UserID"].ToString(), lblProduct.Text, newAmount.ToString());

                }
            }

            UpdateLabels();
        }
    }
}