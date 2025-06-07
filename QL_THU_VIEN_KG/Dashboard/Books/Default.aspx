<%@ Page Language="C#" Title="Quản lý Sách" AutoEventWireup="true" CodeFile="Default.aspx.cs" MasterPageFile="~/Site.master" Inherits="Dashboard_Books_Default" %>

<%@ Register Src="~/Dashboard/Books/Delete.ascx" TagPrefix="uc" TagName="DeleteBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <h1 class="font-bold text-2xl">Quản lý Sách</h1>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <uc:DeleteBook runat="server" ID="DeleteBook"/>

    <div class="flex-1 overflow-y-auto p-6">
        <div class="space-y-6">
            <div class="flex flex-col sm:flex-row gap-4 justify-between">
                <div x-data="searchBox" class="relative flex-1 max-w-md">
                     <i class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 h-4 w-4" data-lucide="search"></i>
                     <input x-init="query !== '' && $el.focus()" @input="updateQuery" x-model="query" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 pl-10" placeholder="Tìm kiếm sách theo tên, tác giả, ISBN..." value=""></div>
                <a href="Create.aspx" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
                    <i class="w-4 h-4" data-lucide="plus"></i>
                    Thêm sách mới
                </a>
            </div>
            
            <div class="rounded-lg border bg-card text-card-foreground shadow-sm" >
                <div class="flex flex-col space-y-1.5 p-6">
                    <h3 class="text-2xl font-semibold leading-none tracking-tight">Danh sách sách (<asp:Label runat="server" ID="TotalBook"/>)</h3>
                </div>
                <div class="p-6 pt-0">
                    <div class="relative w-full overflow-auto">
                        <table class="w-full caption-bottom text-sm">
                            <thead class="[&amp;_tr]:border-b">
                                <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                    <th class="h-12 px-2 text-left align-middle font-medium text-muted-foreground">Sách</th>
                                    <th class="h-12 px-2 text-left align-middle font-medium text-muted-foreground">Tác giả</th>
                                    <th class="h-12 px-2 text-left align-middle font-medium text-muted-foreground">Thể loại</th>
                                    <th class="h-12 px-2 text-left align-middle font-medium text-muted-foreground">Năm XB</th>
                                    <th class="h-12 px-2 text-left align-middle font-medium text-muted-foreground">Số lượng</th>
                                    <th class="h-12 px-2 text-left align-middle font-medium text-muted-foreground">Trạng thái</th>
                                    <th class="h-12 px-2 text-left align-middle font-medium text-muted-foreground">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody class="[&amp;_tr:last-child]:border-0">
                                <asp:Repeater runat="server" ID="BooksRepeater">
                                    <ItemTemplate>
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <td class="p-4 px-2 align-middle">
                                                <div class="flex items-center space-x-3">
                                                    <img alt="<%# Eval("Title") %>" class="w-10 h-12 object-cover rounded border" src="/Static/<%# Eval("CoverImage") %>"><div>
                                                        <div class="font-medium"><%# Eval("Title") %></div>
                                                        <div class="text-sm text-muted-foreground"><%# Eval("ISBN") %></div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="p-4 px-2 align-middle"><%# Eval("Author") %></td>
                                            <td class="p-4 px-2 align-middle">
                                                <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 text-foreground text-nowrap"><%# Eval("Genre.Name") %></div>
                                            </td>
                                            <td class="p-4 px-2 align-middle"><%# Eval("PublishedYear") %></td>
                                            <td class="p-4 px-2 align-middle"><span class="text-sm"><%# Eval("AvailableCopies") %>/<%# Eval("TotalCopies") %></span></td>
                                            <td class="p-4 px-2 align-middle">
                                                <div x-text="<%# Eval("AvailableCopies") %> === 0 ? 'Hết sách' : 'Có sẵn'" x-bind:class="<%# Eval("AvailableCopies") %> === 0 ? 'bg-destructive text-destructive-foreground hover:bg-destructive/80' : 'bg-primary text-primary-foreground hover:bg-primary/80'" class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent text-nowrap"></div>
                                            </td>
                                            <td class="p-4 px-2 align-middle">
                                                <div class="flex space-x-2">
                                                    <a href="Edit.aspx?id=<%# Eval("ID") %>" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10">
                                                        <i class="h-4 w-4" data-lucide="square-pen"></i>
                                                    </a>
                                                    <button type="button" x-on:click="$store.deleteBook.setDelete(<%# Eval("ID") %>, '<%# Eval("Title") %>', <%# Eval("TotalCopies") %>,  <%# Eval("AvailableCopies") %>)" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10">
                                                        <i class="h-4 w-4 text-destructive" data-lucide="trash-2"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>
                    </div>

                    <div class="mt-4">
                        <div class="flex flex-col sm:flex-row items-center justify-between gap-4 px-2">
                            <div class="flex items-center space-x-2">
                                <p class="text-sm text-muted-foreground">Hiển thị <span x-text="$store.pagination.limit * ($store.pagination.current - 1) + 1"></span> đến <span x-text="$store.pagination.limit * $store.pagination.current"></span> trong tổng số <span x-text="$store.pagination.total"></span> kết quả</p>
                            </div>
                            <div class="flex items-center space-x-6">
                                <div class="flex items-center space-x-2">
                                    <button x-on:click="$store.pagination.goToPage($store.pagination.current - 1)" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8 p-0" x-bind:disabled="! $store.pagination.canPrivPage">
                                        <i class="h-4 w-4" data-lucide="chevron-left"></i>
                                    </button>
                                     <div x-show="$store.pagination.current > 1" > 
                                        <button x-on:click="$store.pagination.goToPage(1)" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8 p-0">
                                            1
                                        </button>
                                    </div>
                                    <div>
                                        <button type="button" x-text="$store.pagination.current" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-8 w-8 p-0">
                                        </button>
                                    </div>
                                    <div x-show="$store.pagination.canGo($store.pagination.current + 1)">
                                        <button x-on:click="$store.pagination.goToPage($store.pagination.current + 1)" type="button" x-text="$store.pagination.current + 1" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8 p-0">
                                        </button>
                                    </div>
                                    <div x-show="$store.pagination.canGo($store.pagination.current + 2)">
                                        <button x-on:click="$store.pagination.goToPage($store.pagination.current + 2)" type="button" x-text="$store.pagination.current + 2" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8 p-0">
                                        </button>
                                    </div>
                                    <div x-show="$store.pagination.canGo($store.pagination.current + 4)">
                                        <span class="flex h-8 w-8 items-center justify-center">
                                            <i class="h-4 w-4" data-lucide="ellipsis"></i>
                                        </span>
                                    </div>
                                    <div x-show="$store.pagination.canGo($store.pagination.current + 3)">
                                        <button x-on:click="$store.pagination.goToPage($store.pagination.totalPage)" type="button" x-text="$store.pagination.totalPage" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8 p-0">
                                        </button>
                                    </div>
                                    <button x-on:click="$store.pagination.goToPage($store.pagination.current + 1)" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8 p-0" x-bind:disabled="! $store.pagination.canNextPage">
                                        <i class="h-4 w-4" data-lucide="chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script> 
        const raw = new URLSearchParams(window.location.search).get('page');
        const parsed = parseInt(raw, 10);
        const page = !isNaN(parsed) && parsed > 0 ? parsed : 1;

        document.addEventListener('alpine:init', () => {
            Alpine.store('pagination', {
                total: <%: GetTotalBooks() %>,
                limit: <%: PageSize %>,
                current: page,

                canGo(p) {
                    return Math.ceil(this.total / this.limit) >= p;
                },
                get canPrivPage() {
                    return this.current > 1;
                },
                get canNextPage() {
                    return this.total / this.limit > this.current;
                },
                get totalPage() {
                    return Math.ceil(this.total / this.limit);
                },
                goToPriv() {
                    const url = new URL(window.location.href)

                    url.searchParams.set("page", this.current - 1);

                    window.location.href = url;
                },
                goToNext() {
                    const url = new URL(window.location.href)

                    url.searchParams.set("page", this.current + 1);

                    window.location.href = url;
                },
                goToPage(p) {
                    const url = new URL(window.location.href)

                    url.searchParams.set("page", p);

                    window.location.href = url;
                }
            })

            Alpine.data('searchBox', () => ({
                query: new URLSearchParams(window.location.search).get('q') || '',
                timer: null,
                updateQuery() {
                    clearTimeout(this.timer)
                    this.timer = setTimeout(() => {
                        const url = new URL(window.location.href)
                        if (this.query.trim()) {
                            url.searchParams.set('q', this.query.trim())
                        } else {
                            url.searchParams.delete('q')
                        }
                        window.location.href = url;
                    }, 500)
                }
            }));
        })
    </script>
</asp:Content>
