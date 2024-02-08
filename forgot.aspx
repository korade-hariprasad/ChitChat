<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot.aspx.cs" Inherits="Chat_CS.forgot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ChitChat</title>
    <link rel="stylesheet" href="css/forgot.css" />
</head>
<body>
    <div class="forgotPage">
        <div class="hero-header">
            <h1>ChitChat</h1>
        </div>
        <form id="form1" runat="server">
            <div class="form-container">
                <h3>Forgot Password</h3>
                <div class="form-group">
                    <asp:TextBox ID="uname" runat="server" placeholder="Enter username.." required></asp:TextBox>
                </div>
                <div class="form-group btn">
                    <asp:Button ID="btn_check" runat="server" Text="Check" OnClick="btn_check_Click" />
                    <a href="index.aspx">Back to Login</a>
                </div>
                <div class="form-group">
                    <asp:Label ID="question" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="ans" runat="server" placeholder="Your answer.." required Visible="False"></asp:TextBox>
                    <asp:Button ID="btn_verify" runat="server" Text="Verify Answer" OnClick="btn_verify_Click" Visible="False" />
                </div>
                <div class="form-group">
                    <asp:Label ID="l_res" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="new_psrd" runat="server" Visible="False" TextMode="Password" placeholder="Enter new password.."></asp:TextBox>
                    <asp:Button ID="reset" runat="server" OnClick="reset_Click" Text="Reset" Visible="False" />
                </div>
                <div class="form-group">
                    <asp:Label ID="l_res_f" runat="server"></asp:Label>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
