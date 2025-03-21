<%@ Page Title="Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeBehind="order.aspx.cs" Inherits="restaurant.myResturant.order"
    EnableEventValidation="false" ValidateRequest="false"
    %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header Section -->
    <div class="page-header">
        <h1 class="text-center">Manage Orders</h1>
    </div>

    <!-- Order Form Section -->
    <div class="order-form">
        <table class="form-table">
            <tr>
                <td class="text-left" colspan="2">
                    <asp:Label ID="lblOutput" runat="server" Text="Output"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text-left"><strong>Order ID</strong></td>
                <td>
                    <asp:TextBox ID="txtOrderId" runat="server" CssClass="input-field"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-left"><strong>User ID</strong></td>
                <td>
                    <asp:TextBox ID="txtUserId" runat="server" CssClass="input-field"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-left"><strong>Order Date</strong></td>
                <td>
                    <asp:TextBox ID="txtOrderDate" runat="server" CssClass="input-field"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-left">Price</td>
                <td>
                    <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="input-field"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnInsert_Click" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                   <asp:Button ID="btnDelete" runat="server" Text="Delete" 
    OnClick="btnDelete_Click" 
    OnClientClick="return confirm('Are you sure you want to delete this order?');" />
                    <asp:Button ID="btnSelect" runat="server" Text="Select" OnClick="btnSelect_Click" />
                    <asp:Button ID="btnExport" runat="server" Text="Export" OnClick="btnExportToExcel_Click" />
                </td>
            </tr>
        </table>
    </div>

    <!-- GridView Section -->
    <div class="orders-list">
        <asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="orderId">
            <Columns>
                <asp:TemplateField HeaderText="Order ID">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkupdate" runat="server"  
                            CommandArgument='<%# Bind("orderId") %>' OnClick="populateForm_Click"
                            Text='<%# Eval("orderId")  %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="userId" HeaderText="User ID" />
                <asp:BoundField DataField="totalAmount" HeaderText="Price" />
                <asp:BoundField DataField="orderDate" HeaderText="Order Date" />
            </Columns>
        </asp:GridView>
    </div>
      <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f5f0; /* خلفية بيج ناعمة */
            margin: 0;
            padding: 0;
        }

        .page-header {
            background-color: #e67e22; /* برتقالي */
            color: white;
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .page-header h1 {
            font-size: 28px;
            font-weight: bold;
            margin: 0;
        }

        .order-form {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            padding: 30px;
            max-width: 800px;
            margin: auto;
            margin-bottom: 30px;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.1);
        }

        .form-table {
            width: 100%;
            margin-bottom: 20px;
        }

        .form-table td {
            padding: 15px;
        }

        .form-table td.text-left {
            text-align: left;
            font-weight: bold;
            color: #e67e22;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .input-field:focus {
            border-color: #e67e22;
            outline: none;
        }

        .buttons-container {
            text-align: center;
            margin-top: 20px;
        }

        .btn {
            background-color: #e67e22;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin: 5px;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #d35400;
        }

        .orders-list {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            padding: 20px;
            max-width: 900px;
            margin: auto;
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.1);
        }

        .orders-list table {
            width: 100%;
            border-collapse: collapse;
        }

        .orders-list th,
        .orders-list td {
            padding: 15px;
            text-align: left;
            border: 1px solid #e0e0e0;
        }

        .orders-list th {
            background-color: #e67e22;
            color: white;
            text-align: center;
        }

        .orders-list tr:nth-child(even) {
            background-color: #fdf2e9;
        }

        .orders-list tr:hover {
            background-color: #fbe9d7;
        }

        .orders-list h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #e67e22;
            text-align: center;
        }
        footer {
            text-align: center;
            width: 100%;
            padding: 10px 0;
            font-size: 14px;
        }
    </style>

</asp:Content>