using DataAccess;
using System;
using System.Data;

namespace PintorDelapenaKimSummative.User
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        DataHandler DataHandler = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = DataHandler.GetUserByUserID(Session["UserID"].ToString());

            lblEmail.Text = dt.Rows[0]["EmailAddress"].ToString();
            lblFirstName.Text = dt.Rows[0]["FirstName"].ToString();
            lblLastName.Text = dt.Rows[0]["LastName"].ToString();
            lblMembership.Text = dt.Rows[0]["MembershipType"].ToString();
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            Response.Redirect("/User/ChangePassword.aspx");
        }
    }
}