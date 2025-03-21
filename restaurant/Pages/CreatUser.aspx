<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreatUser.aspx.cs" Inherits="restaurant.Pages.CreatUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2>إنشاء حساب جديد</h2>
<asp:TextBox ID="txtNewUserName" runat="server" Placeholder="اسم المستخدم"></asp:TextBox><br />
<asp:TextBox ID="txtNewPassword" runat="server" Placeholder="كلمة المرور" TextMode="Password"></asp:TextBox><br />
<asp:TextBox ID="txtNewEmail" runat="server" Placeholder="البريد الإلكتروني"></asp:TextBox><br />
<asp:Button ID="BtnCreateUser" runat="server" Text="إنشاء حساب" OnClick="BtnCreateUser_Click" />
<asp:Label ID="lblOutput" runat="server" ForeColor="Green"></asp:Label>

</asp:Content>
