using DataAccess;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace PintorDelapenaKimSummative.Admin
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        DataHandler DataHandler = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!drpUser.Items.Contains(new ListItem("Select User"))) drpUser.Items.Add("Select User");
                if (!drpUserID.Items.Contains(new ListItem("Select UserID"))) drpUserID.Items.Add("Select UserID");

                foreach (DataRow dr in DataHandler.GetUsers().Rows)
                {
                    if (!drpUser.Items.Contains(new ListItem(dr["Name"].ToString())))
                    {
                        drpUser.Items.Add(dr["Name"].ToString());
                        drpUser.Items.FindByText(dr["Name"].ToString()).Value = dr["ID"].ToString();
                    }

                    if (!drpUserID.Items.Contains(new ListItem(dr["ID"].ToString())))
                    {
                        drpUserID.Items.Add(dr["ID"].ToString());
                        drpUserID.Items.FindByText(dr["ID"].ToString()).Value = dr["ID"].ToString();
                    }
                }
            }


        }

        protected void drpUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpUser.SelectedIndex == 0)
            {
                drpUserID.SelectedIndex = 0;
                return;
            }

            drpUserID.SelectedIndex = drpUserID.Items.IndexOf(new ListItem(drpUser.SelectedValue));

            UpdateTransactionDrp();
        }

        protected void drpUserID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpUserID.SelectedIndex == 0)
            {
                drpUser.SelectedIndex = 0;
                return;
            }

            drpUser.SelectedValue = drpUserID.SelectedValue;
            UpdateTransactionDrp();
        }

        private void UpdateTransactionDrp()
        {
            drpTransaction.Items.Clear();
            if (!drpTransaction.Items.Contains(new ListItem("Select Transaction"))) drpTransaction.Items.Add("Select Transaction");
            foreach (DataRow dr in DataHandler.GetUserTransactions(drpUserID.SelectedValue).Rows)
            {
                if (!drpTransaction.Items.Contains(new ListItem(dr["SaleCode"].ToString())))
                {
                    drpTransaction.Items.Add(dr["SaleCode"].ToString());
                }
            }
        }


        protected void drpTransaction_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = DataHandler.GetUserTransaction(drpTransaction.SelectedItem.Text);
            lblTotal.Text = "Total: ₱" + Convert.ToDouble(dt.Rows[0]["FinalPrice"]).ToString("#.##");
            dt.Columns.RemoveAt(4);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblNotFound.Visible = false;
            if (DataHandler.GetUserByEmail(txtEmail.Text).Rows.Count > 0)
            {
                DataTable dt = DataHandler.GetUserByEmail(txtEmail.Text);

                drpUser.SelectedValue = dt.Rows[0]["ID"].ToString();
                drpUserID.SelectedValue = dt.Rows[0]["ID"].ToString();
                UpdateTransactionDrp();
            }
            else
            {
                lblNotFound.Visible = true;
            }
        }
    }
}