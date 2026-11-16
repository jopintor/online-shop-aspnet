using System;

namespace PintorDelapenaKimSummative.Main
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Name"] = string.Empty;
            Session["UserID"] = string.Empty;
            Session["MembershipType"] = string.Empty;
            Session["Role"] = null;
        }
    }
}