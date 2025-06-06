<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookSelector.ascx.cs" Inherits="Dashboard_Borrows_BookSelector" %>

<div x-show="$store.createBorrow.isBooksSelecetorOpen" x-transition.opacity x-on:click="$store.createBorrow.toggleBooksSelecetor()" x-init="$el.classList.remove('hidden')" class="hidden fixed inset-0 z-50 bg-black/80" style="pointer-events: auto;" data-aria-hidden="true" aria-hidden="true"></div>

<div x-show="$store.createBorrow.isBooksSelecetorOpen" role="dialog" x-transition x-init="$el.classList.remove('hidden')" class="hidden fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 sm:rounded-lg sm:max-w-[85vw] lg:max-w-[80vw]" tabindex="-1" style="pointer-events: auto;">
    <div class="flex flex-col space-y-1.5 text-center sm:text-left">
        <h2 class="text-lg font-semibold leading-none tracking-tight">Chọn sách</h2>
        <p class="text-sm text-muted-foreground">Tìm kiếm và chọn sách để thêm vào phiếu mượn</p>
    </div>

    <asp:UpdatePanel runat="server" ID="UpdatePanel">
        <ContentTemplate>
            <div class="flex gap-2 w-full">
                <div class="relative flex-1" x-init="lucide.createIcons()">
                    <i class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" data-lucide="search"></i>
                    <asp:TextBox runat="server" ID="SearchTextBox" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 pl-10" placeholder="Tìm kiếm theo tên sách, tác giả, ISBN..." />
                    <asp:TextBox runat="server" ID="CurrentSearchValue" class="hidden" aria-hidden="true" />
                </div>
                <asp:Button runat="server" CssClass="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2" ID="SearchBtn" Text="Tìm" OnClick="SearchBtn_Click" />
            </div>
            <div class="max-h-[360px] h-[360px] overflow-y-auto">
                <div class="relative w-full overflow-auto">
                    <table class="w-full caption-bottom text-sm">
                        <thead class="[&amp;_tr]:border-b">
                            <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">
                                    Sách
                                </th>
                                <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">
                                    Tác giả
                                </th>
                                <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">
                                    Thể loại
                                </th>
                                <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">
                                    Có sẵn
                                </th>
                                <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground">

                                </th>
                            </tr>
                        </thead>
                        <tbody class="[&amp;_tr:last-child]:border-0">
                            <asp:Repeater runat="server" ID="BooksRepeater">
                                <ItemTemplate>
                                      <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                          <td class="p-4 align-middle">
                                              <div class="flex items-center space-x-3">
                                                  <img alt="<%# Eval("Title") %>" class="h-12 w-8 object-cover rounded border" src="/Static/<%# Eval("CoverImage") %>">
                                                  <div>
                                                      <div class="font-medium"><%# Eval("Title") %></div>
                                                      <div class="text-xs text-muted-foreground"><%# Eval("ISBN") %></div>
                                                  </div>
                                              </div>
                                          </td>
                                          <td class="p-4 align-middle"><%# Eval("Author") %></td>
                                          <td class="p-4 align-middle">
                                              <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 text-foreground">
                                                  <%# Eval("Genre.Name") %>
                                              </div>
                                          </td>
                                          <td class="p-4 align-middle">
                                              <div x-bind:class="<%# Eval("AvailableCopies") %> === 0 ? 'bg-destructive text-destructive-foreground hover:bg-destructive/80' : 'bg-primary text-primary-foreground hover:bg-primary/80'" class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent">
                                                  <%# Eval("AvailableCopies") %>/<%# Eval("TotalCopies") %>
                                              </div>
                                          </td>
                                          <td class="p-4 align-middle">
                                              <button x-bind:disabled="<%# Eval("AvailableCopies") %> === 0" @click="$store.createBorrow.addBook(<%# Eval("ID") %>, '<%# Eval("Title") %>', '<%# Eval("ISBN") %>', '<%# Eval("Author") %>', '<%# Eval("CoverImage") %>', '<%# Eval("Genre.Name") %>', 1, <%# Eval("AvailableCopies") %>) " type="button" class="flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground px-2 py-2 w-full  border-dashed">
                                                  <i class="h-4 w-4 mr-1" data-lucide="plus"></i>
                                                  Thêm
                                              </button>
                                          </td>
                                      </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="flex flex-row justify-between space-x-2">
                <div class="flex items-center">
                    <div class="flex items-center justify-center">
                        <button type="button" class="relative select-none inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8">
                            <i class="size-4" data-lucide="chevron-left"></i>
                            <asp:Button runat="server" ID="PrivPage" CssClass="absolute inset-0 z-10" OnClick="PrivPage_Click" />
                        </button>
                        <div class="flex items-center px-2 space-x-1">
                            <asp:Label runat="server" ID="CurrentPageLabel" />
                            <span>/</span>
                            <asp:Label runat="server" ID="MaxPage" />
                        </div>
                        <button type="button" class="relative select-none inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8">
                            <i class="size-4" data-lucide="chevron-right"></i>
                            <asp:Button runat="server" ID="NextPage" CssClass="absolute inset-0 z-10" OnClick="NextPage_Click" />
                        </button>
                    </div>
                </div>

                <button x-on:click="$store.createBorrow.toggleBooksSelecetor()" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2">
                    Đóng
                </button>
            </div>
            <button x-on:click="$store.createBorrow.toggleBooksSelecetor()" type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground">
                <i class="h-4 w-4" data-lucide="x"></i>
            </button>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
