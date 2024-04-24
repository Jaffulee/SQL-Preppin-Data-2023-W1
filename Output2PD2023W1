--Written in Snowflake
--Temporary view to get relevant fields
WITH BANKWEEKDAYNUMBER AS
    (
    --Use regex to grab text from Transaction_Code
    SELECT REGEXP_SUBSTR(w12023.transaction_code,'[A-Z]+') AS BANK
        ,w12023.value AS VALUE
        ,
        -- Convert string in form dd/MM/yyyy hh/mm/ss to weekday number from 0 (Monday) to 6 (Sunday)
        DAYOFWEEK(
            to_date(
                left(
                    w12023.transaction_date
                    ,10
                    )
                ,'DD/MM/YYYY') 
            ) AS TRANSACTION_DATE_NUMBER
        ,CASE TO_CHAR(w12023.online_or_in_person)
        WHEN '1' THEN 'Online'
        WHEN '2' THEN 'In-Person'
        END AS online_or_in_person
        
    FROM PD2023_WK01 AS w12023
    )

SELECT b.BANK
        ,
        --Convert weekday number to weekday text
        CASE b.transaction_date_number
        WHEN 0 THEN 'Monday'
        WHEN 1 THEN 'Tuesday'
        WHEN 2 THEN 'Wednesday'
        WHEN 3 THEN 'Thursday'
        WHEN 4 THEN 'Friday'
        WHEN 6 THEN 'Saturday'
        WHEN 7 THEN 'Sunday'
        END AS TRANSACTION_WEEKDAY
        ,b.online_or_in_person
        ,sum(b.value) AS VALUE
        
FROM BANKWEEKDAYNUMBER AS b
GROUP BY BANK, TRANSACTION_WEEKDAY, b.online_or_in_person
;
