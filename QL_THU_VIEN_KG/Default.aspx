<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1 x-data="{ message: 'I ❤️ <%: Context.User.Identity.GetUserName() %>' }" x-text="message"></h1>
</asp:Content>
