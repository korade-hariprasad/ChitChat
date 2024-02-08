using System;

namespace Chat_CS {
    public partial class register:System.Web.UI.Page {
        MainDB db = new MainDB();
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void r_btn_Click(object sender, EventArgs e) {
            if(db.usernameExists(r_uname.Text)) {
                l_uname.ForeColor=System.Drawing.Color.Yellow;
                l_uname.Text="Username already exists";
                r_uname.Text=null;
            } else {
                l_uname.ForeColor=System.Drawing.Color.White;
                l_uname.Text="Username available";
                if(db.insertNewUser(r_uname.Text, r_psrd.Text, r_question.Text, r_ans.Text)) {
                    l_reg.ForeColor=System.Drawing.Color.White;
                    l_reg.Text="User Registered. Please login to continue";
                } else {
                    l_reg.ForeColor=System.Drawing.Color.Yellow;
                    l_reg.Text="Something went wrong...";
                }
                r_uname.Text=r_psrd.Text=r_ans.Text=null;
            }
        }
    }
}