<%@ Page Title="Quản lý thể loại" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Dashboard_Genres_Default" %>

<%@ Register Src="~/Dashboard/Genres/CreateGenre.ascx" TagPrefix="uc" TagName="CreateGenre" %>
<%@ Register Src="~/Dashboard/Genres/UpdateGenre.ascx" TagPrefix="uc" TagName="UpdateGenre" %>
<%@ Register Src="~/Dashboard/Genres/DeleteGenre.ascx" TagPrefix="uc" TagName="DeleteGenre" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <h1 class="font-bold text-2xl">Quản lý thể loại</h1>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main x-data="{
        showCreateModal: false,
        toggleCreateModal() {
            this.showCreateModal = !this.showCreateModal;
        }
    }"
        xmlns:x="http://www.w3.org/1999/xhtml"
        class="flex-1 overflow-y-auto p-6"
    >
        <uc:CreateGenre ID="CreateGenre" runat="server" />
        <uc:UpdateGenre ID="UpdateGenre" runat="server"/>
        <uc:DeleteGenre ID="DeleteGenre" runat="server"/>

        <div class="space-y-6">
            <div class="flex flex-col sm:flex-row gap-4 justify-between">
                <div x-data="searchBox" class="relative flex-1 max-w-md">
                    <i class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" data-lucide="search"></i>
                    <input
                        x-model="query"
                        x-init="query !== '' && $el.focus()"
                        @input="updateQuery"
                        class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 pl-10" placeholder="Tìm kiếm thể loại..." value="" />
                </div>
                
                <button @click="toggleCreateModal()" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2" type="button" aria-haspopup="dialog" aria-expanded="false" aria-controls="radix-«r1b»" data-state="closed">
                    <i class="h-4 w-4 mr-2" data-lucide="plus"></i>
                    Thêm thể loại mới
                </button>
            </div>
            <div class="rounded-lg border bg-card text-card-foreground shadow-sm">
                <div class="flex flex-col space-y-1.5 p-6">
                    <h3 class="text-2xl font-semibold leading-none tracking-tight">Danh sách thể loại (<asp:Label runat="server" ID="GenresCount" />)</h3>
                </div>
                <div class="p-6 pt-0">
                    <div class="relative w-full overflow-auto">
                        <table class="w-full caption-bottom text-sm">
                            <thead class="[&amp;_tr]:border-b">
                                <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Tên thể loại</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Mô tả</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Số lượng sách</th>
                                    <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody class="[&amp;_tr:last-child]:border-0">
                                 <asp:Repeater ID="GenresRepeater" runat="server">
                                     <ItemTemplate>
                                         <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                             <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                 <div class="flex items-center space-x-3">
                                                     <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent hover:bg-primary/80 bg-blue-100 text-blue-800"><%# Eval("Name") %></div>
                                                 </div>
                                             </td>
                                             <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 max-w-xs truncate"><%# Eval("Description") %></td>
                                             <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                 <div class="flex items-center space-x-2">
                                                     <i class="h-4 w-4" data-lucide="book"></i>
                                                     <span><%# Eval("BookCount") %></span>
                                                 </div>
                                             </td>
                                             <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                 <div class="flex space-x-2">
                                                     <button type="button" x-on:click="$store.updatdeGenre.setUpdate(<%# Eval("ID") %>, '<%# Eval("Name") %>', '<%# Eval("Description") %>')" class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                                         <i class="mr-1 h-4 w-4" data-lucide="square-pen"></i>
                                                         Sửa
                                                     </button>
                                                     <button type="button"  x-on:click="$store.deleteGenre.setDelete(<%# Eval("ID") %>, '<%# Eval("Name") %>', <%# Eval("BookCount") %>)" class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3 text-red-600">
                                                         <i class="h-4 w-4 mr-1" data-lucide="book-x"></i>
                                                         Xóa
                                                     </button>
                                                 </div>
                                             </td>
                                         </tr>
                                     </ItemTemplate>
                                 </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
        document.addEventListener('alpine:init', () => {
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
        });
    </script>
</asp:Content>
