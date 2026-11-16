using System;
using System.Web.UI.WebControls;

namespace PintorDelapenaKimSummative.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Role"] != null)
                {
                    if (Session["Role"].ToString() == "Admin")
                    {
                        Response.Redirect("/Admin/Home.aspx");
                    }
                }
                else
                {
                    Response.Redirect("/Main/Home.aspx");
                }
            }

            HighlightSelectedMenuItem();
            lblUsername.Text = "Welcome, " + Session["Name"].ToString();
            lblMembership.Text = Session["MembershipType"].ToString() + " Membership";
        }

        private void HighlightSelectedMenuItem()
        {
            string MyURL = Request.Url.AbsoluteUri;
            foreach (MenuItem mi in navbar.Items)
            {
                string mytest = System.IO.Path.GetFileName(mi.NavigateUrl);
                if (MyURL.Contains(mytest))
                {
                    mi.Selected = true;
                }
            }
        }
    }
}