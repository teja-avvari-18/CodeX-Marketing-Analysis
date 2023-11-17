
USE codex_marketing;

SELECT * FROM dim_cities;

SELECT * FROM dim_respondents;

SELECT * FROM fact_survey_responses;

-- Total Respondents
SELECT COUNT(Respondent_ID) AS Total_Respondents
 FROM dim_respondents;
 
 -- Respondents and cities
 SELECT City,COUNT(*) AS Total_Respondents
 FROM dim_cities
 JOIN dim_respondents ON dim_cities.City_ID = dim_respondents.City_ID
 GROUP BY City
 ORDER BY Total_Respondents DESC;
 
 -- Tier and Respondents
 SELECT Tier,COUNT(*) AS Total_Respondents
 FROM dim_cities
 JOIN dim_respondents ON dim_cities.City_ID = dim_respondents.City_ID
 GROUP BY Tier
 ORDER BY Total_Respondents DESC;
 
 -- Codex Respondents
 SELECT COUNT(*) AS Codex_Respondents
 FROM fact_survey_responses
 WHERE Current_brands='CodeX';
 
 -- Average Taste Experience
 SELECT ROUND(AVG(Taste_experience),0) AS Average_Taste_Experience 
 FROM fact_survey_responses;
 
 -- Respondents By Gender
 SELECT Gender, COUNT(*) AS  No_of_Respondents_By_Gender,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dim_respondents),2) AS percentage_of_respondents
FROM dim_respondents
GROUP BY Gender
ORDER BY percentage_of_respondents DESC;


-- Respondents By Age Group
SELECT Age, COUNT(*) AS  No_of_Respondents_By_Age,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dim_respondents),2) AS percentage_of_respondents
FROM dim_respondents
GROUP BY Age
ORDER BY percentage_of_respondents DESC;

-- Respondents By Age and Gender
Select Age, Gender, Count(*) AS No_of_Respondents
FROM dim_respondents
GROUP BY Age,Gender
ORDER BY Age;

-- Marketing Reach For Most of the Youth (15-30)
SELECT Marketing_channels,COUNT(*) AS Total
FROM fact_survey_responses 
JOIN dim_respondents ON fact_survey_responses.Respondent_ID = dim_respondents.Respondent_ID
WHERE Age='15-18' OR Age='19-30'
GROUP BY Marketing_channels
ORDER BY Total DESC;


-- Preferred ingredients of energy drinks among respondents
 SELECT Ingredients_expected, COUNT(*) AS  No_of_Respondents,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fact_survey_responses ),2) AS percentage_of_respondents
FROM fact_survey_responses 
GROUP BY Ingredients_expected
ORDER BY percentage_of_respondents DESC;

-- Packaging Preferences
SELECT Packaging_preference, COUNT(*) AS  No_of_Respondents,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fact_survey_responses ),2) AS percentage_of_respondents
FROM fact_survey_responses 
GROUP BY Packaging_preference
ORDER BY percentage_of_respondents DESC;

-- Current Market Leaders
SELECT Current_brands , COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Current_brands
ORDER BY No_of_Respondents DESC;

-- Consume_frequency behaviour of respondents
SELECT Consume_frequency, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Consume_frequency
ORDER BY No_of_Respondents DESC;

-- Consume Time of respondents
SELECT Consume_time, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Consume_time
ORDER BY No_of_Respondents DESC;

-- Consume Reason of respondents
SELECT Consume_reason, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Consume_reason
ORDER BY No_of_Respondents DESC;

 -- General perception about Energy Drinks
 SELECT General_perception, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY General_perception
ORDER BY No_of_Respondents DESC;

-- Awareness about our brand
SELECT Heard_before, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Heard_before
ORDER BY No_of_Respondents DESC;

-- How many respondents tried and how many did not try our brand before
SELECT Tried_before, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Tried_before
ORDER BY No_of_Respondents DESC;

-- Respondents who tried our brand and are using our brand
SELECT COUNT(*) AS Tried_and_Using_now
FROM fact_survey_responses
WHERE Tried_before = 'Yes' AND Current_brands = 'CodeX';

-- Respondents who tried our brand and are not using our brand
SELECT COUNT(*) AS Tried_and_Using_now
FROM fact_survey_responses
WHERE Tried_before = 'Yes' AND Current_brands <> 'CodeX';

-- Respondents who know about our brand but do not use our brand
SELECT COUNT(*) AS Know_but_do_not_use
FROM fact_survey_responses
WHERE Heard_before = 'Yes' AND Current_brands <> 'CodeX';

-- Respondents who know about our brand and use our brand
SELECT COUNT(*) AS Know_and_use
FROM fact_survey_responses
WHERE Heard_before = 'Yes' AND Current_brands = 'CodeX';

-- Respondents who don't know about our brand but do not use our brand
SELECT COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Heard_before = 'No' AND Current_brands <> 'CodeX';

-- Respondents who don't know about our brand but do  use our brand
SELECT COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
WHERE Heard_before = 'No' AND Current_brands = 'CodeX';


-- Brand Perception
 SELECT Brand_perception, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Brand_perception
ORDER BY No_of_Respondents DESC;

-- Reason for choosing the brand
SELECT Reasons_for_choosing_brands, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Reasons_for_choosing_brands
ORDER BY No_of_Respondents DESC;

-- What Improvements do people desire in the product
SELECT Improvements_desired, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Improvements_desired
ORDER BY No_of_Respondents DESC;

-- Health Concerns about Energy Drinks
SELECT Health_concerns, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Health_concerns
ORDER BY No_of_Respondents DESC;

-- People interest in natural or organic ingredients
SELECT Interest_in_natural_or_organic, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Interest_in_natural_or_organic
ORDER BY No_of_Respondents DESC;

-- Through what marketing channels people come across energy drink advertisements
SELECT Marketing_channels, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Marketing_channels
ORDER BY No_of_Respondents DESC;

-- People interest in buying when given a limited edition packaging
SELECT Limited_edition_packaging, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Limited_edition_packaging
ORDER BY No_of_Respondents DESC;

-- What price the people consider as a reasonable price for an energy drink
SELECT Price_range, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Price_range
ORDER BY No_of_Respondents DESC;

-- Where do people generally purchase energy drinks
SELECT Purchase_location, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Purchase_location
ORDER BY No_of_Respondents DESC;

-- At what situtations people consume energy drinks
SELECT Typical_consumption_situations, COUNT(*) AS No_of_Respondents
FROM fact_survey_responses
GROUP BY Typical_consumption_situations
ORDER BY No_of_Respondents DESC;