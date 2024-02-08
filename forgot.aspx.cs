using System;

namespace Chat_CS {
    public partial class forgot:System.Web.UI.Page {
        MainDB db = new MainDB();
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void reset_Click(object sender, EventArgs e) {
            if(db.updatePass(uname.Text, new_psrd.Text)) {
                l_res.ForeColor=System.Drawing.Color.White;
                l_res_f.Text="Password reset successfully. Please login with new password.";
            } else {
                l_res.ForeColor=System.Drawing.Color.Yellow;
                l_res_f.Text="Something went wrong.";
            }
        }

        protected void btn_check_Click(object sender, EventArgs e) {
            question.Text=db.getQuestion(uname.Text);
            if(question.Text=="") question.Text="Invalid user";
            else {
                btn_verify.Visible=true;
                ans.Visible=true;
            }
        }

        protected void btn_verify_Click(object sender, EventArgs e) {
            new_psrd.Visible=false;
            reset.Visible=false;
            if(ans.Text==db.getAns(uname.Text)) {
                new_psrd.Visible=true;
                reset.Visible=true;
                l_res.ForeColor=System.Drawing.Color.White;
                l_res.Text="Enter your new password below";
            } else {
                l_res.ForeColor=System.Drawing.Color.Yellow;
                l_res.Text="You did not answered correctly, please contact admin.";
            }
        }

        protected void btn_login_Click(object sender, EventArgs e) {
            Response.Redirect("inedx.aspx");
        }
    }
}