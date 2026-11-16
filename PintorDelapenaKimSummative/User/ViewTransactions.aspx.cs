using DataAccess;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace PintorDelapenaKimSummative.User
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        DataHandler DataHandler = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = DataHandler.GetUserTransactionsByUserID(Convert.ToInt32(Session["UserID"].ToString()));
            DataTable dt2 = new DataTable();
            DataColumn column = new DataColumn();
            var keys = new DataColumn[1];
            column.DataType = Type.GetType("System.String");
            column.ColumnName = "SaleCode";
            dt2.Columns.Add(column);
            keys[0] = column;
            dt2.PrimaryKey = keys;
            dt2.Columns.Add("PurchaseDate");

            foreach (DataRow dr in dt.Rows)
            {
                if (!dt2.Rows.Contains(dr["SaleCode"]))
                {
                    DataRow newRow = dt2.NewRow();
                    newRow["SaleCode"] = dr["SaleCode"].ToString();
                    newRow["PurchaseDate"] = DateTime.Parse(dr["PurchaseDate"].ToString()).ToString("MM/dd/yyyy HH:mm");
                    dt2.Rows.Add(newRow);
                }
            }


            Repeater1.DataSource = dt2;
            Repeater1.DataBind();
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            GridView gridView = (GridView)e.Item.FindControl("GridView1");
            Label lblTransactionID = (Label)e.Item.FindControl("lblTransactionID");
            Label lblTotal = (Label)e.Item.FindControl("lblTotal");

            DataTable dt = DataHandler.GetUserTransactionByUserID(Session["UserID"].ToString(), lblTransactionID.Text);
            lblTotal.Text = dt.Rows[0]["FinalPrice"].ToString();
            dt.Columns.RemoveAt(4);

            gridView.DataSource = dt;
            gridView.Width = Unit.Percentage(100);
            gridView.DataBind();

            foreach (DataControlField column in gridView.Columns)
            {
                if (column.Equals("Product Name"))
                {
                    column.ItemStyle.Width = Unit.Percentage(100);
                }
                else
                {
                    column.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                }
            }
        }
    }
}