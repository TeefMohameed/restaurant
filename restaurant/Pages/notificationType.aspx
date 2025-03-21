<%@ Page Title="Notification Type" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="notificationType.aspx.cs" Inherits="restaurant.Pages.notificationType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblOutput" runat="server" ForeColor="Red"></asp:Label>
    <h2 class="notification-title">Notifications</h2>
    <asp:GridView ID="gvNotification" runat="server" AutoGenerateColumns="True" CssClass="notification-table">
    </asp:GridView>
    <style>
        .notification-title {
            text-align: center;
            margin-top: 20px;
            font-size: 24px;
            color: #ffa500; /* لون برتقالي يتناسب مع مشروعك */
        }
        .notification-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .notification-table th, .notification-table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        .notification-table th {
            background-color: #ffa500;
            color: #fff;
        }
        .notification-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
                footer {
            text-align: center;
            width: 100%;
            padding: 10px 0;
            font-size: 14px;
        }
    </style>
</asp:Content>