using System;
using System.Web.UI.WebControls;

namespace PintorDelapenaKimSummative.Main
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HighlightSelectedMenuItem();
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