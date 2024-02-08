using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat_CS {
    public partial class index:System.Web.UI.Page {
        MainDB db = new MainDB();
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void l_btn_Click(object sender, EventArgs e) {
            string uname = l_uname.Text, psrd = l_psrd.Text;
            if(db.usernameExists(uname)) {
                if(db.getPass(uname)==psrd) {
                    Session["id"]=db.getId(uname);
                    Response.Redirect("dashboard.aspx");
                } else {
                    res.Text="Wrong Password";
                    l_psrd.Text=null;
                }
            } else {
                res.Text="Invalid Username";
            }
        }
    }
}