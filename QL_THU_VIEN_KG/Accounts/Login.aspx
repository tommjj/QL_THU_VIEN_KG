<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Accounts_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <link rel="stylesheet" href="../Content/Site.css">

    <%--alpinejs --%>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>

    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>


        <div>
            <div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-50 to-indigo-100 p-4">
                <div class="w-full max-w-md">
                    <div class="rounded-lg border bg-card text-card-foreground shadow-lg bg-white" data-v0-t="card">
                        <div class="flex flex-col p-6 space-y-1">
                            <h3 class="tracking-tight text-2xl font-bold text-center">Đăng nhập</h3>
                            <p class="text-sm text-muted-foreground text-center">Nhập thông tin đăng nhập để truy cập hệ thống
                            </p>
                            <asp:Label ID="ErrLabel" runat="server" Text="" CssClass="text-sm text-red-700 text-center"></asp:Label>
                        </div>
                        <div class="p-6 pt-0">
                            <div class="space-y-4">
                                <div class="space-y-2">
                                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="username">Tên đăng nhập</label><div class="relative">
                                        <i class="lucide lucide-lock absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" data-lucide="user"></i>
                                        <input required="required" minlength="3" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 pl-10" id="username" placeholder="Nhập tên đăng nhập" type="text" value="" name="username" />
                                    </div>
                                </div>
                                <div class="space-y-2" x-data="{'showPass': false}">
                                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="password">Mật khẩu</label><div class="relative">
                                        <i class="lucide lucide-lock absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" data-lucide="lock"></i>
                                        <input required="required" minlength="8" x-bind:type="showPass ? 'text' : 'password'" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  pl-10 pr-10" id="password" placeholder="Nhập mật khẩu" value="" name="password" />
                                        <button x-on:click="showPass = ! showPass" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground w-10 absolute right-0 top-0 h-full px-3 py-2 hover:bg-transparent" type="button">
                                            <i x-show="!showPass" class="lucide lucide-eye h-4 w-4 text-gray-400" data-lucide="eye"></i>
                                            <i x-show="showPass" class="lucide lucide-eye h-4 w-4 text-gray-400" data-lucide="eye-off"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="flex items-center space-x-2">
                                    <input type="checkbox" id="rememberme" name="rememberme" class="peer h-4 w-4 shrink-0 rounded-sm border border-primary ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground" id="rememberMe"></input>
                                    <input aria-hidden="true" tabindex="-1" type="checkbox" value="on" style="transform: translateX(-100%); position: absolute; pointer-events: none; opacity: 0; margin: 0px; width: 16px; height: 16px;" />
                                    <label class="peer-disabled:cursor-not-allowed peer-disabled:opacity-70 text-sm font-normal" for="rememberMe">Ghi nhớ đăng nhập</label>
                                </div>

                                <asp:Button runat="server" ID="LoginButton" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full" type="submit" Text="Đăng nhập" OnClick="LoginButton_Click"/>
                                <div class="text-center">
                                    <button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 underline-offset-4 hover:underline h-10 px-4 py-2 text-sm text-blue-600 hover:text-blue-800">Quên mật khẩu?</button>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>
