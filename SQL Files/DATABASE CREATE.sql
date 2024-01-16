-- CREATE DATABASE PetFinder
DROP DATABASE IF EXISTS Pet_Finder;
CREATE DATABASE Pet_Finder;
USE Pet_Finder;


-- Dimension tables
DROP TABLE IF EXISTS Dim_Type;
CREATE TABLE Dim_Type (
	Pet_Type_ID INT PRIMARY KEY IDENTITY(1,1),
	Pet_Type NVARCHAR(255)
);

DROP TABLE IF EXISTS Dim_Breed;
CREATE TABLE Dim_Breed (
	Pet_Breed_ID INT PRIMARY KEY IDENTITY(1,1),
	Pet_Breed NVARCHAR(255)
);

DROP TABLE IF EXISTS Dim_Color;
CREATE TABLE Dim_Color (
	Pet_Color_ID INT PRIMARY KEY IDENTITY(1,1),
	Pet_Color NVARCHAR(255)
);

DROP TABLE IF EXISTS Dim_MaturitySize;
CREATE TABLE Dim_MaturitySize (
	Pet_MaturitySize_ID INT PRIMARY KEY IDENTITY(1,1),
	Pet_Size NVARCHAR(255)
);

DROP TABLE IF EXISTS Dim_FurLength;
CREATE TABLE Dim_FurLength (
	Pet_Furlength_ID INT PRIMARY KEY IDENTITY(1,1),
	Pet_Furlength NVARCHAR(255)
);

DROP TABLE IF EXISTS Dim_Vaccinated;
CREATE TABLE Dim_Vaccinated (
	Pet_Vaccinated_ID INT PRIMARY KEY IDENTITY(1,1),
	Pet_Vaccinated NVARCHAR(255)
);

DROP TABLE IF EXISTS Dim_Vaccinated;
CREATE TABLE Dim_Vaccinated (
	Pet_Vaccinated_ID INT PRIMARY KEY IDENTITY(1,1),
	Pet_Vaccinated NVARCHAR(255)
);

DROP TABLE IF EXISTS Dim_Dewormed;
CREATE TABLE Dim_Dewormed (
	Pet_Dewormed_ID INT PRIMARY KEY IDENTITY(1,1),
	Pet_Dewormed NVARCHAR(255)
);

DROP TABLE IF EXISTS Dim_Sterilized;
CREATE TABLE Dim_Sterilized (
	Pet_Sterlized_ID INT PRIMARY KEY IDENTITY(1,1),
	Pet_Sterilized NVARCHAR(255)
)

DROP TABLE IF EXISTS Dim_Rescuer;
CREATE TABLE Dim_Rescuer (
    RescuerID INT PRIMARY KEY IDENTITY(1,1),
	RescuerName NVARCHAR(255)
);

DROP TABLE IF EXISTS Dim_State;
CREATE TABLE Dim_State (
    StateID INT PRIMARY KEY IDENTITY(1,1),
    StateName NVARCHAR(255)
);

-- Fact Table
DROP TABLE IF EXISTS Fact_Pet;
CREATE TABLE Fact_Pet (
    PetID INT PRIMARY KEY,
    Pet_Type_ID INT REFERENCES DIM_Type(Pet_Type_ID),
	Age INT,
	Pet_Breed1_ID INT,
	Pet_Breed2_ID INT,
	Pet_Color1_ID INT,
	Pet_Color2_ID INT,
	Pet_Color3_ID INT,
	Pet_MaturitySize_ID INT,
	Pet_FurLength_ID INT,
	Pet_Vaccinated_ID INT,
	Pet_Dewormed_ID INT,
	Pet_Sterilized_ID INT,
	Quantity INT,
    Fee INT,
	StateID INT,
	RescuerID INT,

	FOREIGN KEY (Pet_Type_ID) REFERENCES Dim_Type(Pet_Type_ID),
    FOREIGN KEY (Pet_Breed1_ID) REFERENCES Dim_Breed(Pet_Breed_ID),
	FOREIGN KEY (Pet_Breed2_ID) REFERENCES Dim_Breed(Pet_Breed_ID),
	FOREIGN KEY (Pet_Color1_ID) REFERENCES Dim_Color(Pet_Color_ID),
	FOREIGN KEY (Pet_Color2_ID) REFERENCES Dim_Color(Pet_Color_ID),
	FOREIGN KEY (Pet_Color3_ID) REFERENCES Dim_Color(Pet_Color_ID),
	FOREIGN KEY (Pet_MaturitySize_ID) REFERENCES Dim_MaturitySize(Pet_MaturitySize_ID),
	FOREIGN KEY (Pet_FurLength_ID) REFERENCES Dim_FurLength(Pet_FurLength_ID),
	FOREIGN KEY (Pet_Vaccinated_ID) REFERENCES Dim_Vaccinated(Pet_Vaccinated_ID),
	FOREIGN KEY (Pet_Dewormed_ID) REFERENCES Dim_Dewormed(Pet_Dewormed_ID),
	FOREIGN KEY (Pet_Sterilized_ID) REFERENCES Dim_Sterilized(Pet_Sterlized_ID),
    FOREIGN KEY (RescuerID) REFERENCES Dim_Rescuer(RescuerID),
    FOREIGN KEY (StateID) REFERENCES Dim_State(StateID)
);

