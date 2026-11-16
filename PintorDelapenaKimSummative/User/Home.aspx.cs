using DataAccess;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace PintorDelapenaKimSummative.User
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataHandler DataHandler = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateLabels();
            }
        }

        private void UpdateLabels()
        {
            DataTable dt = DataHandler.GetProducts();
            DataTable dt2 = DataHandler.GetCart(Session["UserID"].ToString());
            dt.Columns.Add("InCart");

            foreach (DataRow dr in dt.Rows)
            {
                dr["InCart"] = "Add to Cart";
                foreach (DataRow dr2 in dt2.Rows)
                {
                    if (dr["ProductID"].ToString() == dr2["ProductID"].ToString())
                    {
                        dr["InCart"] = "Add to Cart (" + dr2["Amount"].ToString() + ")";
                        break;
                    }
                }
            }


            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                Label productID = (Label)e.Item.FindControl("lblProductID");
                DataTable dt = DataHandler.GetProduct(productID.Text);
                DataTable dt2 = DataHandler.GetCartItem(Session["UserID"].ToString(), productID.Text);

                if (dt2.Rows.Count > 0)
                {
                    if (Convert.ToInt32(dt.Rows[0]["Stocks"].ToString()) > Convert.ToInt32(dt2.Rows[0]["Amount"].ToString()))
                    {
                        DataHandler.AddToCart(Session["UserID"].ToString(), productID.Text);
                        UpdateLabels();
                    }
                }
                else
                {
                    if (Convert.ToInt32(dt.Rows[0]["Stocks"].ToString()) > 0)
                    {
                        DataHandler.AddToCart(Session["UserID"].ToString(), productID.Text);
                        UpdateLabels();
                    }
                }

            }
        }
    }
}