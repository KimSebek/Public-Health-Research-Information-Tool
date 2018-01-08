--insert your database name below in place of DBASE, in each code block

create table [DBASE].[dbo].DataPull_ID (
	PullID int identity(10000,1) not null primary key,
	PullDate datetime,
	PullName nvarchar(1000),
	PullQuery nvarchar(MAX),
	PullType nvarchar(255),
	PullSource nvarchar(255),
	PullBy nvarchar(255),
);

create table [DBASE].[dbo].DataPull_Keyword (
	AssociatedID nvarchar(255),
	KeywordValue nvarchar(255),
	Category1 nvarchar(255),
	Category2 nvarchar(255),
	Category3 nvarchar(255),
	Category4 nvarchar(255),
	Category5 nvarchar(255),
);
create nonclustered index keywordindex on [DBASE].[dbo].DataPull_Keyword(AssociatedID);

create table [DBASE].[dbo].DataPull_Author (
	AssociatedID nvarchar(255),
	ForeName nvarchar(1000),
	LastName nvarchar(1000),
	ContributorType nvarchar(255),
	ContributorContact nvarchar(255),
	Affiliation nvarchar(MAX)
);

create table [DBASE].[dbo].DataPull_Title (
	AssociatedID nvarchar(255),
	Title nvarchar(1000),
	Journal nvarchar(500),
	PublicationDate date,
	OptionalID01 nvarchar(500),
	OptionalID02 nvarchar(500)
);
create clustered index titleindex on [DBASE].[dbo].DataPull_title(AssociatedID);

create table [DBASE].[dbo].DataPull_Text (
	AssociatedID nvarchar(255),
	NLMCategory nvarchar(255),
	Label nvarchar(255),
	AbstractText nvarchar(MAX)
);
create clustered index textindex on [DBASE].[dbo].DataPull_Text(AssociatedID);
create nonclustered index textcategoryindex on [DBASE].[dbo].DataPull_Text(NLMCategory);

create table [DBASE].[dbo].DataPull_Detail (	
	PullID int,
	AssociatedID nvarchar(255),
	ValueStore nvarchar(255),
	Note nvarchar(1000),
	PubType nvarchar(255),
	constraint DataPull_Details_FK foreign key(PullID) references DataPull_ID(PullID),
);
create clustered index detailindex on [DBASE].[dbo].DataPull_Detail(PullID);
