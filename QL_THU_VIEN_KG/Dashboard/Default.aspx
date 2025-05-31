<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Dashboard_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <h1 class="font-bold text-2xl">Dashboard</h1>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="flex-1 overflow-y-auto p-6">
        <div class="space-y-6">
            <div class="grid gap-4 grid-cols-4">
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                    <div class="p-6 flex flex-row items-center justify-between space-y-0 pb-2">
                        <h3 class="tracking-tight text-sm font-medium">Tổng số sách</h3>
                        <i class="lucide lucide-book h-4 w-4 text-blue-600" data-lucide="book"></i>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="text-2xl font-bold"><%: getTotalBookCount() %></div>
                        <p class="text-xs text-muted-foreground">+12% so với tháng trước</p>
                    </div>
                </div>
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                    <div class="p-6 flex flex-row items-center justify-between space-y-0 pb-2">
                        <h3 class="tracking-tight text-sm font-medium">Thành viên</h3>
                        <i class="lucide lucide-book h-4 w-4 text-green-600" data-lucide="users"></i>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="text-2xl font-bold"><%: getMemberCount() %></div>
                        <p class="text-xs text-muted-foreground">+8% so với tháng trước</p>
                    </div>
                </div>
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                    <div class="p-6 flex flex-row items-center justify-between space-y-0 pb-2">
                        <h3 class="tracking-tight text-sm font-medium">Đang mượn</h3>
                        <i class="lucide lucide-book h-4 w-4 text-orange-600" data-lucide="book-open"></i>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="text-2xl font-bold"><%: getBorrowedCount() %></div>
                        <p class="text-xs text-muted-foreground">Phiếu đang mượn</p>
                    </div>
                </div>
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                    <div class="p-6 flex flex-row items-center justify-between space-y-0 pb-2">
                        <h3 class="tracking-tight text-sm font-medium">Quá hạn</h3>
                        <i class="lucide lucide-book h-4 w-4 text-red-600" data-lucide="book-open"></i>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="text-2xl font-bold"><%: getOverdueBorrowedCount() %></div>
                        <p class="text-xs text-muted-foreground">Cần xử lý ngay</p>
                    </div>
                </div>
            </div>
            <div class="grid gap-4 md:grid-cols-2">
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                    <div class="flex flex-col space-y-1.5 p-6">
                        <h3 class="text-2xl font-semibold leading-none tracking-tight">Hoạt động mượn sách gần đây</h3>
                        <p class="text-sm text-muted-foreground">Danh sách các giao dịch mượn sách mới nhất</p>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="space-y-4">
                            <asp:Repeater ID="LastBorrowedRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="flex items-center justify-between">
                                        <div class="space-y-1">
                                            <p class="text-sm font-medium"><%# Eval("MemberName") %></p>
                                            <p class="text-xs text-muted-foreground">Mượn: <%# Eval("BorrowDate", "{0:dd/MM/yyyy}") %> | Hạn:  <%# Eval("DueDate", "{0:dd/MM/yyyy}") %></p>
                                        </div>
                                        <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-primary text-primary-foreground hover:bg-primary/80" data-v0-t="badge"><%# Constands.BorrowStatus.ToVietNamese(Eval("Status", "{0}")) %></div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                    <div class="flex flex-col space-y-1.5 p-6">
                        <h3 class="text-2xl font-semibold leading-none tracking-tight">Sách phổ biến</h3>
                        <p class="text-sm text-muted-foreground">Top sách được mượn nhiều nhất tháng này</p>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="space-y-4">
                            <asp:Repeater ID="TopBorrowedBooksRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="flex items-center justify-between">
                                        <div>
                                            <p class="text-sm font-medium"><%# Eval("BookName") %></p>
                                            <p class="text-xs text-muted-foreground"><%# Eval("BorrowCount") %> lượt mượn</p>
                                        </div>
                                        <div class="w-16 bg-muted rounded-full h-2">
                                            <div class="bg-primary h-2 rounded-full" runat="server" id="progressBar" style="width: 0%;"></div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
