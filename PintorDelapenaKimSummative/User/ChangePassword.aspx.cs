using DataAccess;
using System;
using System.Data;

namespace PintorDelapenaKimSummative.User
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        DataHandler DataHandler = new DataHandler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string userID = Session["UserID"].ToString();
            DataTable dt = DataHandler.GetUserByUserID(userID);

            if (dt.Rows.Count > 0 && DataHandler.CheckPassword(userID, dt.Rows[0]["Password"].ToString(), txtCurrent.Text))
            {
                DataHandler.ChangeUserPassword(Session["UserID"].ToString(), txtNew.Text);
                Session["Name"] = string.Empty;
                Session["UserID"] = string.Empty;
                Session["MembershipType"] = string.Empty;
                Session["Role"] = null;
                Response.Redirect("/Main/Home.aspx");
            }
            else lblInvalidPassword.Visible = true;
        }
    }
}