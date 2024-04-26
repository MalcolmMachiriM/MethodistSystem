using MethodistSubscription.Models;
using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Web;

namespace MethodistSubscription.Admin
{
    public partial class members_enquiries : System.Web.UI.Page
    {
        QueryStringModule qn = new QueryStringModule();
        readonly LookUp lp = new LookUp("con");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getClients();
            }
        }

        private void getClients()
        {
            DataSet Users = lp.getAllClients();
            if (Users != null)
            {
                grdClients.DataSource = Users;
                grdClients.DataBind();
            }
        }
        protected void grdClients_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void grdClients_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            long index = long.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "assignrecord")
            {
                string EcryptedID = HttpUtility.UrlEncode(qn.Encrypt(index.ToString()));
                Response.Redirect("~/Admin/member-assign?ID=" + EcryptedID + "");
            }
        }
    }
}