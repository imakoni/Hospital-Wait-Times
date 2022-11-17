/*
Hospital Wait Times Project

Exploring patient data using Windows Aggregate Functions*/

--Showing all patient recorded visits
SELECT COUNT([Patient ID]) AS Patients  FROM dbo.Sheet1$;

--Average Wait Times for all patients
SELECT ROUND(AVG(ALL([Wait Time in mins])),0) AS 'Wait in Mins'
FROM dbo.Sheet1$

--Average wait time based on insurance plan
SELECT [Financial Class], ROUND(AVG(ALL([Wait Time in mins])),0) AS ' Wait in Mins' FROM dbo.Sheet1$
GROUP BY [Financial Class];

-- Total Revenue for visits
SELECT ROUND((SUM(ALL[ Consultation Revenue ])),-3) AS TotalRevenue
FROM dbo.Sheet1$

--Revenue collected per patient visit
SELECT[Financial Class],ROUND((SUM(ALL[ Consultation Revenue ])/COUNT([PATIENT ID])),1)  'Cost per patient in $'
FROM dbo.Sheet1$
GROUP BY [Financial Class];
 
-- No. of patients per doctor  type during this period
SELECT [Doctor Type],  COUNT([Patient ID]) AS patients FROM dbo.Sheet1$
GROUP BY [Doctor Type]

--Average wait in mins according to the day of the week
SELECT [Day of Visit], ROUND(AVG(ALL([Wait Time in mins])),0) AS 'Wait Time' FROM dbo.Sheet1$
GROUP BY [Day of Visit]
ORDER BY [Wait Time] DESC

--Average Wait Times based on Insurance(Financial Class)
SELECT [Financial Class], ROUND(AVG(ALL([Wait Time in mins])),0) AS 'Wait Time' FROM dbo.Sheet1$
group by [Financial Class]


