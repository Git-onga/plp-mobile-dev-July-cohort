void main() {
  // -------------------------
  // DATA TYPES IMPLEMENTATION
  // -------------------------

  // Define Variables
  int age = 21;
  double price = 99.99;
  String name = "Bildad";
  bool isStudent = true;
  List<int> numbers = [5, 12, 150, -3, 8];

  print("Int: $age");
  print("Double: $price");
  print("String: $name");
  print("Bool: $isStudent");
  print("List: $numbers\n");

  // -------------------------
  // TYPE CONVERSION
  // -------------------------
  String numberStr = "42";

  // Convert String to int and double
  int numberInt = int.parse(numberStr);
  double numberDouble = double.parse(numberStr);

  // Convert int to String and double
  String intToString = numberInt.toString();
  double intToDouble = numberInt.toDouble();

  print("String to int: $numberInt");
  print("String to double: $numberDouble");
  print("Int to String: $intToString");
  print("Int to double: $intToDouble\n");

  // Function for Conversion
  convertAndDisplay("123");

  // -------------------------
  // CONTROL FLOW
  // -------------------------

  // If-Else Example: Check number type
  int checkNumber = -5;
  if (checkNumber > 0) {
    print("$checkNumber is positive");
  } else if (checkNumber < 0) {
    print("$checkNumber is negative");
  } else {
    print("$checkNumber is zero");
  }

  // If-Else Example: Voting eligibility
  if (age >= 18) {
    print("You are eligible to vote\n");
  } else {
    print("You are NOT eligible to vote\n");
  }

  // Switch Case: Day of the week
  int day = 3;
  switch (day) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    case 4:
      print("Thursday");
      break;
    case 5:
      print("Friday");
      break;
    case 6:
      print("Saturday");
      break;
    case 7:
      print("Sunday");
      break;
    default:
      print("Invalid day");
  }
  print("");

  // -------------------------
  // LOOPS
  // -------------------------

  // For loop: 1 to 10
  for (int i = 1; i <= 10; i++) {
    print("For loop: $i");
  }
  print("");

  // While loop: 10 to 1
  int j = 10;
  while (j >= 1) {
    print("While loop: $j");
    j--;
  }
  print("");

  // Do-while loop: 1 to 5
  int k = 1;
  do {
    print("Do-while loop: $k");
    k++;
  } while (k <= 5);
  print("");

  // -------------------------
  // COMBINING DATA TYPES + CONTROL FLOW
  // -------------------------

  print("Complex Example:");
  for (int num in numbers) {
    print("Number: $num");

    // Check if even or odd
    if (num % 2 == 0) {
      print(" - Even");
    } else {
      print(" - Odd");
    }

    // Categorize using switch
    switch (num) {
      case >= 1 && <= 10:
        print(" - Category: Small");
        break;
      case >= 11 && <= 100:
        print(" - Category: Medium");
        break;
      case >= 101:
        print(" - Category: Large");
        break;
      default:
        print(" - Category: Out of range");
    }
    print("");
  }
}

// -------------------------
// FUNCTION
// -------------------------
void convertAndDisplay(String numStr) {
  int numInt = int.parse(numStr);
  double numDouble = double.parse(numStr);

  print("convertAndDisplay Function:");
  print("String '$numStr' to int: $numInt");
  print("String '$numStr' to double: $numDouble\n");
}
