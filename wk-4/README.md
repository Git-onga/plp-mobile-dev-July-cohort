# DART Utilities

These are small reusable helper functions, classes or extensions that simplifies common task and make the codebase cleaner and maintainable.

## Date and Time
Dart offers utilities for working with dates and times, including classes for representing dates, times, durations, and intervals. 
These utilities allow developers to perform various operations like date arithmetic, formatting, parsing, and timezone handling.

  - `DateTime.now()` - Current date and time.
  - `DateTime()` - Specific date and Time.
  - `DateFormat('yyyy-MM-dd – kk:mm').format()` - Formating the arrangement of data and time
  - `data_var.add(Duration(days: 1))` - Adds one day to the specified day and time
  - `data_var.subtract(Duration(days: 1))` -  Subtracts one day form the specified day and time
  - `Duration(days: int_var, hours: int_var, minutes: int_var)` -  returns the number of microseconds within the passed time and day
  - `futureDate.difference(now)` - Interval between two dates

## Asynchronous Programming
Asynchronous programming is a way of writing code that doesn’t block the execution of your 
program while waiting for slow operations to complete (like network requests, file reads, or database queries).

Dart handles asynchronous operations using:

  1. **Future** - This is a keyword that Represents a value that will be available later. 
  2. **async / await** - `async` marks a function as asynchronous. `await` pauses execution until the Future complete.
  3. **`then()`** - an alternative function for await.
  4. **Streams** - Like a Future, but gives you multiple values over time

## Enums
An **enum** (short for enumeration) is a special type that lets you define a set of named constant values.

## String Manipulation
String manipulation is essential for processing and formatting text data in programming, such as generating messages, formatting user input, or performing text-based calculations.

  - **Concatenation** - Concatenation combines two or more strings into one using ('+') sign.
  - **Interpolation** - This embeds a variable within string using ('$').
  - **Substring** - using the function `substring()` to extract a portion of the string using the indices.
