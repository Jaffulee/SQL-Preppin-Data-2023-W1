--Written in Snowflake
--Use regex to grab text from Transaction_Code
SELECT REGEXP_SUBSTR(w12023.transaction_code,'[A-Z]+') AS BANK
        ,sum(w12023.value) AS VALUE
        
FROM PD2023_WK01 AS W12023
GROUP BY BANK
