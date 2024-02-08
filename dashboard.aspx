<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Chat_CS.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ChitChat</title>
    <link rel="stylesheet" href="css/dashboard.css" />
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div class="nav-container">
                <div class="logo">
                    <h3>ChitChat</h3>
                </div>
                <div class="nav-bar">
                    <a href="">Refresh</a>
                    <a href="addFriends.aspx">Add Friends</a>
                    <a href="requests.aspx">My Requests</a>
                    <a href="index.aspx">Logout</a>
                </div>
            </div>
            <div class="h-bar">
                <div class="reqPending">
                    <asp:Label ID="l_new_req" runat="server"></asp:Label>
                </div>
                <div class="friendsList">
                    Select friend to chat with :
            <asp:DropDownList ID="select_friend" runat="server" OnSelectedIndexChanged="select_friend_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
                </div>
            </div>
            <div class="textField">
                <asp:TextBox ID="tb_msg" runat="server" placeholder="Type message.." AutoCompleteType="Disabled" required="true"></asp:TextBox>
                <asp:Button ID="btn_send" runat="server" Text="Send" OnClick="btn_send_Click" />
            </div>
            <div class="chatBox">
                <asp:ListView ID="l_chat" runat="server" OnItemDataBound="l_chat_ItemDataBound">
                    <ItemTemplate>
                        <div class='chatItem'>
                            <div class="left">
                                <span id="senderSpan" runat="server"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                            <div class="mid">
                                <span><%# Eval("msg") %></span>
                            </div>
                            <div class="right">
                                <span style="font-size: smaller;"><%# Eval("at") %></span>
                            </div>
                        </div>
                        <br />
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </form>
    </div>
</body>
</html>
