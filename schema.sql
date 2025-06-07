CREATE TABLE [dbo].[Users] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [Username]     NVARCHAR (50)  NOT NULL,
    [PasswordHash] NVARCHAR (255) NOT NULL,
    [FullName]     NVARCHAR (100) NOT NULL,
    [Email]        NVARCHAR (100) NOT NULL,
    [Role]         NVARCHAR (50)  NOT NULL,
    [CreatedAt]    DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([Username] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC)
);

GO

CREATE TABLE [dbo].[Members] (
    [ID]        INT            IDENTITY (1, 1) NOT NULL,
    [FullName]  NVARCHAR (100) NOT NULL,
    [Email]     NVARCHAR (100) NOT NULL,
    [Phone]     NVARCHAR (20)  NULL,
    [Address]   NVARCHAR (255) NULL,
    [CreatedAt] DATETIME       DEFAULT (getdate()) NULL,
    [DeletedAt] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC)
);

GO

CREATE TABLE [dbo].[Genres] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (100) NOT NULL,
    [Description] NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([Name] ASC)
);

GO

CREATE TABLE [dbo].[Books] (
    [ID]              INT            IDENTITY (1, 1) NOT NULL,
    [Title]           NVARCHAR (255) NOT NULL,
    [Author]          NVARCHAR (100) NOT NULL,
    [Description]     NTEXT          NULL,
    [CoverImage]      TEXT           NULL,
    [ISBN]            NVARCHAR (20)  NOT NULL,
    [Publisher]       NVARCHAR (100) NOT NULL,
    [PublishedYear]   INT            NULL,
    [GenreID]         INT            NOT NULL,
    [TotalCopies]     INT            DEFAULT ((0)) NULL,
    [AvailableCopies] INT            DEFAULT ((0)) NULL,
    [CreatedAt]       DATETIME       DEFAULT (getdate()) NULL,
    [DeletedAt]       DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    UNIQUE NONCLUSTERED ([ISBN] ASC),
    FOREIGN KEY ([GenreID]) REFERENCES [dbo].[Genres] ([ID]),
    CHECK ([PublishedYear] > (0)),
    CHECK ([TotalCopies] >= (0)),
    CHECK ([AvailableCopies] >= (0))
);

GO

CREATE TABLE [dbo].[BorrowDetails] (
    [BorrowID] INT NOT NULL,
    [BookID]   INT NOT NULL,
    [Quantity] INT NOT NULL,
    CONSTRAINT [PK_BorrowDetails] PRIMARY KEY CLUSTERED ([BorrowID] ASC, [BookID] ASC),
    FOREIGN KEY ([BookID]) REFERENCES [dbo].[Books] ([ID]),
    FOREIGN KEY ([BorrowID]) REFERENCES [dbo].[BorrowRecords] ([ID]),
    CHECK ([Quantity]>(0))
);

GO

CREATE TABLE [dbo].[BorrowRecords] (
    [ID]         INT           IDENTITY (1, 1) NOT NULL,
    [MemberID]   INT           NOT NULL,
    [UserID]     INT           NOT NULL,
    [BorrowDate] DATETIME      DEFAULT (getdate()) NULL,
    [DueDate]    DATETIME      NULL,
    [ReturnDate] DATETIME      NULL,
    [Status]     NVARCHAR (50) DEFAULT ('borrowed') NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([MemberID]) REFERENCES [dbo].[Members] ([ID]),
    FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([ID])
);