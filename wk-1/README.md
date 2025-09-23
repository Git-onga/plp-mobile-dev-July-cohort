#🚀 WEEK-ONE-DART-BASICS
--

Naming convection recommended is **camelCase**

## 📝 Variables  

In Dart, a **variable** is a named storage location that can be declared using `var`, `final`, or `const`.  
The choice depends on whether the value is intended to be **mutable** or **immutable**.  

### 🔑 Key Concepts  
- **Mutable** → A variable that **can be changed** after it's created.  
  - Example: `var`  
- **Immutable** → A variable that **cannot be changed** after it's created.  
  - Example:  
    - `final` → value set at **runtime**.  
    - `const` → value set at **compile-time**.  

--

## 🔢 Data Types in Dart  

Dart supports several **built-in data types**, which allow you to work with different kinds of values.  

### 📌 Core Data Types  

1. **Numbers** → variables that can be used for arithmetic purposes.  
   - `int` → whole numbers  
   - `double` → decimal numbers 
2. **String** → saved as text data `String`.
3. **Booleans** - for setting conditional code `bool`.
4. **List** - ordered collection of objects `List varName = []`.
5. **Maps** - dynamic key-value set pairs `Map<String, int> ages = {'Alice': 30, 'Bob': 25};`
6. **Runes** - represent unicode code point eg Emojis, Special Char `Runes()`.

--

## 🔀 Control Flow in Dart  

Control flow allows a program to **decide which direction the code takes** based on conditions or repeat actions until a condition is met.  

### 🧩 Control Statements 

1. **Decision-Making Statements** → These statements decide the **flow of the program** based on conditions.
   - `If` statements → runs a single statement if the condition is met.
   - `If-else` statements → has two statements, runs the 1st statement if the condtion is met else the 2nd.
   - `Nested If` statements → has multiple statements, runs the 1st statement if the condtion is met else the next `If-else` then next dependong on the number of statemts.
   - `Switch` statements → choose a block of code to execute from multiple options.
2. Loopping Statements → These statements execute a block of code repeatedly while a condition holds true.
   - `For` Loop → best when the number of iterations is **known in advance**.
   - `While` Loop → best when the number of iterations is **unknown and depends on a condition**.
   - `Do... While` Loop → ensures the block of code runs **at least once**, even if the condition is false at the start.
