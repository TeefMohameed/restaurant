<%@ Page Title="Menu List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="restaurant.Pages.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="menu-title">Menu List</h2><br />

    <div class="dropdown-container">
        <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" OnSelectedIndexChanged="FilterMenu">
            <asp:ListItem Text="All" Value="All"></asp:ListItem>
            <asp:ListItem Text="Beverages" Value="Beverages"></asp:ListItem>
            <asp:ListItem Text="Main Course" Value="Main Course"></asp:ListItem>
            <asp:ListItem Text="Appetizers" Value="Appetizers"></asp:ListItem>
            <asp:ListItem Text="Desserts" Value="Desserts"></asp:ListItem>
        </asp:DropDownList>
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="menu-table" DataKeyNames="menuId" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="menuId" HeaderText="Menu ID" Visible="true" />
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <img src='<%# DataBinder.Eval(Container.DataItem, "ImageUrl") %>' alt="Food Image" class="menu-image" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="${0:F2}" />
            <asp:TemplateField HeaderText="Rating">
                <ItemTemplate>
                 <div class="rating">
    <asp:LinkButton ID="btnStar1" runat="server" CommandName="Rate" CommandArgument='<%# Eval("menuId") + ";1" %>' Text="&#9733;" CssClass="star"></asp:LinkButton>
    <asp:LinkButton ID="btnStar2" runat="server" CommandName="Rate" CommandArgument='<%# Eval("menuId") + ";2" %>' Text="&#9733;" CssClass="star"></asp:LinkButton>
    <asp:LinkButton ID="btnStar3" runat="server" CommandName="Rate" CommandArgument='<%# Eval("menuId") + ";3" %>' Text="&#9733;" CssClass="star"></asp:LinkButton>
    <asp:LinkButton ID="btnStar4" runat="server" CommandName="Rate" CommandArgument='<%# Eval("menuId") + ";4" %>' Text="&#9733;" CssClass="star"></asp:LinkButton>
    <asp:LinkButton ID="btnStar5" runat="server" CommandName="Rate" CommandArgument='<%# Eval("menuId") + ";5" %>' Text="&#9733;" CssClass="star"></asp:LinkButton>
</div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="btnOrder" runat="server" Text="order" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <style>
        /* عنوان القائمة */
        .menu-title {
            text-align: center;
            color: #FF8C00;
            margin-top: 40px;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
        }

        /* جدول القائمة */
        .menu-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .menu-table th, .menu-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .menu-table th {
            background-color: #ffa500;
        }

        /* الصور */
        .menu-image {
            width: 100px;
            height: auto;
            border-radius: 5px;
            transition: transform 0.3s ease;
        }

        .menu-image:hover {
            transform: scale(1.5);
        }

        /* التقييم (النجوم) */
        .rating {
            display: flex;
            justify-content: center;
            padding: 5px 0;
        }

        .star {
            font-size: 24px;
            color: #FFD700;
            cursor: pointer;
            transition: color 0.3s ease;
            text-decoration: none;
        }

        .star:hover {
            color: #FF4500;
        }

        footer {
            text-align: center;
            width: 100%;
            padding: 10px 0;
            font-size: 14px;
        }
    </style>
</asp:Content>