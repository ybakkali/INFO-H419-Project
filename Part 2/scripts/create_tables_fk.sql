DROP DATABASE TPC_DI CASCADE;
CREATE DATABASE IF NOT EXISTS TPC_DI;
use TPC_DI;


CREATE EXTERNAL TABLE DimBroker
(
    sk_brokerid   DECIMAL(11),
		BrokerID      DECIMAL(11),
		ManagerID     DECIMAL(11),
		FirstName     CHAR(50),
		LastName      CHAR(50),
		MiddleInitial CHAR(1),
		Branch        CHAR(50),
		Office        CHAR(50),
		Phone         CHAR(14),
		IsCurrent     BOOLEAN,
		BatchID       DECIMAL(5),
		EffectiveDate DATE,
		EndDate       DATE,

    PRIMARY KEY (sk_brokerid)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/DimBroker"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE DimCompany
(
    sk_companyid  DECIMAL(11),
    CompanyID     DECIMAL(11),
    Status        CHAR(10),
    Name          CHAR(60),
    Industry      CHAR(50),
    SPrating      CHAR(4),
    isLowGrade    BOOLEAN,
    CEO           CHAR(100),
    AddressLine1  CHAR(80),
    AddressLine2  CHAR(80),
    PostalCode    CHAR(12),
    City          CHAR(25),
    StateProv     CHAR(20),
    Country       CHAR(24),
    Description   CHAR(150),
    FoundingDate  DATE,
    IsCurrent     BOOLEAN,
    BatchID       DECIMAL(5),
    EffectiveDate DATE,
    EndDate       DATE,

    PRIMARY KEY (sk_companyid)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/DimCompany"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE DimCustomer
(
    sk_customerid        DECIMAL(11),
    CustomerID           DECIMAL(11),
    TaxID                CHAR(20),
    Status               CHAR(10),
    LastName             CHAR(30),
    FirstName            CHAR(30),
    MiddleInitial        CHAR(1),
    Gender               CHAR(1),
    Tier                 DECIMAL(1),
    DOB                  DATE,
    AddressLine1	       CHAR(80),
    AddressLine2	       CHAR(80),
    PostalCode	         CHAR(12),
    City	               CHAR(25),
    StateProv	           CHAR(20),
    Country	             CHAR(24),
    Phone1	             CHAR(30),
    Phone2	             CHAR(30),
    Phone3      	       CHAR(30),
    Email1	             CHAR(50),
    Email2	             CHAR(50),
    NationalTaxRateDesc	 CHAR(50),
    NationalTaxRate	     DECIMAL(6,5),
    LocalTaxRateDesc	   CHAR(50),
    LocalTaxRate	       DECIMAL(6,5),
    AgencyID	           CHAR(30),
    CreditRating         DECIMAL(5),
    NetWorth	           DECIMAL(10),
    MarketingNameplate   CHAR(100),
    IsCurrent            BOOLEAN,
    BatchID              DECIMAL(5),
    EffectiveDate        DATE,
    EndDate              DATE,

    PRIMARY KEY (sk_customerid)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/DimCustomer"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE DimDate
(
    sk_dateid         DECIMAL(11),
		DateValue         DATE,
		DateDesc          CHAR(20),
		CalendarYearID    DECIMAL(4),
		CalendarYearDesc  CHAR(20),
		CalendarQtrID     DECIMAL(5),
		CalendarQtrDesc   CHAR(20),
		CalendarMonthID   DECIMAL(6),
		CalendarMonthDesc CHAR(20),
		CalendarWeekID    DECIMAL(6),
		CalendarWeekDesc  CHAR(20),
		DayOfWeekDECIMAL  DECIMAL(1),
		DayOfWeekDesc     CHAR(10),
		FiscalYearID      DECIMAL(4),
		FiscalYearDesc    CHAR(20),
		FiscalQtrID       DECIMAL(5),
		FiscalQtrDesc     CHAR(20),
		HolidayFlag       BOOLEAN,

    PRIMARY KEY (sk_dateid)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/DimDate"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE DimTime
(
    sk_timeid       DECIMAL(11),
		TimeValue       STRING,
		HourID          DECIMAL(2),
		HourDesc        CHAR(20),
		MinuteID        DECIMAL(2),
		MinuteDesc      CHAR(20),
		SecondID        DECIMAL(2),
		SecondDesc      CHAR(20),
		MarketHoursFlag BOOLEAN,
		OfficeHoursFlag BOOLEAN,

    PRIMARY KEY (sk_timeid)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/DimTime"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE DImessages
(
    MessageDateAndTime  TIMESTAMP,
    BatchID             DECIMAL(5),
    MessageSource       CHAR(30),
    MessageText         CHAR(50),
    MessageType         CHAR(12),
    MessageData         CHAR(100)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/DImessages"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE Industry
(
    IN_ID     CHAR(2),
    IN_NAME   CHAR(50),
    IN_SC_ID  CHAR(4)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/Industry"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE StatusType
(
    ST_ID   CHAR(4),
    ST_NAME CHAR(10)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/StatusType"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE TaxRate
(
    TX_ID   CHAR(4),
    TX_NAME CHAR(50),
    TX_RATE DECIMAL(6,5)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/TaxRate"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE TradeType
(
    TT_ID       CHAR(3),
    TT_NAME     CHAR(12),
    TT_IS_SELL  DECIMAL(1),
    TT_IS_MRKT  DECIMAL(1)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/TradeType"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE Audit
(
    DataSet   CHAR(20),
    BatchID   DECIMAL(5),
    `Date`    DATE,
    Attribute CHAR(50),
    Value     DECIMAL(15),
    DValue    DECIMAL(16,5)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/Audit"
tblproperties ('serialization.null.format'='');



CREATE EXTERNAL TABLE DimAccount
(
    sk_accountid  DECIMAL(11),
    SK_BrokerID   DECIMAL(11),
    SK_CustomerID DECIMAL(11),
    AccountID     DECIMAL(11),
    Status        CHAR(10),
    AccountDesc   CHAR(50),
    TaxStatus     DECIMAL(1),
    IsCurrent     BOOLEAN,
    BatchID       DECIMAL(5),
    EffectiveDate DATE,
    EndDate       DATE,

    PRIMARY KEY (sk_accountid),
    FOREIGN KEY (SK_BrokerID) REFERENCES DimBroker (sk_brokerid),
    FOREIGN KEY (SK_CustomerID) REFERENCES DimCustomer (sk_customerid)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/DimAccount"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE DimSecurity
(
    sk_securityid        DECIMAL(11),
  	`Symbol`             CHAR(15),
  	Issue                CHAR(6),
  	Status               CHAR(10),
  	Name                 CHAR(70),
  	ExchangeID           CHAR(6),
  	SK_CompanyID         DECIMAL(11),
  	SharesOutstanding    DECIMAL(12),
  	FirstTrade           DATE,
  	FirstTradeOnExchange DATE,
  	Dividend             DECIMAL(10,2),
  	IsCurrent            BOOLEAN,
  	BatchID              DECIMAL(5),
  	EffectiveDate        DATE,
  	EndDate              DATE,

    PRIMARY KEY (sk_securityid),
    FOREIGN KEY (SK_CompanyID) REFERENCES DimCompany (sk_companyid)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/DimSecurity"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE DimTrade
(
    TradeID         DECIMAL(11),
		SK_BrokerID     DECIMAL(11),
		SK_CreateDateID DECIMAL(11),
		SK_CreateTimeID DECIMAL(11),
		SK_CloseDateID  DECIMAL(11),
		SK_CloseTimeID  DECIMAL(11),
		Status          CHAR(10),
		DT_Type         CHAR(12),
		CashFlag        BOOLEAN,
		SK_SecurityID   DECIMAL(11),
		SK_CompanyID    DECIMAL(11),
		Quantity        DECIMAL(6,0),
		BidPrice        DECIMAL(8,2),
		SK_CustomerID   DECIMAL(11),
		SK_AccountID    DECIMAL(11),
		ExecutedBy      CHAR(64),
		TradePrice      DECIMAL(8,2),
		Fee             DECIMAL(10,2),
		Commission      DECIMAL(10,2),
		Tax             DECIMAL(10,2),
		BatchID         DECIMAL(5),

    FOREIGN KEY (SK_BrokerID)     REFERENCES DimBroker (sk_brokerid),
    FOREIGN KEY (SK_CreateDateID) REFERENCES DimDate (sk_dateid),
    FOREIGN KEY (SK_CreateTimeID) REFERENCES DimTime (sk_timeid),
    FOREIGN KEY (SK_CloseDateID)  REFERENCES DimDate (sk_dateid),
    FOREIGN KEY (SK_CloseTimeID)  REFERENCES DimTime (sk_timeid),
    FOREIGN KEY (SK_SecurityID)   REFERENCES DimSecurity (sk_securityid),
    FOREIGN KEY (SK_CompanyID)    REFERENCES DimCompany (sk_companyid),
    FOREIGN KEY (SK_CustomerID)   REFERENCES DimCustomer (sk_customerid),
    FOREIGN KEY (SK_AccountID)    REFERENCES DimAccount (sk_accountid)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/DimTrade"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE Financial
(
    SK_CompanyID      DECIMAL(11),
    FI_YEAR           DECIMAL(4),
    FI_QTR            DECIMAL(1),
    FI_QTR_START_DATE DATE,
    FI_REVENUE        DECIMAL(15,2),
    FI_NET_EARN       DECIMAL(15,2),
    FI_BASIC_EPS      DECIMAL(10,2),
    FI_DILUT_EPS      DECIMAL(10,2),
    FI_MARGIN         DECIMAL(10,2),
    FI_INVENTORY      DECIMAL(15,2),
    FI_ASSETS         DECIMAL(15,2),
    FI_LIABILITY      DECIMAL(15,2),
    FI_OUT_BASIC      DECIMAL(12),
    FI_OUT_DILUT      DECIMAL(12),

    FOREIGN KEY (SK_CompanyID)  REFERENCES DimCompany (sk_companyid)

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/Financial"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE Prospect
(
    AgencyID            CHAR(30),
    SK_RecordDateID     DECIMAL(11),
    SK_UpDATEDateID     DECIMAL(11),
    BatchID             DECIMAL(5),
    IsCustomer          BOOLEAN,
    LastName            CHAR(30),
    FirstName           CHAR(30),
    MiddleInitial       CHAR(1),
    Gender              CHAR(1),
    AddressLine1        CHAR(80),
    AddressLine2        CHAR(80),
    PostalCode          CHAR(12),
    City                CHAR(25),
    State               CHAR(20),
    Country             CHAR(24),
    Phone               CHAR(30),
    Income              DECIMAL(9),
    NumberCars          DECIMAL(2),
    NumberChildren      DECIMAL(2),
    MaritalStatus       CHAR(1),
    Age                 DECIMAL(3),
    CreditRating        DECIMAL(4),
    OwnOrRentFlag       CHAR(1),
    Employer            CHAR(30),
    NumberCreditCards   DECIMAL(2),
    NetWorth            DECIMAL(12),
    MarketingNameplate  CHAR(100),

    PRIMARY KEY (AgencyID),
    FOREIGN KEY (SK_UpDATEDateID)  REFERENCES DimDate (sk_dateid)

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/Prospect"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE FactCashBalances
(
    SK_CustomerID DECIMAL(11),
    SK_AccountID  DECIMAL(11),
    SK_DateID     DECIMAL(11),
    Cash          DECIMAL(15,2),
    BatchID       DECIMAL(5),

    FOREIGN KEY (SK_CustomerID)   REFERENCES DimCustomer (sk_customerid),
    FOREIGN KEY (SK_AccountID)    REFERENCES DimAccount (sk_accountid),
    FOREIGN KEY (SK_DateID)       REFERENCES DimDate (sk_dateid)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/FactCashBalances"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE FactHoldings
(
    TradeID         DECIMAL(11),
    CurrentTradeID  DECIMAL(11),
    SK_CustomerID   DECIMAL(11),
    SK_AccountID    DECIMAL(11),
    SK_SecurityID   DECIMAL(11),
    SK_CompanyID    DECIMAL(11),
    SK_DateID       DECIMAL(11),
    SK_TimeID       DECIMAL(11),
    CurrentPrice    DECIMAL(8,2),
    CurrentHolding  DECIMAL(6),
    BatchID         DECIMAL(5),

    FOREIGN KEY (SK_CustomerID)   REFERENCES DimCustomer (sk_customerid),
    FOREIGN KEY (SK_AccountID)    REFERENCES DimAccount (sk_accountid),
    FOREIGN KEY (SK_SecurityID)   REFERENCES DimSecurity (sk_securityid),
    FOREIGN KEY (SK_CompanyID)    REFERENCES DimCompany (sk_companyid),
    FOREIGN KEY (SK_DateID)       REFERENCES DimDate (sk_dateid),
    FOREIGN KEY (SK_TimeID)       REFERENCES DimTime (sk_timeid)

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/FactHoldings"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE FactMarketHistory
(
    SK_SecurityID             DECIMAL(11),
    SK_CompanyID              DECIMAL(11),
    SK_DateID                 DECIMAL(11),
    PERatio                   DECIMAL(10,2),
    Yield                     DECIMAL(5,2),
    FiftyTwoWeekHigh          DECIMAL(8,2),
    SK_FiftyTwoWeekHighDate   DECIMAL(11),
    FiftyTwoWeekLow           DECIMAL(8,2),
    SK_FiftyTwoWeekLowDate    DECIMAL(11),
    ClosePrice                DECIMAL(8,2),
    DayHigh                   DECIMAL(8,2),
    DayLow                    DECIMAL(8,2),
    Volume                    DECIMAL(12),
    BatchID                   DECIMAL(5),

    FOREIGN KEY (SK_SecurityID)   REFERENCES DimSecurity (sk_securityid),
    FOREIGN KEY (SK_CompanyID)    REFERENCES DimCompany (sk_companyid),
    FOREIGN KEY (SK_DateID)       REFERENCES DimDate (sk_dateid)

)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/FactMarketHistory"
tblproperties ('serialization.null.format'='');

CREATE EXTERNAL TABLE FactWatches
(
    SK_CustomerID         DECIMAL(11),
    SK_SecurityID         DECIMAL(11),
    SK_DateID_DatePlaced  DECIMAL(11),
    SK_DateID_DateRemoved DECIMAL(11),
    BatchID               DECIMAL(5),

    FOREIGN KEY (SK_CustomerID)           REFERENCES DimCustomer (sk_customerid),
    FOREIGN KEY (SK_SecurityID)           REFERENCES DimSecurity (sk_securityid),
    FOREIGN KEY (SK_DateID_DatePlaced)    REFERENCES DimDate (sk_dateid),
    FOREIGN KEY (SK_DateID_DateRemoved)   REFERENCES DimDate (sk_dateid)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
stored as textfile
LOCATION "/data/FactWatches"
tblproperties ('serialization.null.format'='');
