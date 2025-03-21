<%@ Page Title="Restaurant Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="restaurant.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            color: white;
            background-image: url('https://d26e3f10zvrezp.cloudfront.net/Gallery/637572d3-489c-42c6-abb4-bafd24fb888e-576x1024.webp');
            background-size: cover;
            background-position: center;
            height: 100vh;
            overflow: hidden;
        }

        nav {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 15px;
            border-radius: 5px;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 100;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            justify-content: center;
            gap: 30px;
            margin: 0;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
        }

        .content {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100%;
            text-align: center;
        }

        .content h2 {
            font-size: 36px;
            margin: 20px 0;
        }

        .content p {
            font-size: 18px;
            max-width: 600px;
            margin: 0 auto;
        }

        footer {
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: center;
            color: white;
        }
    </style>

    <nav>
        <ul>
            <li><a href="SignUp.aspx">Sign Up</a></li>
            <li><a href="Home.aspx">Home</a></li>
            <li><a href="Customers.aspx">Customers</a></li>
            <li><a href="Orders.aspx">Orders</a></li>
            <li><a href="Menu.aspx">Menu</a></li>
            <li><a href="NotificationType.aspx">Notification Type</a></li>
            <li><a href="Reports.aspx">Reports</a></li>
        </ul>
    </nav>
    <br /><br /><br />
    <div class="content">
        <h2>Welcome to the Dashboard</h2>
        <br /><br /><br /><br /><br />
        <p>Start managing your system with ease and professionalism. Explore all available features and track progress efficiently.</p>
    </div>
</asp:Content>