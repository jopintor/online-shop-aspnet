using DataAccess;
using System;
using System.Data;
using System.Web.UI;

namespace PintorDelapenaKimSummative.Main
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblRegistered.Visible = false;
        }

        DataHandler DataHandler = new DataHandler();
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (DataHandler.CheckEmail(txtEmailAddress.Text))
                {
                    lblRegistered.Visible = true;
                }
                else
                {
                    DataHandler.CreateAccount(txtEmailAddress.Text, txtFirstName.Text, txtLastName.Text, txtPassword.Text);
                    
                    DataTable dt = DataHandler.GetUserByEmail(txtEmailAddress.Text);

                    foreach (DataRow dr in dt.Rows)
                    {
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
        }
    }
}