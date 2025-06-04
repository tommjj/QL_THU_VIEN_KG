<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="Dashboard_Borrows_Create" %>

<%@ Register Src="~/Dashboard/Borrows/MemberSelector.ascx" TagPrefix="uc" TagName="MemberSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <div class="flex items-center">
        <a href="Default.aspx" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-gray-50 h-10 size-10 mr-2">
            <i data-lucide="chevron-left"></i>
        </a>
        <h1 class="font-bold text-2xl">Cho Mượn Sách</h1>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <uc:MemberSelector runat="server" ID="MemberSelector" />

    <div class="space-y-8 p-4">
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 space-y-6">
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                    <div class="flex flex-col space-y-1.5 p-6">
                        <h3 class="text-2xl font-semibold leading-none tracking-tight">Thông tin người mượn</h3>
                        <p class="text-sm text-muted-foreground">Chọn thành viên mượn sách</p>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="space-y-4">
                            <button @click="$store.createBorrow.toggleMemberSelector()" x-show="$store.createBorrow.member === null" type="button" class="items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground px-4 py-2 w-full h-20 border-dashed flex flex-col">
                                <i class="h-6 w-6 mb-2" data-lucide="user"></i>
                                <span>Chọn thành viên</span>
                            </button>

                            <div x-show="$store.createBorrow.member !== null" class="flex items-center justify-between border rounded-lg p-4">
                                <div class="flex items-center space-x-4">
                                    <div>
                                        <div class="font-medium" x-text="$store.createBorrow.member.name">Phạm Thị Dung</div>
                                        <div class="text-sm text-muted-foreground" x-text="$store.createBorrow.member.email">dung.pham@email.com</div>
                                    </div>
                                </div>
                                <div class="flex items-center space-x-2">
                                    <button @click="$store.createBorrow.toggleMemberSelector()" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                        Thay đổi
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                    <div class="space-y-1.5 p-6 flex flex-row items-center justify-between">
                        <div>
                            <h3 class="text-2xl font-semibold leading-none tracking-tight">Danh sách sách mượn</h3>
                            <p class="text-sm text-muted-foreground">Chọn sách và số lượng muốn mượn</p>
                        </div>
                        <button @click="$store.createBorrow.toggleBooksSelecetor()" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
                            <i  class="h-4 w-4 mr-2" data-lucide="plus"></i>
                            Thêm sách
                        </button>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="relative w-full overflow-auto">
                            <div x-show="$store.createBorrow.books === null || $store.createBorrow.books.length === 0" class="text-center py-8">
                                <i class="h-12 w-12 mx-auto text-gray-300" data-lucide="book"></i>
                                <h3 class="mt-2 text-sm font-medium text-gray-900">Chưa có sách nào được chọn</h3>
                                <p class="mt-1 text-sm text-gray-500">Bắt đầu bằng cách thêm sách vào phiếu mượn.</p>
                                <div class="mt-6">
                                    <button @click="$store.createBorrow.toggleBooksSelecetor()" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
                                        <i  class="h-4 w-4 mr-2" data-lucide="plus"></i>
                                        Thêm sách
                                    </button>
                                </div>
                            </div>

                            <table x-show="$store.createBorrow.books.length > 0" class="w-full caption-bottom text-sm">
                                <thead class="[&amp;_tr]:border-b">
                                    <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                        <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
                                            Sách
                                        </th>
                                        <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
                                            Tác giả
                                        </th>
                                        <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">
                                            Thể loại
                                        </th>
                                        <th class="h-12 px-4 align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0 text-center">
                                            Số lượng
                                        </th>
                                        <th class="h-12 px-4 align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0 text-right">
                                            Thao tác
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="[&amp;_tr:last-child]:border-0">
                                      <template x-for="book in $store.createBorrow.books">
                                          <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                              <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                  <div class="flex items-center space-x-3">
                                                      <img x-bind:alt="book.title" class="h-12 w-8 object-cover rounded border" x-bind:src="'/Static/' + book.coverImage"><div>
                                                          <div class="font-medium" x-text="book.title"></div>
                                                          <div class="text-xs text-muted-foreground" x-text="book.isbn"></div>
                                                          <input aria-hidden="true" type="text" name="books" class="hidden" x-bind:value="book.id + ':' + book.quantity">
                                                      </div>
                                                  </div>
                                              </td>
                                              <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0" x-text="book.author"></td>
                                              <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                  <div x-text="book.genreName" class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 text-foreground">
                                                  </div>
                                              </td>
                                              <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                  <div class="flex items-center justify-center">
                                                      <button x-bind:disabled="book.quantity <= 1" @click="$store.createBorrow.decrQuantity(book.id)" type="button" class="select-none inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8">
                                                          -
                                                      </button>
                                                      <span class="w-10 text-center" x-text="book.quantity"></span>
                                                      <button x-bind:disabled="book.quantity >= book.maxQuantity" @click="$store.createBorrow.incrQuantity(book.id)" type="button" class="select-none inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8">
                                                          +
                                                      </button>
                                                  </div>
                                              </td>
                                              <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 text-right">
                                                  <button @click="$store.createBorrow.removeBook(book.id)" x-init="lucide.createIcons()" type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent h-10 w-10 text-red-500 hover:text-red-700">
                                                      <i class="h-4 w-4" data-lucide="trash-2"></i>
                                                  </button>
                                              </td>
                                          </tr>
                                      </template>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                    <div class="flex flex-col space-y-1.5 p-6">
                        <h3 class="text-2xl font-semibold leading-none tracking-tight">Thông tin mượn trả</h3>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div class="space-y-2">
                                <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="borrowDate">
                                    Ngày mượn 
                                </label>
                                <div class="relative w-full">
                                    <i class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" data-lucide="calendar"></i>
                                    <input class="flex h-10  min-w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 pl-10" id="borrowDate" required="" type="date" value="2025-06-04">
                                </div>
                            </div>
                            <div class="space-y-2">
                                <label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="dueDate">
                                    Ngày hẹn trả 
                                </label>
                                <div class="relative w-full">
                                    <i class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" data-lucide="calendar"></i>
                                    <input class="flex h-10 min-w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 pl-10" id="dueDate" required="" type="date" value="2025-07-02">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="space-y-6">
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                    <div class="flex flex-col space-y-1.5 p-6">
                        <h3 class="text-2xl font-semibold leading-none tracking-tight">Tóm tắt phiếu mượn</h3>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="space-y-4">
                            <div>
                                <div class="text-sm text-muted-foreground">Người mượn</div>
                                <div class="font-medium" x-show="$store.createBorrow.member" x-text="$store.createBorrow.member.name"></div>
                            </div>
                            <div data-orientation="horizontal" role="none" class="shrink-0 bg-border h-[1px] w-full"></div>
                            <div>
                                <div class="text-sm text-muted-foreground">Tổng số đầu sách</div>
                                <div class="font-medium" x-text="$store.createBorrow.books.length + ' đầu sách'">2 </div>
                            </div>
                            <div>
                                <div class="text-sm text-muted-foreground">Tổng số sách mượn</div>
                                <div class="font-medium" x-text="$store.createBorrow.books.reduce((s, b) => b.quantity + s, 0)">4 cuốn</div>
                            </div>
                            <div data-orientation="horizontal" role="none" class="shrink-0 bg-border h-[1px] w-full"></div>
                            <div>
                                <div class="text-sm text-muted-foreground">Thời gian mượn</div>
                                <div class="font-medium">28 ngày</div>
                            </div>
                            <div>
                                <div class="text-sm text-muted-foreground">Ngày mượn</div>
                                <div class="font-medium">2025-06-04</div>
                            </div>
                            <div>
                                <div class="text-sm text-muted-foreground">Ngày hẹn trả</div>
                                <div class="font-medium">2025-07-02</div>
                            </div>
                        </div>
                    </div>
                    <div class="flex items-center p-6 pt-0">
                        <asp:Button runat="server" ID="CreateButton" Text="Tạo phiếu mượn" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full" OnClick="CreateButton_Click">
                        </asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        /**
            member {
                id: number,
                name: string,
                email: string,
            }
        */

        /**
             book: {
                 id: number,
                 title: string,
                 isbn: string,
                 author: string,
                 coverImage: string,
                 genreName: string,
                 quantity: number,
                 maxQuantity: number
             }
        */

        document.addEventListener('alpine:init', () => {
            Alpine.store('createBorrow', {
                member: null,

                setMember(id, name, email) {
                    this.member = {
                        id,
                        name,
                        email
                    }
                },

                removeMember() {
                    this.member = null;
                },

                books: [
                    {
                        id: 1,
                        title: "Lao hac",
                        isbn: "987-123456789",
                        author: "author name",
                        genreName: "genre name",
                        coverImage: "15cc7d90-6b44-4820-984f-422b2fc2a2eb.jpg",
                        quantity: 1,
                        maxQuantity: 10,
                    }
                ],

                addBook(id, title, isbn, author, coverImage, genreName, quantity, maxQuantity) {
                    const isAdded = this.books.find((b) => b.id === id);

                    if (isAdded) {
                        this.incrQuantity(id);
                        return;
                    }

                    this.books.push({
                        id,
                        title,
                        isbn,
                        author,
                        coverImage,
                        genreName,
                        quantity,
                        maxQuantity
                    });
                },

                incrQuantity(id) {
                    const book = this.books.find(b => b.id === id);
                    if (book && book.maxQuantity > book.quantity) {
                        book.quantity++;
                    }
                },

                decrQuantity(id) {
                    const book = this.books.find(b => b.id === id);
                    if (book && book.quantity > 1) {
                        book.quantity--;
                    }
                },

                removeBook(id) {
                    this.books = this.books.filter(book => book.id !== id);
                },

                isMemberSelectorOpen: false,
                toggleMemberSelector() {
                    this.isMemberSelectorOpen = ! this.isMemberSelectorOpen;
                },

                isBooksSelecetorOpen: false,
                toggleBooksSelecetor()  {
                    this.isBooksSelecetorOpen = !this.isBooksSelecetorOpen;
                },
            })
        })
    </script>
</asp:Content>

