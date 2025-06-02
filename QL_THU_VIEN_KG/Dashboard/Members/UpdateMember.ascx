<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UpdateMember.ascx.cs" Inherits="Dashboard_Members_UpdateMember" %>

<div x-show="$store.updateMemberModal.isShow" x-transition.opacity x-on:click="$store.updateMemberModal.cancel()" x-init="$el.classList.remove('hidden')" class="hidden fixed inset-0 z-50 bg-black/80" style="pointer-events: auto;" data-aria-hidden="true" aria-hidden="true"></div>

<div x-show="$store.updateMemberModal.isShow" x-transition role="dialog" x-init="$el.classList.remove('hidden')" x-init="$el.classList.remove('hidden')" class="hidden fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 sm:rounded-lg sm:max-w-[500px]" tabindex="-1" style="pointer-events: auto;">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="flex flex-col space-y-1.5 text-center sm:text-left">
                <h2 class="text-lg font-semibold leading-none tracking-tight">Chập nhật thành viên</h2>
                <p class="text-sm text-muted-foreground">Nhập thông tin chi tiết của thành viên.</p>
            </div>
            <div class="grid gap-3 py-4">
                 <asp:TextBox runat="server" ID="UMenberID" ClientIDMode="Static" CssClass="hidden"/>
                <div>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 mb-2" for="UMemberName">
                        Họ và tên
                    </label>
                    <asp:TextBox runat="server" ID="UMemberName" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" ClientIDMode="Static" placeholder="Nhập họ và tên" />
                    <asp:RequiredFieldValidator ValidationGroup="update-member" CssClass="text-sm text-red-800" ID="RequiredFieldValidator1" runat="server" ControlToValidate="UMemberName" ErrorMessage="tên thành viên không được bỏ trống." Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 mb-2" for="UMemberName">
                        Email
                    </label>
                    <asp:TextBox runat="server" ID="UMemberMail" ClientIDMode="Static" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" placeholder="example@email.com" />
                    <asp:Label x-ref="updateErrorMess" ID="ErrorLabel" CssClass="text-sm text-red-800" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ValidationGroup="update-member" CssClass="text-sm text-red-800" ID="RequiredFieldValidator2" runat="server" ControlToValidate="UMemberMail" ErrorMessage="email thành viên không được bỏ trống." Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationExpression="^$|^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$" ValidationGroup="update-member" CssClass="text-sm text-red-800" ID="RequiredFieldValidator3" runat="server" ControlToValidate="UMemberMail" ErrorMessage="email thành viên không hợp lệ." Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 mb-2" for="UMemberPhone">
                        Số điện thoại
                    </label>
                    <asp:TextBox runat="server" ID="UMemberPhone" ClientIDMode="Static" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" placeholder="0123456789" />
                    <asp:RequiredFieldValidator ValidationGroup="update-member" CssClass="text-sm text-red-800" ID="RequiredFieldValidator4" runat="server" ControlToValidate="UMemberPhone" ErrorMessage="số điện thoại thành viên không được bỏ trống." Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ValidationExpression="^$|^(0|\+84)[0-9]{9,10}$" ValidationGroup="update-member" CssClass="text-sm text-red-800" ID="RegularExpressionValidator1" runat="server" ControlToValidate="UMemberPhone" ErrorMessage="số điện thoại thành viên không hợp lệ." Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 mb-2" for="UMemberAddress">
                        Địa chỉ
                    </label>
                    <asp:TextBox runat="server" ID="UMemberAddress" ClientIDMode="Static" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" placeholder="Nhập địa chỉ" />
                    <asp:RequiredFieldValidator ValidationGroup="update-member" CssClass="text-sm text-red-800" ID="RequiredFieldValidator5" runat="server" ControlToValidate="UMemberAddress" ErrorMessage="địa chỉ thành viên không được bỏ trống." Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2">
                <button x-on:click="$store.updateMemberModal.cancel()" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2">
                    Hủy
                </button>
                <asp:Button runat="server" ID="UMemberBT" ValidationGroup="update-member" CssClass="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2" Text="Lưu  thành viên" OnClick="CMemberBT_Click" />
            </div>
            <button x-init="lucide.createIcons()" x-on:click="$store.updateMemberModal.cancel()" type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground">
                <i class="h-4 w-4" data-lucide="x"></i>
            </button>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>

<script>
    document.addEventListener('alpine:init', () => {
        Alpine.store('updateMemberModal', {
            id: 0,
            name: "",
            email: "",
            phone: "",
            address: "",
            get isShow() {
                return this.id !== 0;
            },
            cancel() {
                this.id = 0;
                this.name = "";
                this.email = "";
                this.phone = "";
                this.address = "";
            },
            setUpdate(id, name, email, phone, address) {
                this.id = id;
                this.name = name;
                this.email = email;
                this.phone = phone;
                this.address = address;
            }
        })
    })
</script>
