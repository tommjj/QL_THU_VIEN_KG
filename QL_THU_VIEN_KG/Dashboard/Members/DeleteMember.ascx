<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DeleteMember.ascx.cs" Inherits="Dashboard_Members_DeleteMember" %>

<div x-transition.opacity x-init="$el.classList.remove('hidden')" x-show="$store.deleteMember.isShow" x-on:click="$store.deleteMember.cancel()" class="hidden fixed inset-0 z-50 bg-black/80" data-aria-hidden="true" aria-hidden="true" style="pointer-events: auto;"></div>

<div x-transition x-init="$el.classList.remove('hidden')" x-show="$store.deleteMember.isShow && $store.deleteMember.canDelete" role="dialog" class="hidden fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200  sm:rounded-lg sm:max-w-[500px]" tabindex="-1" style="pointer-events: auto;">
    <div class="flex flex-col space-y-1.5 text-center sm:text-left">
        <h2 class="text-lg font-semibold leading-none tracking-tight">Xóa thành viên</h2>
        <p class="text-sm text-muted-foreground">Bạn có chắc chắn muốn xóa thành viên <strong x-text="$store.deleteMember.name"></strong>?</p>
    </div>
    <asp:TextBox runat="server" ID="DeleteMemberID" CssClass="hidden"/>
    <div class="flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2">
        <button x-on:click="$store.deleteMember.cancel()" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2">Hủy</button>

        <asp:Button runat="server" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-red-600 text-white hover:bg-red-600/90 h-10 px-4 py-2" Text="Xóa thành viên" ID="DeleteButton" OnClick="DeleteButton_Click"/>
    </div>
    <button x-init="lucide.createIcons()" x-on:click="$store.deleteMember.cancel()" type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground">
        <i class="h-4 w-4" data-lucide="x"></i>
    </button>
</div>

<div x-transition x-init="$el.classList.remove('hidden')" x-show="$store.deleteMember.isShow && ! $store.deleteMember.canDelete" role="dialog" class="hidden fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200  sm:rounded-lg sm:max-w-[500px]" tabindex="-1" style="pointer-events: auto;">
    <div class="flex flex-col space-y-1.5 text-center sm:text-left">
        <h2 class="text-lg font-semibold leading-none tracking-tight">Bạn không thể xóa thành viên</h2>
        <p class="text-sm text-muted-foreground">Bạn không thể xóa thành viên này <strong x-text="$store.deleteMember.name"></strong> do có <strong x-text="$store.deleteMember.totalBooks"></strong> sách đang mượn.</p>
    </div>

    <div class="flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2">
        <button x-on:click="$store.deleteMember.cancel()" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">Đóng</button>

    </div>
    <button x-init="lucide.createIcons()" x-on:click="$store.deleteMember.cancel()" type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground">
        <i class="h-4 w-4" data-lucide="x"></i>
    </button>
</div>

<script>
    document.addEventListener("alpine:init", () => {
        Alpine.store("deleteMember", {
            id: 0,
            name: "",
            totalBooks: 0,

            setDelete(id, name, totalBooks) {
                this.id = id;
                this.name = name;
                this.totalBooks = totalBooks;
            },
            cancel() {
                this.id = 0;
                this.name = "";
                this.description = "";
            },
            get isShow() {
                return this.id !== 0;
            },
            get canDelete() {
                return this.totalBooks === 0;
            }
        })
    })
</script>