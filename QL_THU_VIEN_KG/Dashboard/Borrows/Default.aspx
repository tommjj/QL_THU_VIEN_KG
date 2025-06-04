<%@ Page Title="Quản lý mượn trả" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Dashboard_Borrows_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <h1 class="font-bold text-2xl">Quản lý mượn trả</h1>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="flex-1 p-6">
        <div class="space-y-6">
            <div class="flex flex-col sm:flex-row gap-4 justify-between">
                <div class="relative flex-1 max-w-md">
                    <i class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" data-lucide="search"></i>
                    <input class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 pl-10" placeholder="Tìm kiếm theo thành viên, sách, ISBN..." value="">
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
                        <div class="text-2xl font-bold">67</div>
                        <p class="text-xs text-muted-foreground">Sách đang được mượn</p>
                    </div>
                </div>
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm">
                    <div class="p-6 flex flex-row items-center justify-between space-y-0 pb-2">
                        <h3 class="tracking-tight text-sm font-medium">Quá hạn</h3>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="text-2xl font-bold text-red-600">10</div>
                        <p class="text-xs text-muted-foreground">Cần xử lý ngay</p>
                    </div>
                </div>
                <div class="rounded-lg border bg-card text-card-foreground shadow-sm" data-v0-t="card">
                    <div class="p-6 flex flex-row items-center justify-between space-y-0 pb-2">
                        <h3 class="tracking-tight text-sm font-medium">Đã trả</h3>
                    </div>
                    <div class="p-6 pt-0">
                        <div class="text-2xl font-bold">33</div>
                        <p class="text-xs text-muted-foreground">Trong tháng này</p>
                    </div>
                </div>
            </div>
            <div class="rounded-lg border bg-card text-card-foreground shadow-sm" >
                <div class="flex flex-col space-y-1.5 p-6">
                    <h3 class="text-2xl font-semibold leading-none tracking-tight">Quản lý mượn trả (100)</h3>
                </div>
                <div class="p-6 pt-0">
                    <div dir="ltr" data-orientation="horizontal" class="w-full">
                        <div role="tablist" aria-orientation="horizontal" class="h-10 items-center justify-center rounded-md bg-gray-100/80 p-1 text-muted-foreground grid w-full grid-cols-4" tabindex="0">
                            <button type="button" role="tab" aria-selected="true" data-state="inactive"  class="inline-flex items-center justify-center whitespace-nowrap rounded-sm px-3 py-1.5 text-sm font-medium ring-offset-background transition-all focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 data-[state=active]:bg-background data-[state=active]:text-foreground data-[state=active]:shadow-sm">Tất cả (100)</button>
                            <button type="button" role="tab" aria-selected="false"  data-state="inactive"  class="inline-flex items-center justify-center whitespace-nowrap rounded-sm px-3 py-1.5 text-sm font-medium ring-offset-background transition-all focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 data-[state=active]:bg-background data-[state=active]:text-foreground data-[state=active]:shadow-sm">Đang mượn (67)</button>
                            <button type="button" role="tab" aria-selected="false"  data-state="active" class="inline-flex items-center justify-center whitespace-nowrap rounded-sm px-3 py-1.5 text-sm font-medium ring-offset-background transition-all focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 data-[state=active]:bg-background data-[state=active]:text-foreground data-[state=active]:shadow-sm" >Quá hạn (10)</button>
                            <button type="button" role="tab" aria-selected="false" " data-state="inactive" class="inline-flex items-center justify-center whitespace-nowrap rounded-sm px-3 py-1.5 text-sm font-medium ring-offset-background transition-all focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 data-[state=active]:bg-background data-[state=active]:text-foreground data-[state=active]:shadow-sm" >Đã trả (33)</button></div>
                        <div data-state="active" data-orientation="horizontal" role="tabpanel"  tabindex="0" class="ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 mt-4" style="animation-duration: 0s;">
                            <div class="relative w-full overflow-auto">
                                <table class="w-full caption-bottom text-sm">
                                    <thead class="[&amp;_tr]:border-b">
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Thành viên</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Sách</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Ngày mượn</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Hạn trả</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Ngày trả</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Trạng thái</th>
                                            <th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody class="[&amp;_tr:last-child]:border-0">
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center space-x-3"><div class="font-medium">Nguyễn Văn An</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div>
                                                    <div class="font-medium">Lập trình JavaScript</div>
                                                    <div class="text-sm text-muted-foreground font-mono">978-0123456789</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-15</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center gap-1">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-3 w-3">
                                                        <path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>2024-02-15</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">-</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-primary text-primary-foreground hover:bg-primary/80">Đang mượn</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex space-x-2">
                                                    <button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-rotate-ccw h-3 w-3 mr-1">
                                                            <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"></path><path d="M3 3v5h5"></path></svg>Trả sách</button></div>
                                            </td>
                                        </tr>
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center space-x-3"><div class="font-medium">Trần Thị Bình</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div>
                                                    <div class="font-medium">Thiết kế UI/UX</div>
                                                    <div class="text-sm text-muted-foreground font-mono">978-0123456790</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-10</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center gap-1">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-3 w-3">
                                                        <path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>2024-02-10</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">-</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-destructive text-destructive-foreground hover:bg-destructive/80 flex items-center gap-1">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-triangle-alert h-3 w-3">
                                                        <path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3"></path><path d="M12 9v4"></path><path d="M12 17h.01"></path></svg>Quá hạn 5 ngày</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex space-x-2">
                                                    <button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-rotate-ccw h-3 w-3 mr-1">
                                                            <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"></path><path d="M3 3v5h5"></path></svg>Trả sách</button></div>
                                            </td>
                                        </tr>
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center space-x-3"><div class="font-medium">Lê Văn Cường</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div>
                                                    <div class="font-medium">React và Next.js</div>
                                                    <div class="text-sm text-muted-foreground font-mono">978-0123456791</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-05</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center gap-1">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-3 w-3">
                                                        <path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>2024-02-05</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-02-03</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-secondary text-secondary-foreground hover:bg-secondary/80">Đã trả</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex space-x-2"></div>
                                            </td>
                                        </tr>
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center space-x-3">
                                                    <div class="font-medium">Phạm Thị Dung</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div>
                                                    <div class="font-medium">Python cho người mới</div>
                                                    <div class="text-sm text-muted-foreground font-mono">978-0123456792</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-20</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center gap-1">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-3 w-3">
                                                        <path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>2024-02-20</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">-</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-primary text-primary-foreground hover:bg-primary/80" data-v0-t="badge">Đang mượn</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex space-x-2">
                                                    <button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-rotate-ccw h-3 w-3 mr-1">
                                                            <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"></path><path d="M3 3v5h5"></path></svg>Trả sách</button></div>
                                            </td>
                                        </tr>
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center space-x-3">
                                                    <div class="font-medium">Thành viên 5</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div>
                                                    <div class="font-medium">Sách 5</div>
                                                    <div class="text-sm text-muted-foreground font-mono">978-0000000005</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-01</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center gap-1">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-3 w-3">
                                                        <path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>2024-02-01</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-02-01</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-secondary text-secondary-foreground hover:bg-secondary/80" data-v0-t="badge">Đã trả</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex space-x-2"></div>
                                            </td>
                                        </tr>
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center space-x-3">
                                                    <div class="font-medium">Thành viên 6</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div>
                                                    <div class="font-medium">Sách 6</div>
                                                    <div class="text-sm text-muted-foreground font-mono">978-0000000006</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-02</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center gap-1">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-3 w-3">
                                                        <path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>2024-02-02</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">-</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-primary text-primary-foreground hover:bg-primary/80" data-v0-t="badge">Đang mượn</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex space-x-2">
                                                    <button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-rotate-ccw h-3 w-3 mr-1">
                                                            <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"></path><path d="M3 3v5h5"></path></svg>Trả sách</button></div>
                                            </td>
                                        </tr>
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center space-x-3">
                                                    <div class="font-medium">Thành viên 7</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div>
                                                    <div class="font-medium">Sách 7</div>
                                                    <div class="text-sm text-muted-foreground font-mono">978-0000000007</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-03</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center gap-1">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-3 w-3">
                                                        <path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>2024-02-03</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">-</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-primary text-primary-foreground hover:bg-primary/80" data-v0-t="badge">Đang mượn</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex space-x-2">
                                                    <button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-rotate-ccw h-3 w-3 mr-1">
                                                            <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"></path><path d="M3 3v5h5"></path></svg>Trả sách</button></div>
                                            </td>
                                        </tr>
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center space-x-3">
                                                    <div class="font-medium">Thành viên 8</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div>
                                                    <div class="font-medium">Sách 8</div>
                                                    <div class="text-sm text-muted-foreground font-mono">978-0000000008</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-04</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center gap-1">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-3 w-3">
                                                        <path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>2024-02-04</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-02-04</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-secondary text-secondary-foreground hover:bg-secondary/80" data-v0-t="badge">Đã trả</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex space-x-2"></div>
                                            </td>
                                        </tr>
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center space-x-3">
                                                    <div class="font-medium">Thành viên 9</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div>
                                                    <div class="font-medium">Sách 9</div>
                                                    <div class="text-sm text-muted-foreground font-mono">978-0000000009</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-05</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center gap-1">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-3 w-3">
                                                        <path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>2024-02-05</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">-</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-primary text-primary-foreground hover:bg-primary/80" data-v0-t="badge">Đang mượn</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex space-x-2">
                                                    <button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-rotate-ccw h-3 w-3 mr-1">
                                                            <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"></path><path d="M3 3v5h5"></path></svg>Trả sách</button></div>
                                            </td>
                                        </tr>
                                        <tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center space-x-3">
                                                    <div class="font-medium">Thành viên 10</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div>
                                                    <div class="font-medium">Sách 10</div>
                                                    <div class="text-sm text-muted-foreground font-mono">978-0000000010</div>
                                                </div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">2024-01-06</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex items-center gap-1">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-3 w-3">
                                                        <path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>2024-02-06</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">-</td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent bg-primary text-primary-foreground hover:bg-primary/80" data-v0-t="badge">Đang mượn</div>
                                            </td>
                                            <td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
                                                <div class="flex space-x-2">
                                                    <button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-rotate-ccw h-3 w-3 mr-1">
                                                            <path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"></path><path d="M3 3v5h5"></path></svg>Trả sách</button></div>
                                            </td>
                                        </tr>
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
                total: 120,
                limit: 15,
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

