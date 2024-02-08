using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat_CS {
    public partial class requests:System.Web.UI.Page {
        int id;
        NpgsqlDataReader reader;
        MainDB db = new MainDB();
        protected void Page_Load(object sender, EventArgs e) {
            id=Int32.Parse(Session["id"].ToString());
            if(!IsPostBack) fillList();
        }

        private void fillList() {
            reader=db.getRequests(id);
            lb.Items.Clear();
            List<Int32> ids = new List<Int32>();
            while(reader.Read()) {
                Int32 i = reader.GetInt32(0);
                ids.Add(i);
            }
            reader.Close();
            foreach(Int32 i in ids)
                lb.Items.Add(db.getUname(i));
        }

        protected void accept_Click(object sender, EventArgs e) {
            if(lb.SelectedItem!=null) {
                string uname = lb.SelectedItem.ToString();
                int b = db.getId(uname);
                db.addFriend(id, b);
                db.createChat(id, b);
                db.removeRequest(id, b);
                l_res.Text="Request accepted";
            } else {
                l_res.Text="Please select a request from the list";
            }
            fillList();
        }

        protected void delete_Click(object sender, EventArgs e) {
            if(lb.SelectedItem!=null) {
                string uname = lb.SelectedItem.ToString();
                int b = db.getId(uname);
                db.removeRequest(id, b);
                l_res.Text="Request rejected";
            } else {
                l_res.Text="Please select a request from the list";
            }
            fillList();
        }
    }
}