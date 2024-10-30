CREATE TABLE NutritionPlans ( -- This table contains information about player nutrition plans
    NutritionPlanID INTEGER PRIMARY KEY,
    PlayerID INTEGER, -- References PlayerID in Players table. Range depends on number of players.
    DietType TEXT, -- Type of diet (e.g., "High Protein", "Vegan", "Keto"). 10-15 distinct values.
    CalorieTarget INTEGER, -- Daily calorie target. Range 1500-5000, normally distributed around 3000.
    ProteinPercentage FLOAT, -- Percentage of calories from protein. Range 10-40, normally distributed around 25.
    StartDate DATE, -- Start date of the nutrition plan. Range from 2000 to present.
    EndDate DATE -- End date of the nutrition plan. Range from 2000 to future, or NULL if ongoing.
);
-- JOIN GRAPH: "NutritionPlans": ["Players"]

-- <METADATA CHANNEL="sqlite" DATABASE="mysports.db" TABLE="NutritionPlans">
-- - Description: This table contains information about player nutrition plans
-- - Data:
-- -- NutritionPlanID: Primary key for the NutritionPlans table
-- -- PlayerID: References PlayerID in Players table. Range depends on number of players.
-- -- DietType: Type of diet (e.g., "High Protein", "Vegan", "Keto"). 10-15 distinct values.
-- -- CalorieTarget: Daily calorie target. Range 1500-5000, normally distributed around 3000.
-- -- ProteinPercentage: Percentage of calories from protein. Range 10-40, normally distributed around 25.
-- -- StartDate: Start date of the nutrition plan. Range from 2000 to present.
-- -- EndDate: End date of the nutrition plan. Range from 2000 to future, or NULL if ongoing.
-- - Relationships:
-- -- (NutritionPlans.PlayerID → Players.PlayerID) - Table containing information about individual players
-- </METADATA>
-- 

-- File: mysports.NutritionPlans.txt 
-- NutritionPlanID: INTEGER FROM 1 TO 10 like [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- PlayerID: INTEGER FROM 1 TO 10 like [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
-- DietType: TEXT FROM Balanced TO Zone Diet like ['Zone Diet', 'Vegan', 'Paleo', 'Mediterranean', 'Low Carb', 'Keto', 'Intermittent Fasting', 'High Protein', 'High Carb', 'Balanced']
-- CalorieTarget: INTEGER FROM 2500 TO 3800 like [3800, 3500, 3400, 3300, 3200, 3100, 3000, 2900, 2800, 2500]
-- ProteinPercentage: NUMERIC FROM 18.0 TO 40.0 like [30.0, 40.0, 35.0, 32.0, 28.0, 25.0, 22.0, 20.0, 18.0]
-- StartDate: TEXT FROM 2021-01-01 TO 2021-05-01 like ['2021-01-01', '2021-02-01', '2021-05-01', '2021-04-01', '2021-03-15', '2021-03-01', '2021-02-15']
-- EndDate: TEXT FROM 2021-08-31 TO 2022-02-14 like ['2021-12-31', '2022-01-31', '2022-02-14', '2021-11-15', '2021-10-31', '2021-09-30', '2021-08-31']
-- 
