<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="requests.aspx.cs" Inherits="Chat_CS.requests" %>

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
                    Your have requests from
                </div>
                <div class="friendsList">
                    <asp:Button ID="accept" runat="server" OnClick="accept_Click" Text="Accept" />
                    <asp:Button ID="delete" runat="server" OnClick="delete_Click" Text="Delete" />
                </div>
            </div>
            <div class="nav-container">
                <div class="textField">
                    <asp:Label ID="l_res" runat="server"></asp:Label>
                </div>
            </div>
            <asp:ListBox ID="lb" runat="server"></asp:ListBox>
        </form>
    </div>
</body>
</html>
