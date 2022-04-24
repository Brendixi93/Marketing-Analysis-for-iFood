
--1. Line graph shows the total amount of sales by each channel and a prediction.
--Since data did not specify Discount_Purchases to be included on other purchases, I counted them as individual sales.

Select Dt_Customer, SUM(NumDealsPurchases) as Discount_Purchases, SUM(NumWebPurchases) as Web_Purchases 
, SUM(NumCatalogPurchases) as Catalog_Purchases, SUM(NumStorePurchases) as Store_Purchases
FROM iFood_analysis..Campaign_Demographics
Group by Dt_Customer

--2. Bar graph shows the amount of campaigns accepted by each individual age group.

 Select Case when Year_Birth < 1928 then '95+' 
  when Year_Birth >= 1928 and Year_Birth <= 1945 then '77-94'
  when Year_Birth >= 1946 and Year_Birth <= 1964 then '58-76'
  when Year_Birth >= 1965 and Year_Birth <= 1980 then '42-57'
  else '22-41' end as Age
  , SUM(NumWebVisitsMonth) as MontlyWebVisits, SUM(AcceptedCmp1) as Campaign1 , SUM(AcceptedCmp2) as Campaign2
  ,SUM(AcceptedCmp3) as Campaign3, SUM(AcceptedCmp4) as Campaign4, SUM(AcceptedCmp5) as Campaign5
  From iFood_analysis..Campaign_Demographics
  Group by Case when Year_Birth < 1928 then '95+' 
  when Year_Birth >= 1928 and Year_Birth <= 1945 then '77-94'
  when Year_Birth >= 1946 and Year_Birth <= 1964 then '58-76'
  when Year_Birth >= 1965 and Year_Birth <= 1980 then '42-57'
  else '22-41' end 
  Order by Age