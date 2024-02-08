<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Chat_CS.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ChitChat</title>
    <link rel="stylesheet" href="css/login.css"/>
</head>
<body>
    <div class="loginPage">
        <form id="form1" runat="server">
            <div class="form-group">
                <h3>Login</h3>
            </div>
            <div class="form-group">
                <asp:TextBox ID="l_uname" runat="server" placeholder="Enter username" required></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="l_psrd" runat="server" placeholder="Enter password" required TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="l_btn" runat="server" Text="Login" OnClick="l_btn_Click" />
            </div>
            <div class="form-group">
                <asp:Label ID="res" runat="server" ForeColor="Red"></asp:Label>
            </div>
            <div class="form-group">
               <p>Forgot Password? <a href="forgot.aspx">Click here</a></p>
            </div>
            <div class="form-group">
               <p>New User? <a href="register.aspx">Register here</a></p>
            </div>
        </form>
    </div>
</body>
</html>
