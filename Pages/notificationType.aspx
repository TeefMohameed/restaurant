<%@ Page Title="Notification Type" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="notificationType.aspx.cs" Inherits="restaurant.Pages.notificationType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblOutput" runat="server" ForeColor="Red"></asp:Label>
    <h2 class="notification-title">Notifications</h2>

    <!-- Radio Button List -->
   <asp:RadioButtonList 
    ID="rblNotificationType" 
    runat="server" 
    AutoPostBack="True" 
    OnSelectedIndexChanged="rblNotificationType_SelectedIndexChanged"
    RepeatDirection="Horizontal" 
    CssClass="radio-button-list">
    <asp:ListItem Text="All" Value="all" Selected="True"></asp:ListItem>
    <asp:ListItem Text="Pending" Value="pending"></asp:ListItem>
    <asp:ListItem Text="Completed" Value="completed"></asp:ListItem>
</asp:RadioButtonList>

    <!-- GridView -->
    <asp:GridView ID="gvNotification" runat="server" AutoGenerateColumns="True" CssClass="notification-table">
    </asp:GridView>

    <!-- Repeater Control -->
    <asp:Repeater ID="rptNotifications" runat="server" DataSourceID="SqlDataSource1">
        <HeaderTemplate>
            <div class="notification-list">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="notification-item">
                <h4><%# Eval("message") %></h4>
                <p><strong>Status:</strong> <%# Eval("status") %></p>
                <p><strong>Date:</strong> <%# Eval("date", "{0:yyyy-MM-dd}") %></p>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Helah7685aConStr %>" SelectCommand="SELECT * FROM [notificationType]"></asp:SqlDataSource>

   <style>
    /* تنسيق العنوان */
    .notification-title {
        text-align: center;
        margin-top: 20px;
        font-size: 24px;
        color: #ffa500;
    }

    /* تنسيق الجدول */
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

    /* تنسيق القائمة */
    .notification-list {
        margin: 20px auto;
        padding: 10px;
        width: 80%;
        border: 1px solid #ddd;
        border-radius: 8px;
        background-color: #fefefe;
    }

    .notification-item {
        border-bottom: 1px solid #ddd;
        padding: 10px 0;
    }

    .notification-item:last-child {
        border-bottom: none;
    }

    /* تنسيق RadioButtonList */
    .radio-button-list {
        display: flex;
        justify-content: center; /* لجعل الخيارات في المنتصف */
        align-items: center; /* لمحاذاة الخيارات عموديًا */
        gap: 20px; /* المسافة بين الخيارات */
        margin-bottom: 20px; /* مسافة من الأسفل */
        font-size: 18px; /* حجم النص */
        text-align: center;
    }

    .radio-button-list input[type="radio"] {
        margin-right: 5px; /* مسافة صغيرة بين النص والراديو */
    }

            footer {
            text-align: center;
            width: 100%;
            padding: 10px 0;
            font-size: 14px;
        }
</style>
</asp:Content>