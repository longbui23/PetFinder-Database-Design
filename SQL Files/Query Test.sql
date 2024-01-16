-- Using Database
USE Pet_Finder;
	
-- Number of Vaccinated, Dewormed, Sterilized Pet
SELECT 
	COUNT(CASE WHEN V.Pet_Vaccinated = 'Yes' THEN F.PetID ELSE NULL END) AS num_vaccinated_pet,
	COUNT(CASE WHEN D.Pet_Dewormed = 'Yes' THEN F.PetID ELSE NULL END) AS num_dewormed_pet,
	COUNT(CASE WHEN S.Pet_Sterilized = 'Yes' THEN F.PetID ELSE NULL END) AS num_sterilized_pet
FROM Fact_Pet F
LEFT JOIN Dim_Vaccinated V ON F.Pet_Vaccinated_ID = V.Pet_Vaccinated_ID
LEFT JOIN Dim_Dewormed D ON F.Pet_Dewormed_ID = D.Pet_Dewormed_ID
LEFT JOIN Dim_Sterilized S ON F.Pet_Sterilized_ID = S.Pet_Sterlized_ID

SELECT * FROM Fact_Pet

-- 2 types of Pet
SELECT
	t.Pet_Type,
	COUNT(f.Pet_Type_ID ) AS Total_Case,
	SUM(f.Quantity) AS Total_Number,
	SUM(f.Fee) AS Total_Price
FROM Fact_Pet f
LEFT JOIN Dim_Type t ON t.Pet_Type_ID = f.Pet_Type_ID
GROUP BY t.Pet_Type;

-- Types of FurLength
SELECT
	l.Pet_Furlength,
	COUNT(f.Pet_Type_ID ) AS Total_Case,
	SUM(f.Quantity) AS Total_Number,
	SUM(f.Fee) AS Total_Price
FROM Fact_Pet f
LEFT JOIN Dim_FurLength l ON l.Pet_Furlength_ID = f.Pet_FurLength_ID
GROUP BY l.Pet_Furlength;
