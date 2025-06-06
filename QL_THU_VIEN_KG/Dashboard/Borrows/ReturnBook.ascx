<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReturnBook.ascx.cs" Inherits="Dashboard_Borrows_ReturnBook" %>

<div x-transition.opacity x-init="$el.classList.remove('hidden')" x-show="$store.returnBook.isShow" x-on:click="$store.returnBook.cancel()" class="hidden fixed inset-0 z-50 bg-black/80" data-aria-hidden="true" aria-hidden="true" style="pointer-events: auto;"></div>

<div x-transition x-init="$el.classList.remove('hidden')" x-show="$store.returnBook.isShow" role="dialog" class="hidden fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200  sm:rounded-lg sm:max-w-[500px]" tabindex="-1" style="pointer-events: auto;">
    <div class="flex flex-col space-y-1.5 text-center sm:text-left">
        <h2 class="text-lg font-semibold leading-none tracking-tight">Xác nhận trả sách</h2>
        <p class="text-sm text-muted-foreground">Bạn có chắc chắn muốn xác nhận trả sách của <strong x-text="$store.returnBook.name"></strong>? Hành động này sẽ cập nhật trạng thái mượn sách và không thể hoàn tác.</p>
    </div>
    <asp:TextBox runat="server" ID="BorrowID" CssClass="hidden"/>
    <div class="flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2">
        <button x-on:click="$store.returnBook.cancel()" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2">Hủy</button>

        <asp:Button runat="server" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-amber-400 text-white hover:bg-amber-400/90 h-10 px-4 py-2 cursor-pointer" Text="Trả sách" ID="ReturnBookBtn" OnClick="ReturnBookBtn_Click" />
    </div>
    <button x-init="lucide.createIcons()" x-on:click="$store.returnBook.cancel()" type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground">
        <i class="h-4 w-4" data-lucide="x"></i>
    </button>
</div>

<script>
    document.addEventListener("alpine:init", () => {
        Alpine.store("returnBook", {
            id: 0,
            name: "",

            setReturn(id, name) {
                this.id = id;
                this.name = name;
            },
            cancel() {
                this.id = 0;
                this.name = "";
                this.description = "";
            },
            get isShow() {
                return this.id !== 0;
            },
        })
    })
</script>