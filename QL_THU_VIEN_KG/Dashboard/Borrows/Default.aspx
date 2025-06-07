<%@ Page Title="Quản lý mượn trả" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Dashboard_Borrows_Default" %>

<%@ Register Src="~/Dashboard/Borrows/ReturnBook.ascx" TagPrefix="uc" TagName="ReturnBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <h1 class="font-bold text-2xl">Quản lý mượn trả</h1>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <uc:ReturnBook runat="server" ID="ReturnBook"/>

    <div x-data="{True: true, False: false}" class="flex-1 p-6">
        <div class="space-y-6">
            <div class="flex flex-col sm:flex-row gap-4 justify-between">
                <div class="flex gap-2 w-1/2">
                    <div x-data="searchBox" class="relative flex-1 max-w-md">
                        <i class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" data-lucide="search"></i>
                        <input @input="updateQuery" x-model="query"  x-init="query !== '' && $el.focus()" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 pl-10" placeholder="Tìm kiếm theo thành viên" value="">
                    </div>

                    <div x-data="statusSelector" class="relative ">
                        <i class="absolute right-3 translate-y-[-50%] top-1/2 size-4" data-lucide="chevron-down"></i>
                        <select x-model="status" @change="updateStatus" value="all" name="status" class="appearance-none cursor-pointer flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 min-w-[150px]">
                            <option value="all">Tất cả</option>
                            <option value="<%: Constands.BorrowStatus.Borrowed %>">Đang mượn</option>
                            <option value="<%: Constands.BorrowStatus.Overdue %>">Quá hạng</option>
                            <option value="<%: Constands.BorrowStatus.Returned %>">Đã trả</option>
                        </select>
                    </div>
                </div>

                <a href="Create.aspx" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2" type="button" aria-haspopup="dialog" aria-expanded="false" aria-controls="radix-«r12»" data-state="closed">
                    <i class="h-4 w-4 mr-2" data-lucide="plus"></i>
                    Cho mượn sách
                </a>
            </div>
            <div class="grid gap-4 md:grid-cols-3">
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" >
                    <div class="p-6 flex flex-row items-center justify-between space-y-0 pb-2">
                        <h3 class="tracking-tight text-sm font-medium">Đang mượn</h3>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="text-2xl font-bold" x-text="<%: GetBorrowedCount() %>""></div>
                        <p class="text-xs text-muted-foreground">Sách đang được mượn</p>
                    </div>
                </div>
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm">
                    <div class="p-6 flex flex-row items-center justify-between space-y-0 pb-2">
                        <h3 class="tracking-tight text-sm font-medium">Quá hạn</h3>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="text-2xl font-bold text-red-600" x-text="<%: GetOverdueBorrowedCount() %>""></div>
                        <p class="text-xs text-muted-foreground">Cần xử lý ngay</p>
                    </div>
                </div>
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                    <div class="p-6 flex flex-row items-center justify-between space-y-0 pb-2">
                        <h3 class="tracking-tight text-sm font-medium">Đã trả</h3>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="text-2xl font-bold" x-text="<%: GetReturnedBorrowedCount() %>""></div>
                        <p class="text-xs text-muted-foreground">Trong tháng này</p>
                    </div>
                </div>
            </div>
            <div class="rounded-lg border bg-card text-card-foreground shadow-sm" >
                <div class="flex flex-col space-y-1.5 p-6">
                    <h3 class="text-2xl font-semibold leading-none tracking-tight">Quản lý mượn trả (<asp:Label ID="TotalBorrow" runat="server"></asp:Label>)</h3>
                </div>
                <div class="p-6 pt-0">
                    <div dir="ltr" data-orientation="horizontal" class="w-full">
                        <div data-state="active" data-orientation="horizontal" role="tabpanel"  tabindex="0" class="ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 mt-4" style="animation-duration: 0s;">
                            <div class="relative w-full overflow-auto">
                                <table class="w-full caption-bottom text-sm">
                                    <thead class="[&amp;_tr]:border-b">
                                        <tr class="border-b transition-colors hover:bg-muted/50">
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">ID</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">Thành viên</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">Tổng sách</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">Ngày mượn</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">Hạn trả</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">Ngày trả</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">Trạng thái</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody >
                                        <asp:Repeater ID="BorrowRepeater" runat="server">
                                            <ItemTemplate>
                                                <tr class="border-b transition-colors hover:bg-muted/50">
                                                    <td class="p-4 align-middle">
                                                        <div class="flex items-center space-x-3">
                                                            <div class="font-medium"><%# Eval("ID") %></div>
                                                        </div>
                                                    </td>
                                                    <td class="p-4 align-middle">
                                                        <div class="space-y-1">
                                                            <div class="font-medium"><%# Eval("MemberName") %></div>
                                                            <div class="text-xs">ID: <%# Eval("MemberID") %></div>
                                                        </div>
                                                    </td>
                                                    <td class="p-4 align-middle">
                                                        <div class="flex items-center gap-1">
                                                            <div class="inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-1 border-gray-200/80">
                                                                <%# Eval("Quantity") %> cuốn
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="p-4 align-middle"><%# Eval("BorrowDate", "{0:dd/MM/yyyy}") %></td>
                                                    <td class="p-4 align-middle">
                                                        <div class="flex items-center gap-1">
                                                            <i class="h-3 w-3" data-lucide="calendar"></i>
                                                            <%# Eval("DueDate", "{0:dd/MM/yyyy}") %>
                                                        </div>
                                                    </td>
                                                    <td class="p-4 align-middle" ><%# Eval("ReturnDate") == null ? "Chưa trả" : Eval("ReturnDate", "{0:dd/MM/yyyy}") %></td>
                                                    <td class="p-4 align-middle">
                                                        <div x-bind:class="'<%# Eval("Status") %>' === '<%: Constands.BorrowStatus.Overdue %>' ? 'bg-destructive text-destructive-foreground hover:bg-destructive/80' : 'bg-primary text-primary-foreground hover:bg-primary/80'" class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent " >
                                                            <%# Constands.BorrowStatus.ToVietNamese(Eval("Status").ToString()) %>
                                                        </div>
                                                    </td>
                                                    <td class="p-4 align-middle">
                                                        <div class="flex space-x-2">
                                                            <a href="Details.aspx?id=<%# Eval("id") %>"  class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                                                <i class="h-3 w-3" data-lucide="eye"></i>
                                                            </a>

                                                            <button x-show="<%# Eval("ReturnDate") == null %>" @click="$store.returnBook.setReturn(<%# Eval("ID") %>, '<%# Eval("MemberName") %>')" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                                                <i class="h-3 w-3 mr-1" data-lucide="rotate-cw"></i>
                                                                Trả sách
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
                                             <div  x-show="$store.pagination.current > 1">
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
        </div>
    </div>

    <script> 
        const raw = new URLSearchParams(window.location.search).get('page');
        const parsed = parseInt(raw, 10);
        const page = !isNaN(parsed) && parsed > 0 ? parsed : 1;

        document.addEventListener('alpine:init', () => {
            Alpine.store('pagination', {
                total: <%: LoadBorrowsCount() %>,
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


            Alpine.data('statusSelector', () => ({
                status: new URLSearchParams(window.location.search).get('status') || 'all',
                updateStatus() {
                    const url = new URL(window.location.href)
                    const status = this.status.trim()
                    if (
                        status === '<%: Constands.BorrowStatus.Borrowed %>' ||
                        status === '<%: Constands.BorrowStatus.Overdue %>' ||
                        status === '<%: Constands.BorrowStatus.Returned %>') {
                        url.searchParams.set('status', this.status.trim())
                        url.searchParams.delete('page');
                    } else {
                        url.searchParams.delete('status')
                    }
                    window.location.href = url;
                }
            }));
        })
    </script>
</asp:Content>

