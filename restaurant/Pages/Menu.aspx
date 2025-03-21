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

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  CssClass="menu-table" DataKeyNames="menuId">
        <Columns>
            <asp:BoundField DataField="menuId" HeaderText="MenuID" Visible="true" />
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <div class="image-container">
                        <img src='<%# DataBinder.Eval(Container.DataItem, "imageUrl") %>' alt="Food Image" class="menu-image" />
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="description" HeaderText="Description" />
            <asp:TemplateField HeaderText="Rating">
                <ItemTemplate>
                    <div class="rating">
                        <asp:HiddenField ID="hdnRating" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "Rating") %>' />
                        <% for (int i = 1; i <= 5; i++) { %>
                            <span class="star" data-value="<%= i %>" data-item-id='<%# DataBinder.Eval(Container.DataItem, "menuId") %>'>★</span>
                        <% } %>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #FFF8E7; /* خلفية بيج فاتح */
            margin: 0;
            padding: 20px;
        }

        .menu-title {
            text-align: center;
            color: #FF8C00; /* لون برتقالي فاتح */
            margin-top: 40px;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
        }

        .dropdown-container {
            margin-bottom: 20px;
            text-align: center;
        }

        .menu-table {
            width: 100%;
            border-collapse: collapse;
            background-color: #FFFFFF; /* خلفية بيضاء */
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .menu-table th, .menu-table td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #E0E0E0;
        }

        .menu-table th {
            background-color: #FF8C00; /* لون برتقالي */
            color: #FFFFFF;
        }

        .menu-table tr:nth-child(even) {
            background-color: #FFF4E0; /* بيج فاتح */
        }

        .menu-table tr:hover {
            background-color: #FFE5CC; /* لون مميز عند التمرير */
        }

        .image-container {
            position: relative;
            display: inline-block;
        }

        .menu-image {
            width: 100px;
            height: auto;
            border-radius: 5px;
            transition: transform 0.3s;
        }

        .image-container:hover .menu-image {
            transform: scale(1.1);
        }

        .rating {
            display: flex;
            justify-content: center;
        }

        .star {
            cursor: pointer;
            font-size: 24px;
            color: #FFD700; /* لون النجوم (ذهبي) */
            transition: color 0.2s;
        }

        .star:hover,
        .star.selected {
            color: #FF8C00; /* لون برتقالي */
        }

        footer {
            text-align: center;
            width: 100%;
            background-color: #FFF8E7;
            padding: 10px 0;
            font-size: 14px;
            color: #666666;
        }
    </style>
</asp:Content>