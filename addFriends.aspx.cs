using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat_CS {
    public partial class addFriends:System.Web.UI.Page {
        NpgsqlDataReader reader;
        MainDB db = new MainDB();
        int id;
        protected void Page_Load(object sender, EventArgs e) {
            id=Int32.Parse(Session["id"].ToString());
            if(!IsPostBack) fillList();
        }

        private void fillList() {
            string uname = db.getUname(id);
            lb_allUsers.Items.Clear();
            reader=db.getReader(id);
            while(reader.Read()) {
                string username = reader.GetString(0);
                if(username!=uname)
                    lb_allUsers.Items.Add(username);
            }
            reader.Close();
        }
        protected void btn_Click(object sender, EventArgs e) {
            if(lb_allUsers.SelectedItem!=null) {
                string uname = lb_allUsers.SelectedItem.ToString();
                int b = db.getId(uname);
                db.sendRequest(id, b);
                l_op.Text="Request sent";
                fillList();
            } else {
                l_op.Text="Please select a friend from the list";
            }
        }
    }
}