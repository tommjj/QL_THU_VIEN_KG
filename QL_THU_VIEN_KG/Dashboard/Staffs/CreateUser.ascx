<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreateUser.ascx.cs" Inherits="Dashboard_Staffs_CreateUser" %>


<div x-show="$store.createModal.on" x-transition.opacity x-on:click="$store.createModal.toggle()" x-init="$el.classList.remove('hidden')" class="hidden fixed inset-0 z-50 bg-black/80" style="pointer-events: auto;" data-aria-hidden="true" aria-hidden="true"></div>

<div x-show="$store.createModal.on" x-transition role="dialog" x-init="$el.classList.remove('hidden')" x-init="$el.classList.remove('hidden')" class="hidden fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 sm:rounded-lg sm:max-w-[500px]" tabindex="-1" style="pointer-events: auto;">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="flex flex-col space-y-1.5 text-center sm:text-left">
                <h2 class="text-lg font-semibold leading-none tracking-tight">Thêm nhân viên mới</h2>
                <p class="text-sm text-muted-foreground">Nhập thông tin chi tiết của nhân viên mới.</p>
            </div>
            <div class="grid gap-3 py-4">
                <div>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 mb-2" for="CMemberName">
                        Tên đăng nhập
                    </label>

                    <asp:TextBox runat="server" ID="CUsername" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" ClientIDMode="Static" placeholder="Nhập Tên Đăng Nhập" />
                    <asp:RequiredFieldValidator ValidationGroup="create-user" CssClass="text-sm text-red-800" ID="RequiredFieldValidator6" runat="server" ControlToValidate="CUsername" ErrorMessage="tên đăng nhập không được bỏ trống." Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 mb-2" for="CFullName">
                        Họ và tên
                    </label>
                    <asp:TextBox runat="server" ID="CFullName" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" ClientIDMode="Static" placeholder="Nhập họ và tên" />
                    <asp:RequiredFieldValidator ValidationGroup="create-user" CssClass="text-sm text-red-800" ID="RequiredFieldValidator1" runat="server" ControlToValidate="CFullName" ErrorMessage="tên không được bỏ trống." Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 mb-2" for="UMemberName">
                        Email
                    </label>
                    <asp:TextBox runat="server" ID="CUserMail" ClientIDMode="Static" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" placeholder="example@email.com" />
                    <asp:Label x-ref="createErrorMess" ID="ErrorLabel" CssClass="text-sm text-red-800" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ValidationGroup="create-user" CssClass="text-sm text-red-800" ID="RequiredFieldValidator2" runat="server" ControlToValidate="CUserMail" ErrorMessage="email thành viên không được bỏ trống." Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationExpression="^$|^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$" ValidationGroup="create-user" CssClass="text-sm text-red-800" ID="RequiredFieldValidator3" runat="server" ControlToValidate="CUserMail" ErrorMessage="email thành viên không hợp lệ." Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 mb-2" for="CPassword">
                        Mật khẩu
                    </label>
                    <asp:TextBox runat="server" ID="CPassword" ClientIDMode="Static" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" placeholder="Nhập mật khẩu" TextMode="Password" />
                    <asp:RequiredFieldValidator ValidationGroup="create-user" CssClass="text-sm text-red-800" ID="RequiredFieldValidator4" runat="server" ControlToValidate="CPassword" ErrorMessage="mật khẩu không được bỏ trống." Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator  ID="PasswordLengthValidator" runat="server" ControlToValidate="CPassword" ValidationGroup="create-user" CssClass="text-sm text-red-800" Display="Dynamic" ErrorMessage="mật khẩu phải từ 8 đến 72 ký tự." ValidationExpression="^$|^.{8,72}$" />
                </div>
                <div>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 mb-2" for="CConfirmPassword">
                        Xác nhận mật khẩu
                    </label>
                    <asp:TextBox runat="server" ID="CConfirmPassword" TextMode="Password" ClientIDMode="Static" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" placeholder="Xác nhận lại mật khẩu" />
                    <asp:RequiredFieldValidator ValidationGroup="create-user" CssClass="text-sm text-red-800" ID="RequiredFieldValidator5" runat="server" ControlToValidate="CConfirmPassword" ErrorMessage="vui lòng xác nhận lại mật khẩu." Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ValidationGroup="create-user" runat="server" ID="CompareValidator1" Display="Dynamic" Text="Mật khẩu không khớp." CssClass="text-sm text-red-800" ControlToCompare="CPassword" ControlToValidate="CConfirmPassword" ></asp:CompareValidator>
                </div>
            </div>
            <div class="flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2">
                <button x-on:click="$store.createModal.toggle()" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2">
                    Hủy
                </button>
                <asp:Button runat="server" ID="CreateButton" ValidationGroup="create-user" CssClass="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2" Text="Thêm nhân viên" OnClick="CreateButton_Click" />
            </div>
            <button x-init="lucide.createIcons()" x-on:click="$store.createModal.toggle()" type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground">
                <i class="h-4 w-4" data-lucide="x"></i>
            </button>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>

<script>
    document.addEventListener('alpine:init', () => {
        Alpine.store('createModal', {
            on: false,

            toggle() {
                this.on = !this.on
            }
        })
    })
</script>
