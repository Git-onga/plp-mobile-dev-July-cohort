# Functions in Dart
--
A **Function** is a block of code that perfoms a specific task when it's called.

## Types of Function
--
1. ### Based on Defination
     - **Named Function** -> Functions with a defined name.
         `int add(int a, int b) {
            return a + b;
          }`
    - **Anonymous Functions (Lambdas / Closures)** -> Funstiona without a name.
        `var numbers = [1, 2, 3];
        numbers.forEach((n) => print(n));`
2. ### Based on Parameter
     - **Functions with Required Parameters**
     - **Functions with Optional Positional Parameters**
     - **Functions with Named Parameters**
3. ### Based on Return Type
     - **Void Function**
     - **Value-returning Function**
4. ### Special Function Types
     - **Higher-Order Functions** -> take other functions as parameters or return them
         `double applyOperation(double a, double b, double Function(double, double) op) {
            return op(a, b);
          }`
     - **Recursive Functions** -> call themselves
         `int factorial(int n) => (n <= 1) ? 1 : n * factorial(n - 1);`
     - **Arrow Function** -> short hand for one line function
         `int square(int x) => x * x;`
