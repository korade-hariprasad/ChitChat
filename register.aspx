<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Chat_CS.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ChitChat</title>
    <link rel="stylesheet" href="css/register.css" />
</head>
<body>
    <div class="registerPage">
        <form id="form1" runat="server">
            <div>
                <h3>Register</h3>
                <div class="form-group">
                    <asp:TextBox ID="r_uname" runat="server" placeholder="Enter username.." required></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="l_uname" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="r_psrd" runat="server" placeholder="Enter password.." required TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="r_question" runat="server">
                        <asp:ListItem>What is your first School name ?</asp:ListItem>
                        <asp:ListItem>What is your pet name ?</asp:ListItem>
                        <asp:ListItem>What is your favourite food ?</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="r_ans" runat="server" placeholder="Enter your answer.." required></asp:TextBox>
                </div>
                <div class="form-group btn">
                    <asp:Button ID="r_btn" runat="server" Text="Register" OnClick="r_btn_Click" />
                    <a href="index.aspx">Back to Login</a>
                </div>
                <div class="form-group">
                    <asp:Label ID="l_reg" runat="server"></asp:Label>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
