<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Dashboard_Members_Details" %>

<%@ Register Src="~/Dashboard/Borrows/ReturnBook.ascx" TagPrefix="uc" TagName="ReturnBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <div class="flex items-center">
        <a href="Default.aspx" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-gray-50 h-10 size-10 mr-2">
            <i data-lucide="chevron-left"></i>
        </a>
        <h1 class="font-bold text-2xl">Thông Tin Phiếu Mượn</h1>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <uc:ReturnBook runat="server" ID="ReturnBook"/>
    
    <div x-data="borrowDetail" class="grid grid-cols-1 lg:grid-cols-3 gap-8 p-4">
        <div class="lg:col-span-2 space-y-6">
            <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                <div class="flex flex-col space-y-1.5 p-6 pb-2">
                    <h3 class="text-2xl font-semibold leading-none tracking-tight flex items-center">
                        <i class="h-5 w-5 mr-2" data-lucide="user"></i>
                        Thông tin người mượn
                    </h3>
                </div>
                <div class="p-6 pt-0">
                    <div class="flex items-start space-x-4">
                        <div class="grid grid-cols-2 w-full">
                            <div class="w-full">
                                 <h3 class="font-semibold"><asp:Label runat="server" ID="MemberName"></asp:Label></h3>
                                 <span class="text-xs">ID: <asp:Label runat="server" ID="MemberID"></asp:Label></span>
                            </div>
                            <div class="w-full">
                                <div class="flex flex-col space-y-2">
                                    <div class="flex items-center text-sm">
                                        <i class="h-4 w-4 mr-2 text-gray-400" data-lucide="mail"></i>
                                        <asp:Label runat="server" ID="MemberEmail"></asp:Label>
                                    </div>
                                    <div class="flex items-center text-sm">
                                        <i class="h-4 w-4 mr-2 text-gray-400" data-lucide="phone"></i>
                                        <asp:Label runat="server" ID="MemberPhone"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                <div class="flex flex-col space-y-1.5 p-6">
                    <h3 class="text-2xl font-semibold leading-none tracking-tight flex items-center ">
                        <i class="h-5 w-5 mr-2" data-lucide="book"></i>
                        Danh sách sách mượn
                    </h3>
                </div>
                <div class="p-6 pt-0">
                    <div class="relative w-full overflow-auto">
                        <table class="w-full caption-bottom text-sm">
                            <thead class="[&amp;_tr]:border-b">
                                <tr class="border-b transition-colors hover:bg-muted/50">
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">Sách</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">Tác giả</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">Thể loại</th>
                                    <th class="h-12 px-4 align-middle font-medium text-muted-foreground text-center">Số lượng</th>
                                </tr>
                            </thead>
                            <tbody class="[&amp;_tr:last-child]:border-0">
                                <asp:Repeater runat="server" ID="BooksRepeater">
                                    <ItemTemplate>
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center space-x-3">
                                                    <img alt="<%# Eval("BookTitle") %>" class="h-16 w-10 object-cover rounded border" src="/Static/<%# Eval("BookCoverImage") %>">
                                                    <div class="space-y-1">
                                                        <div class="font-medium">
                                                            <%# Eval("BookTitle") %>
                                                        </div>
                                                        <div class="text-xs text-muted-foreground font-mono">
                                                            <%# Eval("BookISBN") %>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><%# Eval("BookAuthor") %></td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 text-foreground text-nowrap"><%# Eval("BookGenre") %></div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 text-center"><%# Eval("Quantity") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="space-y-6">
            <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                <div class="flex item-center justify-between space-y-1.5 p-6">
                    <h3 class="text-2xl font-semibold leading-none tracking-tight">Tóm tắt phiếu mượn</h3>

                     <asp:Label runat="server" ID="Status" class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent " >
                            overdue
                    </asp:Label>
                </div>
                <div class="p-6 pt-0">
                    <div class="space-y-4">
                        <div>
                            <div class="text-sm text-muted-foreground">Người mượn</div>
                            <div class="font-medium">
                                <asp:Label runat="server" ID="MemberName2"></asp:Label>
                            </div>
                        </div>
                        <div data-orientation="horizontal" role="none" class="shrink-0 bg-border h-[1px] w-full"></div>
                        <div>
                            <div class="text-sm text-muted-foreground">Tổng số đầu sách</div>
                            <div class="font-medium">
                                <asp:Label ID="MumberBook" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div>
                            <div class="text-sm text-muted-foreground">Tổng số sách mượn</div>
                            <div class="font-medium">
                                <asp:Label ID="MumberBorrowedBooks" runat="server"></asp:Label>
                                cuốn  
                            </div>
                        </div>
                        <div data-orientation="horizontal" role="none" class="shrink-0 bg-border h-[1px] w-full"></div>
                        <div>
                            <div class="text-sm text-muted-foreground">Thời gian mượn</div>
                            <div class="font-medium" >
                                <asp:Label ID="BorrowDays" runat="server"></asp:Label> ngày 
                            </div>
                        </div>
                        <div>
                            <div class="text-sm text-muted-foreground">Ngày mượn</div>
                            <div class="font-medium" >
                                <asp:Label ID="BorrowDate" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div>
                            <div class="text-sm text-muted-foreground">Ngày hẹn trả</div>
                            <div class="font-medium" >
                                 <asp:Label ID="DueDate" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-full p-4">
                    <asp:Literal  runat="server" ID="ReturnButton">
                    </asp:Literal>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        document.addEventListener('alpine:init', () => {
            Alpine.data('borrowDetail', () => ({
                True: true,
                False: false,
            }))
        })
    </script>
</asp:Content>

