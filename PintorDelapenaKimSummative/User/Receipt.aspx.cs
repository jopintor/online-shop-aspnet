using DataAccess;
using System;
using System.Data;

namespace PintorDelapenaKimSummative.User
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        DataHandler DataHandler = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = DataHandler.GetUserTransactionByUserID(Session["UserID"].ToString(), Session["SaleCode"].ToString());

            lblTransactionID.Text = Session["SaleCode"].ToString();

            //Adding Tax
            //foreach (DataRow dr in dt.Rows)
            //{
            //    dr["Amount"] = (Convert.ToDouble(dr["Amount"].ToString()) + (Convert.ToDouble(dr["Amount"].ToString()) * 0.10)).ToString("#.##");
            //}

            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            //Calculating Total
            double total = 0;
            foreach (DataRow dr in dt.Rows)
            {
                total += Convert.ToDouble(dr["Amount"].ToString());
            }

            //Checking Discount
            double finalTotal = total;
            if (total > 10000)
            {
                double userDiscount = Convert.ToDouble(DataHandler.GetUserDiscount(Session["UserID"].ToString()).Rows[0]["Discount"]);
                finalTotal = finalTotal - (total * Convert.ToDouble(userDiscount / 100));
                lblTotal.Text = "Total (" + (int)userDiscount + "% off): ₱" + finalTotal.ToString("#.##");
            }
            else lblTotal.Text = "Total: ₱" + finalTotal.ToString("#.##");
        }
    }
}