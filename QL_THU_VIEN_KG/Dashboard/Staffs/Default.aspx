<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Dashboard_Staffs_Default" %>

<%@ Register Src="~/Dashboard/Staffs/CreateUser.ascx" TagPrefix="uc" TagName="CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <h1 class="font-bold text-2xl">Quản lý Nhân Viên</h1>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <uc:CreateUser ID="CreateUser" runat="server"/>

    <main class="flex-1 p-6">
        <div class="space-y-6">
            <div class="flex flex-col sm:flex-row gap-4 justify-between">
                <div  x-data="searchBox" class="relative flex-1 max-w-md">
                    <i class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" data-lucide="search"></i>
                    <input
                        x-model="query"
                        x-init="query !== '' && $el.focus()"
                        @input="updateQuery"
                        class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 pl-10" placeholder="Tìm kiếm nhân viên theo tên, email..." value=""
                        />
                </div>
                <button x-on:click="$store.createModal.toggle()" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2" type="button" aria-haspopup="dialog" aria-expanded="false" aria-controls="radix-«rn»" data-state="closed">
                    <i class="h-4 w-4 mr-2" data-lucide="plus"></i>
                    Thêm nhân viên 
                </button>
            </div>

            <div class="rounded-lg border bg-card text-card-foreground shadow-sm">
                <div class="flex flex-col space-y-1.5 p-6">
                    <h3 class="text-2xl font-semibold leading-none tracking-tight">Danh sách thành viên (<asp:Label runat="server" ID="TotalStaffs" />)</h3>
                </div>
                <div class="p-6 pt-0">
                    <div class="relative w-full overflow-auto">
                        <table class="w-full caption-bottom text-sm">
                            <thead class="[&amp;_tr]:border-b">
                                <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Nhân viên</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Liên hệ</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Role</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Ngày tạo</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody class="[&amp;_tr:last-child]:border-0">
                                    <asp:Repeater ID="StaffsRepeater" runat="server">
                                            <ItemTemplate>
                                                <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                                    <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                        <div class="flex items-center space-x-3">
                                                            <div>
                                                                <div class="font-medium"><%# Eval("FullName") %></div>
                                                                <div class="text-sm text-muted-foreground">ID: <%# Eval("ID") %></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                        <div class="space-y-1">
                                                            <div class="flex items-center text-sm">
                                                                <i class="h-3 w-3 mr-1" data-lucide="mail"></i>
                                                                <%# Eval("Email") %>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="p-4 align-middle"><%# Eval("Role") %></td>
                                                    <td class="p-4 align-middle"><%# Eval("CreatedAt", "{0:dd/MM/yyyy}") %></td>
                                                   
                                                    <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                        <div class="flex space-x-2">
                                                            
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
                                     <div x-show="$store.pagination.current > 1">
                                        <button x-on:click="$store.pagination.goToPage(1)" type="button"  class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8 p-0">
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
                                    <div  x-show="$store.pagination.canGo($store.pagination.current + 3)">
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
    </main>

    <script> 
        const raw = new URLSearchParams(window.location.search).get('page');
        const parsed = parseInt(raw, 10);
        const page = !isNaN(parsed) && parsed > 0 ? parsed : 1;

        document.addEventListener('alpine:init', () => {
            Alpine.store('pagination', {
                total:  <%: GetTotalUser() %>,
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
