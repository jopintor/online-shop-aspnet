using DataAccess;
using System;
using System.Data;

namespace PintorDelapenaKimSummative.Main
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblAccountNotFound.Visible = false;
            lblPassword.Visible = false;

        }

        DataHandler DataHandler = new DataHandler();
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataTable dt = DataHandler.GetAccount(txtEmailAddress.Text);

            if (dt == null || dt.Rows.Count == 0)
            {
                lblAccountNotFound.Visible = true;
                return;
            }

            DataRow dr = dt.Rows[0];

            if (!DataHandler.CheckPassword(dr["ID"].ToString(), dr["Password"].ToString(), txtPassword.Text))
            {
                lblPassword.Visible = true;
                return;
            }

            Session["Name"] = dr["FirstName"].ToString();
            Session["UserID"] = dr["ID"].ToString();
            Session["MembershipType"] = dr["MembershipType"].ToString();
            Session["Role"] = dr["Role"].ToString();

            if (dr["Role"].ToString() == "Admin")
            {
                Response.Redirect("/Admin/Home.aspx");
            }
            else
            {
                Response.Redirect("/User/Home.aspx");
            }
        }
    }
}