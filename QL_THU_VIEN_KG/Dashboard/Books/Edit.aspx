<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Edit.aspx.cs" MasterPageFile="~/Site.master" Inherits="Dashboard_Books_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
     <div class="flex items-center">
         <a href="Default.aspx" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-gray-50 h-10 size-10 mr-2">
             <i data-lucide="chevron-left"></i>
         </a>
         <h1 class="font-bold text-2xl">Thông Tin Sách</h1>
     </div>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div class="space-y-4">
            <div class="w-full flex items-center justify-end gap-2">
                <asp:Button runat="server" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 cursor-pointer" Text="Lưu sách" ID="SaveButton" OnClick="SaveButton_Click" >
                </asp:Button>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                <div class="lg:col-span-2 space-y-6">
                    <div class="rounded-md border bg-card text-card-foreground shadow-sm">
                        <div class="flex flex-col space-y-1.5 p-6">
                            <h3 class="text-2xl font-semibold leading-none tracking-tight">Thông tin cơ bản</h3>
                        </div>

                        <asp:TextBox runat="server" ID="UID" CssClass="hidden"/>

                        <div class="p-6 pt-0 space-y-4">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label class="mb-2 text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="UTitle">
                                        Tên sách 
                                    </label>
                                    <asp:TextBox runat="server" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" ID="UTitle" ClientIDMode="Static" placeholder="Nhập tên sách"/>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredField1" ValidationGroup="create-book" ControlToValidate="UTitle" CssClass="text-sm text-destructive" Text="tên sách không được để tróng." Display="Dynamic"/>
                                </div>
                                <div>
                                    <label class="mb-2 text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="UAuthor">
                                        Tác giả
                                    </label>
                                    <asp:TextBox runat="server" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" id="UAuthor" ClientIDMode="Static" placeholder="Nhập tên tác giả"/>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ValidationGroup="create-book" ControlToValidate="UAuthor" CssClass="text-sm text-destructive" Text="tác giả sách không được để tróng." Display="Dynamic"/>
                                </div>
                            </div>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div >
                                    <label class="mb-2 text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="UISBN">
                                        ISBN 
                                    </label>
                                    <asp:TextBox runat="server" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" id="UISBN" ClientIDMode="Static" placeholder="978-0123456789" />
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ValidationGroup="create-book" ControlToValidate="UISBN" CssClass="text-sm text-destructive" Text="ISBN sách không được để tróng." Display="Dynamic"/>
                                    <asp:RegularExpressionValidator
                                        ID="regexISBN"
                                        runat="server"
                                        CssClass="text-sm text-destructive"
                                        ControlToValidate="UISBN"
                                        ValidationExpression="^$|^(?=[0-9X]{10}$|(?=(?:[0-9]+[-\ ]){3})[-\ 0-9X]{13}$|97[89][0-9]{10}$|(?=(?:[0-9]+[-\ ]){4})[-\ 0-9]{17}$)(?:97[89][-\ ]?)?[0-9]{1,5}[-\ ]?[0-9]+[-\ ]?[0-9]+[-\ ]?[0-9X]$"
                                        ErrorMessage="ISBN không hợp lệ (ISBN-10 hoặc ISBN-13)"
                                        Display="Dynamic" 
                                    />
                                </div>
                                <div>
                                    <label class="mb-2 text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="CGenreSelect">
                                        Thể loại 
                                    </label>
                                    <div class="relative ">
                                        <i class="absolute right-3 translate-y-[-50%] top-1/2 size-4" data-lucide="chevron-down"></i>
                                        <asp:DropDownList ClientIDMode="Static" CssClass="appearance-none cursor-pointer flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1" ID="UGenreSelect" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QL_THU_VIEN_KG %>" SelectCommand="SELECT [Name], [ID] FROM [Genres]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <label class="mb-2 text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="UDescription">Mô tả</label>
                                <asp:TextBox runat="server" CssClass="flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" ID="UDescription" ClientIDMode="Static" placeholder="Mô tả ngắn về nội dung sách" rows="4" TextMod="" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="rounded-md border bg-card text-card-foreground shadow-sm">
                        <div class="flex flex-col space-y-1.5 p-6">
                            <h3 class="text-2xl font-semibold leading-none tracking-tight">Thông tin xuất bản</h3>
                        </div>
                        <div class="p-6 pt-0 space-y-4">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label class="mb-2 text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="UPublisher">
                                        Nhà xuất bản
                                    </label>
                                    <asp:TextBox runat="server" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" ID="UPublisher" ClientIDMode="Static" placeholder="Nhập nhà xuất bản"/>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ValidationGroup="create-book" ControlToValidate="UPublisher" CssClass="text-sm text-destructive" Text="Nhà xuất bản sách không được để tróng." Display="Dynamic"/>
                                </div>
                                <div>
                                    <label class="mb-2 text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="UYear">
                                        Năm xuất bản
                                    </label>
                                    <asp:TextBox runat="server" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" ID="UYear" ClientIDMode="Static" placeholder="2025" TextMode="Number"/>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ValidationGroup="create-book" ControlToValidate="UYear" CssClass="text-sm text-destructive" Text=" Năm xuất bản sách không được để tróng." Display="Dynamic"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="rounded-md border bg-card text-card-foreground shadow-sm">
                        <div class="flex flex-col space-y-1.5 p-6">
                            <h3 class="text-2xl font-semibold leading-none tracking-tight">Thông tin kho</h3>
                        </div>
                        <div class="p-6 pt-0">
                            <div>
                                <label class="mb-2 text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="UQuantity">
                                    Số lượng
                                </label>
                                <asp:TextBox runat="server" CssClass="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50" ID="UQuantity" ClientIDMode="Static" placeholder="1" TextMode="Number" />
                                 <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ValidationGroup="create-book" ControlToValidate="UQuantity" CssClass="text-sm text-destructive" Text="Số lượng sách không được để tróng." Display="Dynamic"/>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="UQuantity" ErrorMessage="RangeValidator" MinimumValue="0" MaximumValue="2147483647" CssClass="text-sm text-destructive" Text="Số lượng sách phải trong khoảng 0 - 2,147,483,647." Type="Integer" Display="Dynamic"></asp:RangeValidator>
                                <p class="text-sm text-muted-foreground">Số lượng sách có sẵn trong thư viện</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="space-y-6">
                    <div class="rounded-md border bg-card text-card-foreground shadow-sm">
                        <div class="flex flex-col space-y-1.5 p-6">
                            <h3 class="text-2xl font-semibold leading-none tracking-tight">Ảnh bìa sách</h3>
                        </div>
                        <div class="p-6 pt-0">
                            <div x-data="imageSelector" class="space-y-4">
                                <template x-if="isShowImage">
                                    <div class="relative">
                                        <img :src="src" alt="Book cover" class="w-full aspect-[2/3] object-cover rounded-md border">
                                        <button @click="clear" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-destructive text-destructive-foreground hover:bg-destructive/90 h-10 w-10 absolute top-2 right-2" type="button">
                                            <i x-init="lucide.createIcons()" class="h-4 w-4" data-lucide="x"></i>
                                        </button>
                                    </div>
                                </template>
                                <asp:Image runat="server" ID="DefaultImage" x-show="! isShowImage" class="w-full aspect-[2/3] object-cover rounded-md border" for="UCoverUpload">
                                </asp:Image>
                                 <asp:FileUpload ID="UCoverUpload" ClientIDMode="Static" class="h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 hidden" AllowMultiple="false" accept="image/*" runat="server" />
                                <label class="peer-disabled:cursor-not-allowed peer-disabled:opacity-70 inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full cursor-pointer" for="UCoverUpload" type="button">
                                     <i class="h-4 w-4 mr-2" data-lucide="upload"></i>
                                    Chọn ảnh
                                </label>
                                  <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ValidationGroup="create-book" ControlToValidate="UCoverUpload" CssClass="text-sm text-destructive" Text="Ảnh bìa sách không được để tróng." Display="Dynamic"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('alpine:init', () => {
            Alpine.data('imageSelector', () => ({
                src: null,

                get isShowImage() {
                    return this.src !== null;
                },

                onFileChange(event) {
                    const file = event.target.files[0];
                    if (file && file.type.startsWith('image/')) {
                        const reader = new FileReader();
                        reader.onload = (e) => {
                            this.src = e.target.result;
                        };
                        reader.readAsDataURL(file);
                    } else {
                        this.src = null;
                    }
                },
                clear() {
                    this.src = null;
                    document.getElementById("UCoverUpload").value = null;;
                }
            }))
        })
    </script>
</asp:Content>
