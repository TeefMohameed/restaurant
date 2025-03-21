<%@ Page Title="إنشاء حساب" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="CreateAccount.aspx.cs" Inherits="restaurant.Pages.CreateAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-container">
        <h2>إنشاء حساب جديد</h2>
        <asp:Label ID="lblOutput" runat="server" CssClass="error-label"></asp:Label>
        <asp:TextBox ID="txtNewUserName" runat="server" placeholder="اسم المستخدم" CssClass="input-field"></asp:TextBox><br />
        <asp:TextBox ID="txtNewEmail" runat="server" placeholder="البريد الإلكتروني" CssClass="input-field"></asp:TextBox><br />
        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" placeholder="كلمة المرور" CssClass="input-field"></asp:TextBox><br />
        <asp:Button ID="btnCreateUser" runat="server" Text="إنشاء حساب" CssClass="btn" OnClick="btnCreateUser_Click" />
    </div>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            height: 100vh;
            position: relative;
        }

        .login-container {
            background-color: #FFFFFF;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .login-container h2 {
            color: #333333;
            margin-bottom: 20px;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .input-field:focus {
            border-color: #FFA500;
            outline: none;
        }

        .btn {
            background-color: #FF8C00;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #FFA500;
        }

        .signup-text {
            margin-top: 10px;
            color: #666;
            display: block;
        }

        .error-label {
            color: red;
            margin-bottom: 10px;
            display: block;
        }

        footer {
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            width: 100%;
            padding: 10px;
            font-size: 14px;
            color: #666;
            background-color: #f4f4f4;
        }
    </style>
</asp:Content>