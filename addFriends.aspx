<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addFriends.aspx.cs" Inherits="Chat_CS.addFriends" %>

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
                    <a href="dashboard.aspx">Home</a>
                </div>
            </div>
            <div class="h-bar">
                <div class="reqPending">
                    Add Friends
                </div>
                <div class="friendsList">
                    <asp:Button ID="btn_send" runat="server" Text="Send Request" OnClick="btn_Click" />
                </div>
            </div>
            <div class="nav-container">
                <div class="textField">
                    <asp:Label ID="l_op" runat="server" ForeColor="#009900"></asp:Label>
                </div>
                <asp:ListBox ID="lb_allUsers" runat="server" Width='100%'></asp:ListBox>
            </div>
        </form>
    </div>
</body>
</html>
