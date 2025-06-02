<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreateGenre.ascx.cs" Inherits="Dashboard_Genres_CreateGenre" %>


<div x-transition.opacity x-init="$el.classList.remove('hidden')" x-show="showCreateModal" x-on:click="toggleCreateModal()" class="hidden fixed inset-0 z-50 bg-black/80" data-aria-hidden="true" aria-hidden="true" style="pointer-events: auto;"></div>

<div x-transition x-init="$el.classList.remove('hidden')" x-show="showCreateModal" role="dialog" class="hidden fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200  sm:rounded-lg sm:max-w-[500px]" tabindex="-1" style="pointer-events: auto;">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="flex flex-col space-y-1.5 text-center sm:text-left">
                <h2 class="text-lg font-semibold leading-none tracking-tight">Thêm thể loại mới</h2>
                <p class="text-sm text-muted-foreground">Tạo thể loại sách mới cho thư viện.</p>
            </div>
            <div class="grid gap-2 py-4">
                <div>
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 mb-2" for="CGenrenameIp">Tên thể loại</label>
                    <asp:TextBox runat="server" ID="CGenrename" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 " placeholder="Nhập tên thể loại" />
                    <asp:Label x-ref="createErrorMess" ID="ErrorLabel" CssClass="text-sm text-red-800" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ValidationGroup="create-genre" CssClass="text-sm text-red-800" ID="RequiredFieldValidator1" runat="server" ControlToValidate="CGenrename" ErrorMessage="tên thể loại không được bỏ trống" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="space-y-2">
                    <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="CGenredescription">Mô tả</label>
                    <asp:TextBox runat="server" ID="CGenredescription" CssClass=" flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" placeholder="Mô tả ngắn về thể loại sách" TextMode="MultiLine" />
                </div>
            </div>
            <div class="flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2">
                <button x-on:click="toggleCreateModal()" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2">Hủy</button>

                <asp:Button ValidationGroup="create-genre" runat="server" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2" Text="Thêm thể loại" ID="CreateButton" OnClick="CreateButton_Click" />
            </div>
            <button x-init="lucide.createIcons()" x-on:click="toggleCreateModal()" type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground">
                <i class="h-4 w-4" data-lucide="x"></i>
            </button>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>

