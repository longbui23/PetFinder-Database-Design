-- Using Database
USE Pet_Finder;

SELECT * FROM Fact_Pet

-- 1) Dogs vs Cats
SELECT
	T.Pet_Type,
	COUNT(F.PetID ) AS Total_Case,
	SUM(F.Quantity) AS Total_Number,
	AVG(F.Fee)/AVG(F.Quantity) AS Average_Price,
	MAX(F.age)/AVG(F.Quantity) AS maximum_age,
	MIN(F.age)/AVG(F.Quantity) AS minimum_age,
	ROUND(COUNT(CASE WHEN V.Pet_Vaccinated = 'Yes' THEN F.PetID ELSE NULL END) * 1.0/COUNT(F.PetID),2) AS pct_vaccinated,
	ROUND(COUNT(CASE WHEN D.Pet_Dewormed = 'Yes' THEN F.PetID ELSE NULL END) * 1.0/COUNT(F.PetID),2) AS pct_dewormed,
	ROUND(COUNT(CASE WHEN S.Pet_Sterilized = 'Yes' THEN F.PetID ELSE NULL END) * 1.0/COUNT(F.PetID),2) AS pct_sterilized
FROM Fact_Pet F
LEFT JOIN Dim_Vaccinated V ON F.Pet_Vaccinated_ID = V.Pet_Vaccinated_ID
LEFT JOIN Dim_Dewormed D ON F.Pet_Dewormed_ID = D.Pet_Dewormed_ID
LEFT JOIN Dim_Sterilized S ON F.Pet_Sterilized_ID = S.Pet_Sterlized_ID
LEFT JOIN Dim_Type T ON T.Pet_Type_ID = F.Pet_Type_ID
GROUP BY T.Pet_Type;


-- 2) Different numbers of breed
SELECT
	p1.Pet_Breed,
	COUNT(DISTINCT f.PetID) AS num_case,
	SUM(F.Quantity) AS Total_Number,
	AVG(F.Fee)/AVG(F.Quantity) AS Avg_Price,
	MAX(F.age)/AVG(F.Quantity) AS maximum_age,
	MIN(F.age)/AVG(F.Quantity) AS minimum_age,
	ROUND(COUNT(CASE WHEN V.Pet_Vaccinated = 'Yes' THEN F.PetID ELSE NULL END) * 1.0/COUNT(F.PetID),2) AS pct_vaccinated,
	ROUND(COUNT(CASE WHEN D.Pet_Dewormed = 'Yes' THEN F.PetID ELSE NULL END) * 1.0/COUNT(F.PetID),2) AS pct_dewormed,
	ROUND(COUNT(CASE WHEN S.Pet_Sterilized = 'Yes' THEN F.PetID ELSE NULL END) * 1.0/COUNT(F.PetID),2) AS pct_sterilized
FROM Fact_Pet f
LEFT JOIN Dim_Breed p1 ON f.Pet_Breed1_ID = p1.Pet_Breed_ID
LEFT JOIN Dim_Vaccinated V ON F.Pet_Vaccinated_ID = V.Pet_Vaccinated_ID
LEFT JOIN Dim_Dewormed D ON F.Pet_Dewormed_ID = D.Pet_Dewormed_ID
LEFT JOIN Dim_Sterilized S ON F.Pet_Sterilized_ID = S.Pet_Sterlized_ID
GROUP BY p1.Pet_Breed;

-- Types of FurLength
SELECT
	l.Pet_Furlength,
	COUNT(f.Pet_Type_ID ) AS Total_Case,
	SUM(f.Quantity) AS Total_Number,
	SUM(f.Fee) AS Total_Price,
	ROUND(COUNT(CASE WHEN V.Pet_Vaccinated = 'Yes' THEN F.PetID ELSE NULL END) * 1.0/COUNT(F.PetID),2) AS pct_vaccinated,
	ROUND(COUNT(CASE WHEN D.Pet_Dewormed = 'Yes' THEN F.PetID ELSE NULL END) * 1.0/COUNT(F.PetID),2) AS pct_dewormed,
	ROUND(COUNT(CASE WHEN S.Pet_Sterilized = 'Yes' THEN F.PetID ELSE NULL END) * 1.0/COUNT(F.PetID),2) AS pct_sterilized
FROM Fact_Pet f
LEFT JOIN Dim_FurLength l ON l.Pet_Furlength_ID = f.Pet_FurLength_ID
LEFT JOIN Dim_Breed p1 ON f.Pet_Breed1_ID = p1.Pet_Breed_ID
LEFT JOIN Dim_Vaccinated V ON F.Pet_Vaccinated_ID = V.Pet_Vaccinated_ID
LEFT JOIN Dim_Dewormed D ON F.Pet_Dewormed_ID = D.Pet_Dewormed_ID
LEFT JOIN Dim_Sterilized S ON F.Pet_Sterilized_ID = S.Pet_Sterlized_ID
GROUP BY l.Pet_Furlength;
