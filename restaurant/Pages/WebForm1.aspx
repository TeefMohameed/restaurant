<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="restaurant.Pages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notifications - Restaurant Order Management</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        /* تنسيق النموذج والأزرار */
        form {
            width: 50%;
            margin: 20px auto;
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 8px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label, input, select {
            display: block;
            width: 100%;
            margin-bottom: 10px;
            padding: 8px;
        }

        label {
            font-weight: bold;
        }

        .button-container button {
            margin: 5px;
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .button-container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->

    <!-- Form Section -->
    <section>
        <h2>&nbsp;</h2>
        <h2>Order Management</h2>
        <form>
            <label for="orderID">Order ID:</label>
            <input type="text" id="txtOrderId" name="orderID">

            <label for="userID">User ID:</label>
            <input type="text" id="txtUserId" name="userID">

            <label for="orderDate">Order Date:</label>
            <input type="date" id="txtOrderDate" name="orderDate">

            <label for="status">Status:</label>
            <select id="ddlStatus" name="status">
                <option value="unbound">Unbound</option>
                <option value="pending">Pending</option>
                <option value="completed">Completed</option>
            </select>

            <label for="totalAmount">Total Amount:</label>
            <input type="number" id="txtTotalAmouat" name="totalAmount" step="0.01"><asp:Button ID="Button2" runat="server" Text="Button" />
&nbsp;<asp:Button ID="btnInsert" runat="server" Text="Insert" CssClass="action-btn" OnClick="btnInsert_Click" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="action-btn" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="action-btn" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnSelect" runat="server" Text="Select" CssClass="action-btn" OnClick="btnSelect_Click" />
                    <asp:Button ID="btnExportToExcel" runat="server" Text="ExportToExcel" Width="590px" Height="44px" />
        </form>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Restaurant Management System. All rights reserved.</p>
    </footer>
</body>
</html>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="orderId" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="orderId" HeaderText="orderId" InsertVisible="False" ReadOnly="True" SortExpression="orderId" />
            <asp:BoundField DataField="userId" HeaderText="userId" SortExpression="userId" />
            <asp:BoundField DataField="orderDate" HeaderText="orderDate" SortExpression="orderDate" />
            <asp:BoundField DataField="totalAmount" HeaderText="totalAmount" SortExpression="totalAmount" />
            <asp:BoundField DataField="statusId" HeaderText="statusId" SortExpression="statusId" />
            <asp:BoundField DataField="updatedAt" HeaderText="updatedAt" SortExpression="updatedAt" />
        </Columns>
    </asp:GridView>
    </asp:Content>
