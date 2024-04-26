using MethodistSubscription.Models;
using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;

namespace MethodistSubscription.Admin
{
    public partial class member_details : System.Web.UI.Page
    {
        readonly LookUp lp = new LookUp("con");
        readonly UserManagement usr = new UserManagement("con");
        readonly QueryStringModule qn = new QueryStringModule();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtid.Value = "0";
                if (Request.QueryString["ID"] != null)
                {
                    txtid.Value = qn.Decrypt(HttpUtility.UrlDecode(Request.QueryString["ID"].ToString()));

                }
                getSubs();
                getMemberDetails();
            }
        }

        private void getMemberDetails()
        {
            DataSet ds = usr.getUserByUserID(int.Parse(txtid.Value));
            if (ds!= null)
            {
                txtName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
                txtSurname.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["EmailAddress"].ToString();
                txtMobile.Text = ds.Tables[0].Rows[0]["MobileNumber"].ToString();
            }
        }

        private void getSubs()
        {
            DataSet ds = lp.getSubs(int.Parse(txtid.Value));
            if (ds!= null)
            {
                grdSubs.DataSource = ds;
                grdSubs.DataBind();
            }
        }

        protected void grdSubs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void grdSubs_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

    }
}