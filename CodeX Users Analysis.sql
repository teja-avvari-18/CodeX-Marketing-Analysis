

USE codex_marketing;

SELECT * FROM dim_cities;

SELECT * FROM dim_respondents;

SELECT * FROM fact_survey_responses;


-- Codex Respondents
SELECT COUNT(*) AS Codex_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX';


-- Respondents and cities
SELECT City,COUNT(*) AS Total_Respondents
FROM dim_cities
JOIN dim_respondents ON dim_cities.City_ID = dim_respondents.City_ID
JOIN fact_survey_responses ON dim_respondents.Respondent_ID=fact_survey_responses.Respondent_ID
WHERE Current_brands='CodeX'
GROUP BY City
ORDER BY Total_Respondents DESC;

-- Tier and Respondents
SELECT Tier,COUNT(*) AS Total_Respondents
FROM dim_cities
JOIN dim_respondents ON dim_cities.City_ID = dim_respondents.City_ID
JOIN fact_survey_responses ON dim_respondents.Respondent_ID=fact_survey_responses.Respondent_ID
WHERE Current_brands='CodeX'
GROUP BY Tier
ORDER BY Total_Respondents DESC;

-- Average Taste Experience
SELECT ROUND(AVG(Taste_experience),0) AS Average_Taste_Experience 
FROM fact_survey_responses
WHERE Current_brands='CodeX';

-- Respondents By Gender
SELECT Gender, COUNT(*) AS  No_of_Respondents_By_Gender,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dim_respondents JOIN fact_survey_responses ON dim_respondents.Respondent_ID=fact_survey_responses.Respondent_ID
WHERE Current_brands='CodeX'),2) AS percentage_of_respondents
FROM dim_respondents
JOIN fact_survey_responses ON dim_respondents.Respondent_ID=fact_survey_responses.Respondent_ID
WHERE Current_brands='CodeX'
GROUP BY Gender
ORDER BY No_of_Respondents_By_Gender DESC;

-- Respondents By Age Group
SELECT Age, COUNT(*) AS  No_of_Respondents_By_Gender,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dim_respondents JOIN fact_survey_responses ON dim_respondents.Respondent_ID=fact_survey_responses.Respondent_ID
WHERE Current_brands='CodeX'),2) AS percentage_of_respondents
FROM dim_respondents
JOIN fact_survey_responses ON dim_respondents.Respondent_ID=fact_survey_responses.Respondent_ID
WHERE Current_brands='CodeX'
GROUP BY Age
ORDER BY No_of_Respondents_By_Gender DESC;

-- Respondents By Age and Gender
Select Age, Gender, Count(*) AS No_of_Respondents
FROM dim_respondents
JOIN fact_survey_responses ON dim_respondents.Respondent_ID=fact_survey_responses.Respondent_ID
WHERE Current_brands='CodeX'
GROUP BY Age,Gender
ORDER BY Age;

-- Marketing Reach For Most of the Youth (15-30)
SELECT Marketing_channels,COUNT(*) AS Total
FROM fact_survey_responses 
JOIN dim_respondents ON fact_survey_responses.Respondent_ID = dim_respondents.Respondent_ID
WHERE (Age='15-18' OR Age='19-30') AND Current_brands='CodeX'
GROUP BY Marketing_channels
ORDER BY Total DESC;

-- Preferred ingredients of energy drinks among respondents
SELECT Ingredients_expected, COUNT(*) AS  No_of_Respondents,
   ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fact_survey_responses WHERE Current_brands='CodeX' ),2) AS percentage_of_respondents
FROM fact_survey_responses 
WHERE Current_brands='CodeX'
GROUP BY Ingredients_expected
ORDER BY percentage_of_respondents DESC;

-- Packaging Preferences
SELECT Packaging_preference, COUNT(*) AS  No_of_Respondents,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fact_survey_responses WHERE Current_brands='CodeX' ),2) AS percentage_of_respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Packaging_preference
ORDER BY percentage_of_respondents DESC;

-- Consume_frequency behaviour of respondents
SELECT Consume_frequency, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Consume_frequency
ORDER BY No_of_Respondents DESC;

-- Consume Reason of respondents
SELECT Consume_reason, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Consume_reason
ORDER BY No_of_Respondents DESC;

-- General perception about Energy Drinks
SELECT General_perception, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY General_perception
ORDER BY No_of_Respondents DESC;

-- Brand Perception
SELECT Brand_perception, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Brand_perception
ORDER BY No_of_Respondents DESC;

-- Reason for choosing the brand
SELECT Reasons_for_choosing_brands, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Reasons_for_choosing_brands
ORDER BY No_of_Respondents DESC;

-- What Improvements do people desire in the product
SELECT Improvements_desired, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Improvements_desired
ORDER BY No_of_Respondents DESC;

-- Health Concerns about Energy Drinks
SELECT Health_concerns, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Health_concerns
ORDER BY No_of_Respondents DESC;


-- People interest in natural or organic ingredients
SELECT Interest_in_natural_or_organic, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Interest_in_natural_or_organic
ORDER BY No_of_Respondents DESC;


-- Through what marketing channels people come across energy drink advertisements
SELECT Marketing_channels, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Marketing_channels
ORDER BY No_of_Respondents DESC;

-- People interest in buying when given a limited edition packaging
SELECT Limited_edition_packaging, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Limited_edition_packaging
ORDER BY No_of_Respondents DESC;

-- What price the people consider as a reasonable price for an energy drink
SELECT Price_range, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Price_range
ORDER BY No_of_Respondents DESC;

-- Where do people generally purchase energy drinks
SELECT Purchase_location, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Purchase_location
ORDER BY No_of_Respondents DESC;

-- At what situtations people consume energy drinks
SELECT Typical_consumption_situations, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Current_brands='CodeX'
GROUP BY Typical_consumption_situations
ORDER BY No_of_Respondents DESC;