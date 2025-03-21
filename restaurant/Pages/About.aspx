<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="restaurant.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(to bottom right, #EFEFEF, #F9D5A7); /* مزج الرمادي الفاتح مع البيج */
        margin: 0;
        padding: 0;
        color: #333333; /* النص رمادي غامق */
    }

    .about-container {
        max-width: 900px;
        margin: 40px auto;
        background: linear-gradient(to bottom, #FFFFFF, #FFF4E0); /* تدرج أبيض وبيج فاتح */
        border-radius: 20px;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        padding: 50px 40px;
        text-align: center;
        border: 1px solid #FF8C00; /* إطار برتقالي */
    }

    .about-title {
        font-size: 32px;
        font-weight: bold;
        color: #FF8C00; /* برتقالي فاتح */
        margin-bottom: 20px;
    }

    .about-description {
        font-size: 16px;
        color: #666666; /* رمادي متوسط */
        margin-bottom: 40px;
        line-height: 1.8;
    }

    .team-section {
        margin-top: 40px;
    }

    .team-title {
        font-size: 28px;
        font-weight: bold;
        color: #FF8C00; /* نفس البرتقالي */
        margin-bottom: 20px;
    }

    .team-members {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
    }

    .team-card {
        background: linear-gradient(to bottom, #FFF8E6, #FFDABF); /* مزج بيج فاتح وبرتقالي خفيف */
        border: 1px solid #FF8C00; /* إطار برتقالي */
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: 200px;
        text-align: center;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .team-card:hover {
        transform: translateY(-10px); /* حركة للأعلى */
        box-shadow: 0 6px 15px rgba(255, 140, 0, 0.3); /* تأثير برتقالي */
    }

    .team-card h3 {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 5px;
        color: #333333; /* نص داكن */
    }

    .team-card p {
        font-size: 14px;
        color: #666666; /* رمادي متوسط */
        margin: 0;
    }

footer {
    text-align: center;
    width: 100%;
    padding: 10px 0;
    font-size: 14px;
}
</style>

<div class="about-container">
    <h1 class="about-title">About This Application</h1>
    <p class="about-description">
        Welcome to our Restaurant Management System. A seamless solution to enhance your dining experience. Explore menus, manage orders, and enjoy the best.
    </p>

    <div class="team-section">
        <h2 class="team-title">Team Members</h2>
        <div class="team-members">
            <div class="team-card">
                <h3>Helah</h3>
                <p>RefNo: 7685</p>
            </div>
            <div class="team-card">
                <h3>Teef</h3>
                <p>RefNo: 7680</p>
            </div>
            <div class="team-card">
                <h3>Khaldah</h3>
                <p>RefNo: 7846</p>
            </div>
            <div class="team-card">
                <h3>Nouf</h3>
                <p>RefNo: 7708</p>
            </div>
            <div class="team-card">
                <h3>Nourah</h3>
                <p>RefNo: 7650</p>
            </div>
        </div>
    </div>
</div>
</asp:Content>
