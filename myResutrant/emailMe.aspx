<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="emailMe.aspx.cs" Inherits="restaurant.myResutrant.emailMe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br /> <br/>
<div>
    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    <asp:CheckBoxList ID="CheckBoxListType" runat="server" Height="54px" CssClass="auto-style2">
        <asp:ListItem Text="Complaint" Value="Complaint"></asp:ListItem>
        <asp:ListItem Text="Note" Value="Note"></asp:ListItem>
        <asp:ListItem Text="Suggestion" Value="Suggestion"></asp:ListItem>
    </asp:CheckBoxList>
</div>

<table border="0" class="styled-table">
    <tr><td class="auto-style1">    &nbsp;</td><td class="auto-style1">  &nbsp;</td></tr>
    <tr>
        <td style="height: 26px">From -Email</td>
        <td style="height: 26px">
            <asp:TextBox ID="txtSenderEmail" runat="server">SendeEmail</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="height: 26px">Subject</td>
        <td style="height: 26px">
            <asp:TextBox ID="txtSubject" runat="server" Width="450px" OnLoad="lblOutputClear_txtSubject"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>File Attachments:</td>
        <td>
            <asp:FileUpload ID="fuAttachment" runat="server" Enabled="true"  
                AllowMultiple="true" Width="449px" />
        </td>
    </tr>
    <tr>
        <td valign="top">Message</td>
        <td>
            <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Height="103px" 
                Width="450px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td valign="top">&nbsp;</td>
        <td>
            <asp:Button ID="btnSendMailViaMailMgr" runat="server" 
                OnClick="btnSendMailViaMailMgr_Click" Text="Send " CssClass="btn-style" />
            <asp:Button ID="btnSendViaCode" runat="server"  Text="Send email via Code" OnClick="btnSendViaCode_Click" Visible="false" CssClass="btn-style" />
        </td>
    </tr>
</table>

     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }

        .horizontal-checkbox {
            display: flex;
            justify-content: center;
            gap: 20px; /* المسافة بين الخيارات */
        }

        .horizontal-checkbox .aspNetDisabled {
            display: inline-block;
            margin-right: 5px;
        }

        table {
            margin: 50px auto;
            background-color: #fff;
            border: 1px solid #ffa500;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 600px;
            border-left: 5px solid #f15b2a;
        }

        td {
            padding: 10px;
        }

        td:first-child {
            text-align: right;
            font-weight: bold;
            color: #e67e22;
            width: 150px;
        }

        td:last-child input, 
        td:last-child textarea, 
        td:last-child .asp-fileupload {
            width: 100%;
            padding: 10px;
            border: 1px solid #e67e22;
            border-radius: 5px;
        }

        td:last-child textarea {
            resize: none;
            height: 100px;
        }

        .btn-style {
            background-color: #ffa500;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            margin-right: 10px;
            font-size: 14px;
        }

        .btn-style:hover {
            background-color: #e67e22;
        }

        #lblMsg {
            color: green;
            font-weight: bold;
            text-align: center;
            display: block;
        }

        .auto-style1 {
            height: 40px;
        }

                footer {
            text-align: center;
            width: 100%;
            padding: 10px 0;
            font-size: 14px;
        }
    </style>

</asp:Content>