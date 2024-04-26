using MethodistSubscription.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MethodistSubscription.Admin
{
    public partial class subs_logging : System.Web.UI.Page
    {
        readonly LookUp lp = new LookUp("con");
        readonly UserManagement usr = new UserManagement("con");
        readonly QueryStringModule qn = new QueryStringModule();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getTodaysSubs();
            }
        }

        private void getTodaysSubs()
        {
            DataSet ds = lp.getTodaySubs();
            if (ds!=null)
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text.IsNullOrWhiteSpace() || drpMode.SelectedValue =="0" )
            {
                msgbox("All fields are required");
            }
            else
            {
                try
                {
                    lp.SaveSubs(UserId: int.Parse(txtName.Text),Mode:int.Parse(drpMode.SelectedValue),amount:decimal.Parse(txtAmount.Text));
                }
                catch (Exception Ex)
                {

                    msgbox(Ex.Message);
                }
            }

        }

        public void msgbox(string strMessage)
        {
            string strScript = "<script language=JavaScript>";
            strScript += "window.alert(\"" + strMessage + "\");";
            strScript += "</script>";
            System.Web.UI.WebControls.Label lbl = new System.Web.UI.WebControls.Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
    }
}