using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Chat_CS {
    public partial class dashboard:System.Web.UI.Page {
        int id;
        MainDB db = new MainDB();
        NpgsqlDataReader reader;
        DataTable dataTable;
        NpgsqlDataAdapter adapter;
        
        protected void Page_Load(object sender, EventArgs e) {
            id=Int32.Parse(Session["id"].ToString());
            List<Int32> li = new List<Int32>();
            dataTable=new DataTable();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "l_chat", "scrollToBottom();", true);
            
            //fill the user chat onLoad
            if(!IsPostBack) {
                reader=db.getFriends(id);
                while(reader.Read()) li.Add(reader.GetInt32(0));
                reader.Close();
                foreach(Int32 i in li) select_friend.Items.Add(db.getUname(i));
                if(select_friend.SelectedItem!=null) fillChat();
            }

            //show notification if new requests are present
            l_new_req.Text="You have "+db.getRequestCountOf(id)+" new request(s).";
        }
        
        protected void btn_send_Click(object sender, EventArgs e) {
            if(tb_msg.Text!=null&&select_friend.SelectedItem!=null) {
                string uname = select_friend.SelectedItem.ToString();
                int b = db.getId(uname);
                db.insertIntoChat(id, b, tb_msg.Text, DateTime.Now.ToString("dd-MM HH:mm"));
            }
            fillChat();
            tb_msg.Text=null;
        }

        protected void select_friend_SelectedIndexChanged(object sender, EventArgs e) {
            fillChat();
        }

        protected void l_chat_ItemDataBound(object sender, ListViewItemEventArgs e) {
            if(e.Item.ItemType==ListViewItemType.DataItem) {
                var dataItem = (DataRowView)e.Item.DataItem;
                int senderValue = Convert.ToInt32(dataItem["sender"]);
                string displayValue = (senderValue==id) ? "You :" : select_friend.SelectedItem.Text+" :";
                var senderSpan = (HtmlGenericControl)e.Item.FindControl("senderSpan");
                senderSpan.InnerText=displayValue;
            }
        }

        //function which fills the chat
        protected void fillChat() {
            l_chat.Items.Clear();
            adapter=db.getChat(id+db.getId(select_friend.SelectedItem.Text));
            adapter.Fill(dataTable);
            l_chat.DataSource=dataTable;
            l_chat.DataBind();
        }
    }
}