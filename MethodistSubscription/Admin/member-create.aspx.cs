using MethodistSubscription.Models;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MethodistSubscription.Admin
{
    public partial class member_create : System.Web.UI.Page
    {
        readonly LookUp lp = new LookUp("con");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                getRoles();
            }
        }

        private void getRoles()
        {
            try
            {
                if (lp.getRoles() != null)
                {
                    ListItem li = new ListItem("Select a role", "0");
                    drpRole.DataSource = lp.getRoles();
                    drpRole.DataValueField = "ID";
                    drpRole.DataTextField = "Role";
                    drpRole.DataBind();
                    drpRole.Items.Insert(0, li);
                }
                else
                {
                    ListItem li = new ListItem("There are no defined roles", "0");
                    drpRole.DataSource = null;
                    drpRole.DataBind();
                    drpRole.Items.Insert(0, li);
                }

            }
            catch (Exception ex)
            {
                throw;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

            UserManagement user = new UserManagement("con");
            if (string.IsNullOrEmpty(txtFirstName.Text))
            {
                msgbox("Please enter first name");
                return;
            }
            if (string.IsNullOrEmpty(txtLastName.Text))
            {
                msgbox("Please enter last name");
                return;
            }
            if (string.IsNullOrEmpty(txtEmail.Text))
            {
                msgbox("Please enter email");
                return;
            }
            if (txtEmail.Text.Contains("'"))
            {
                txtEmail.Text = txtEmail.Text.Replace("'", "");
            }

            if (!txtEmail.Text.Contains("@"))
            {
                msgbox("Please enter a valid email address");
                return;
            }

            if (drpRole.SelectedValue == "0")
            {
                msgbox("Please select role");
                return;
            }
            user.SaveClient(int.Parse(drpRole.SelectedValue), txtFirstName.Text, txtLastName.Text, txtEmail.Text, txtMobile.Text, "XC4G160UbpgbPhnnnYcKfw==");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User successfully created');window.location ='../Admin/members-enquiries.aspx';", true);
            Clear();



        }
        private void Clear()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtMobile.Text = string.Empty;
            drpRole.SelectedValue = "0";

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