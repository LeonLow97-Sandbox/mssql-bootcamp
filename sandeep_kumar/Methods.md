## Methods for SQL

|Method|Description|
|:-:|:-:|
|`CONCAT()`|Adds 2 or more strings together.|
|`CONCAT_WS()`|Adds 2 or more strings toether with a separator.|
|`LEN()`|Returns the length of a string.|
|`SUM()`|Calculates the sum of a set of values.|
|`avg()`|Calculates the average of numbers.|
|`max()`, `min()`|To get the maximum and minimum values from all the records.|
|`COUNT()`|returns the number of records returned by a select query.|

## String Functions

|Function|Description|
|:-:|:-:|
|`charIndex()`|returns the position of a substring from a specific position.|
|`concat()`|combines 2 or more strings(max 255 strings) into a single string.|
|`concat_ws()`|combines 2 or more strings (max 255 strings) into a string using a separator.|
|`datalength()`|returns the number of bytes used including the leading and trailing spaces.|
|`format()`|Formats input string to a particular format.|
|`left(MainString, Count)`|select fixed number of characters from the left.|
|`right()`|select fixed number of characters from the right.|
|`len()`|calculate the length of a string.|
|`lower()`|converts the string to lower case.|
|`upper()`|converts the string to upper case.|
|`ltrim()`|Removes leading WhiteSpaces (blanks before the input string)|
|`rtrim()`|Removes trailing WhiteSpaces (blanks after the input string)|
|`trim()`|Removes the leading and trailing spaces from the input string.|
|`patindex()`|Displays the position of the first occurrence of a pattern in input string.|
|`replace()`|Replaces all occurrences of a substring by another substring inside the main string.|
|`replicate(String, Count)`|Repeats a string a particular number of times.|
|`reverse()`|Reverses the string while displaying the result|
|`str()`|Returns a number as a string while displaying the result|
|`substring(MainString, StartingPosition, Length)`|Extracts a substring(some characters) from the main string.|

## Date Functions

|Function|Description|
|:-:|:-:|
|`DateAdd(format-interval, number, dateVal)`|Adds Date or time to another Date. <br> `format-interval` takes in year/quarter/month/day/hour/minute/second/millisecond/nanosecond
|`DateDiff(datePart, date1, date2)`|Returns the difference of 2 dates or date time.|
|`DatePart(date-interval, dateField)`|Returns a part of the date as Integer.|
|`Day(date-field)`|Extracts the day from the Date.|
|`Month(date-field)`|Extracts the month from the Date.|
|`Year(date-field)`|Extracts the year from the Date.|
|`Datename(date-interval, dateField)`|Returns a part of the date as String.|
|`eomonth()`|Returns the last date of the month from a specific date.|
|`CURRENT_TIMESTAMP`|Returns the current system date with time (without Time Zone).|
|`GETDATE()`|Returns the current system's date with time from the server. CURRENT_TIMESTAMP is the ANSI SQL alternative for the getdate() function and both will give the same result.|
|`SysDateTime()`|Returns the current system's date with time from the server (with more precision than getdate()).|
|`SYSDATETIMEOFFSET()`|Returns the current system date with time (with Time Zone).|
|`isDate()`|Returns a Boolean value of 1 if the expression is a valid date/time/datetime else returns a Boolean value of 0.|
|`isNull(a,b)`|Check whether an expression is a NULL value or not. <br> Returns b if a is NULL else return a itself.|
|`isNumeric()`|Check if an expression contains a Numeric value or not. <br> Returns the Boolean value 1(True) & 0(False).|
|`Coalesce(val1, val2,...,valn)`|Returns the first Non-NULL value from the list.|
|`nullif(expression1, expression2)`|Returns NULL if both the expressions are equal. <br> if both expressions not equal, it will display expression 1.|
|`convert(todatatype, expression)`|Convert to another data type.|
|`iif(test_condition, arg2, arg3)`|Takes 3 arguments and tests the first argument. If it is true, then displays the 2nd argument else displays the 3rd argument.|


















