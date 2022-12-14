# Table of SQL Wildcards

|Wildcard|Description|
|:-:|:-:|
|`%`|This wildcard represents any numbs of characters. For example, the query `SELECT * FROM users WHERE name LIKE '%john%'`|
|`_`|This wildcard represents a single character. For example, the query `SELECT * FROM users WHERE username LIKE 'joh_'`|
|`[]`|This wildcard is used to match a range of characters. For example, the query `SELECT * FROM users WHERE username LIKE '[a-m]oh_'`|
|`[^]`|This wildcard is used to match any character that is not in the specified range.|
|`!`|This wildcard is used to escape any special characters that are part of the wildcard syntax.|
