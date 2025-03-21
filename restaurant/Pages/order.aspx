<%@ Page Title="Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="order.aspx.cs" Inherits="restaurant.Pages.order"
    EnableEventValidation="false" ValidateRequest="false"
    %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Section -->
    <div class="page-header">
        Manage Orders
    </div>

    <!-- Order Form Section -->
    <div class="order-form">
        <asp:Label ID="lblOutput" runat="server" Text="Output" CssClass="text-danger"></asp:Label>
        <table class="form-table">
            <tr>
                <td class="text-left"><strong>Order ID</strong></td>
                <td><asp:TextBox ID="txtOrderId" runat="server" CssClass="input-field" /></td>
            </tr>
            <tr>
                <td class="text-left"><strong>User ID</strong></td>
                <td><asp:TextBox ID="txtUserId" runat="server" CssClass="input-field" /></td>
            </tr>
            <tr>
                <td class="text-left"><strong>Order Date</strong></td>
                <td><asp:TextBox ID="txtOrderDate" runat="server" CssClass="input-field" /></td>
            </tr>
            <tr>
                <td class="text-left"><strong>Total Amount</strong></td>
                <td><asp:TextBox ID="txtTotalAmount" runat="server" CssClass="input-field" /></td>
            </tr>
            <tr>
                <td class="text-left"><strong>Status</strong></td>
                <td><asp:DropDownList ID="ddlStatus" runat="server" CssClass="input-field"></asp:DropDownList></td>
            </tr>
        </table>
        <div class="order-buttons">
            <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
            <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="btnSelect_Click" />
            <asp:Button ID="btnExport" runat="server" Text="Export" OnClick="btnExportToExcel_Click" />
        </div>
    </div>

    <!-- Order List Section -->
    <div class="order-list">
        <asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="orderId">
            <Columns>
                <asp:BoundField DataField="orderId" HeaderText="Order ID" />
                <asp:BoundField DataField="userId" HeaderText="User ID" />
                <asp:BoundField DataField="orderDate" HeaderText="Order Date" />
                <asp:BoundField DataField="totalAmount" HeaderText="Total Amount" />
                <asp:BoundField DataField="statusId" HeaderText="Status" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>