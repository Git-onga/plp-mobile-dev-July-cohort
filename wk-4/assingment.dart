import 'dart:io';

class StringManipulator {
  // String concatenation
  static String concatenateStrings(String str1, String str2) {
    return str1 + str2;
  }

  // String interpolation
  static String interpolateStrings(String name, int age) {
    return "Hello, my name is $name and I'm $age years old. Next year I'll be ${age + 1}.";
  }

  // Substring extraction
  static String extractSubstring(String text, int start, int end) {
    if (start < 0 || end > text.length || start >= end) {
      return "Invalid range";
    }
    return text.substring(start, end);
  }

  // Case conversion
  static String convertCase(String text) {
    return "Original: $text\nUppercase: ${text.toUpperCase()}\nLowercase: ${text.toLowerCase()}";
  }

  // Reverse string
  static String reverseString(String text) {
    return String.fromCharCodes(text.runes.toList().reversed);
  }

  // Count length
  static int countLength(String text) {
    return text.length;
  }

  // Demonstrate all operations
  static void demonstrate() {
    print("=== STRING MANIPULATION DEMONSTRATION ===\n");
    
    String str1 = "Hello";
    String str2 = "World";
    
    print("1. Concatenation:");
    print("   '$str1' + '$str2' = '${concatenateStrings(str1, str2)}'");
    
    print("\n2. Interpolation:");
    print("   ${interpolateStrings("Alice", 25)}");
    
    print("\n3. Substring Extraction:");
    String sample = "Dart Programming";
    print("   '$sample'.substring(0, 4) = '${extractSubstring(sample, 0, 4)}'");
    
    print("\n4. Case Conversion:");
    print("   ${convertCase("Dart Programming")}");
    
    print("\n5. Reverse String:");
    String toReverse = "Hello Dart";
    print("   '$toReverse' reversed = '${reverseString(toReverse)}'");
    
    print("\n6. Length Count:");
    print("   '$toReverse' length = ${countLength(toReverse)}");
  }
}

class CollectionDemo {
  // Lists - ordered collection with duplicates
  static void demonstrateLists() {
    print("\n=== LISTS DEMONSTRATION ===");
    
    List<String> fruits = ['apple', 'banana', 'orange'];
    print("Initial list: $fruits");
    
    // Adding elements
    fruits.add('grape');
    fruits.addAll(['mango', 'apple']); // Duplicate allowed
    print("After adding: $fruits");
    
    // Removing elements
    fruits.remove('banana');
    fruits.removeAt(0);
    print("After removal: $fruits");
    
    // Iterating
    print("Iterating with index:");
    for (int i = 0; i < fruits.length; i++) {
      print("  $i: ${fruits[i]}");
    }
    
    print("Use case: When you need ordered collection with duplicates");
  }

  // Sets - unordered collection without duplicates
  static void demonstrateSets() {
    print("\n=== SETS DEMONSTRATION ===");
    
    Set<String> uniqueFruits = {'apple', 'banana', 'orange'};
    print("Initial set: $uniqueFruits");
    
    // Adding elements
    uniqueFruits.add('grape');
    uniqueFruits.add('apple'); // Won't add duplicate
    print("After adding: $uniqueFruits");
    
    // Removing elements
    uniqueFruits.remove('banana');
    print("After removal: $uniqueFruits");
    
    // Iterating
    print("Iterating set:");
    for (String fruit in uniqueFruits) {
      print("  $fruit");
    }
    
    print("Use case: When you need unique elements and don't care about order");
  }

  // Maps - key-value pairs
  static void demonstrateMaps() {
    print("\n=== MAPS DEMONSTRATION ===");
    
    Map<String, int> fruitPrices = {
      'apple': 10,
      'banana': 5,
      'orange': 8,
    };
    print("Initial map: $fruitPrices");
    
    // Adding elements
    fruitPrices['grape'] = 12;
    fruitPrices['apple'] = 15; // Update existing
    print("After adding/updating: $fruitPrices");
    
    // Removing elements
    fruitPrices.remove('banana');
    print("After removal: $fruitPrices");
    
    // Iterating
    print("Iterating map:");
    fruitPrices.forEach((key, value) {
      print("  $key: \$$value");
    });
    
    print("Use case: When you need key-value pairs for lookup operations");
  }

  static void demonstrateAll() {
    demonstrateLists();
    demonstrateSets();
    demonstrateMaps();
  }
}


class FileHandler {
  // Write to file
  static Future<void> writeToFile(String filename, String content) async {
    try {
      final file = File(filename);
      await file.writeAsString(content);
      print("Successfully wrote to $filename");
    } catch (e) {
      print("Error writing to file: $e");
    }
  }

  // Read from file
  static Future<String> readFromFile(String filename) async {
    try {
      final file = File(filename);
      if (await file.exists()) {
        String contents = await file.readAsString();
        print("Successfully read from $filename");
        return contents;
      } else {
        return "File does not exist";
      }
    } catch (e) {
      return "Error reading file: $e";
    }
  }

  // Demonstrate file operations
  static Future<void> demonstrate() async {
    print("\n=== FILE HANDLING DEMONSTRATION ===");
    
    String inputFile = 'input.txt';
    String outputFile = 'output.txt';
    
    // Write to file
    String content = "Hello, this is a sample file content.\n"
                    "Created on: ${DateTime.now()}\n"
                    "This demonstrates file handling in Dart.";
    
    await writeToFile(inputFile, content);
    
    // Read from file
    String fileContent = await readFromFile(inputFile);
    print("File content:\n$fileContent");
    
    // Write processed content to another file
    await writeToFile(outputFile, "PROCESSED:\n${fileContent.toUpperCase()}");
    
    // Demonstrate error handling with non-existent file
    String errorContent = await readFromFile('nonexistent.txt');
    print("Trying to read non-existent file: $errorContent");
  }
}

class DateTimeDemo {
  // Format date
  static String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  // Parse date from string
  static DateTime? parseDate(String dateString) {
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      print("Error parsing date: $e");
      return null;
    }
  }

  // Add/subtract days
  static DateTime manipulateDate(DateTime date, int days) {
    return date.add(Duration(days: days));
  }

  // Calculate difference between two dates
  static int dateDifference(DateTime date1, DateTime date2) {
    return date2.difference(date1).inDays;
  }

  static void demonstrate() {
    print("\n=== DATE AND TIME DEMONSTRATION ===");
    
    DateTime now = DateTime.now();
    print("Current date: ${formatDate(now)}");
    
    // Parse date
    DateTime? parsedDate = parseDate("2024-01-15");
    if (parsedDate != null) {
      print("Parsed date: ${formatDate(parsedDate)}");
    }
    
    // Add/subtract days
    DateTime futureDate = manipulateDate(now, 7);
    DateTime pastDate = manipulateDate(now, -7);
    print("Current date: ${formatDate(now)}");
    print("7 days later: ${formatDate(futureDate)}");
    print("7 days before: ${formatDate(pastDate)}");
    
    // Date difference
    DateTime newYear = DateTime(2024, 1, 1);
    int daysUntilNewYear = dateDifference(now, newYear);
    print("Days until New Year 2024: $daysUntilNewYear");
    
    // More formatting options
    print("\nVarious date formats:");
    print("Full: $now");
    print("Custom: ${now.day}/${now.month}/${now.year}");
    print("Time: ${now.hour}:${now.minute}:${now.second}");
  }
}

class StringLoggerApp {
  List<Map<String, dynamic>> logEntries = [];
  final String logFile = 'string_logs.txt';

  // Process user input with string manipulation
  Map<String, dynamic> processString(String input) {
    return {
      'original': input,
      'uppercase': input.toUpperCase(),
      'lowercase': input.toLowerCase(),
      'reversed': StringManipulator.reverseString(input),
      'length': StringManipulator.countLength(input),
      'timestamp': DateTime.now(),
    };
  }

  // Add entry to collection
  void addEntry(String input) {
    Map<String, dynamic> processed = processString(input);
    logEntries.add(processed);
    print("✓ Added entry: '${processed['original']}'");
  }

  // Display all entries
  void displayEntries() {
    print("\n=== ALL LOG ENTRIES ===");
    if (logEntries.isEmpty) {
      print("No entries yet.");
      return;
    }

    for (int i = 0; i < logEntries.length; i++) {
      var entry = logEntries[i];
      print("Entry ${i + 1}:");
      print("  Original: ${entry['original']}");
      print("  Uppercase: ${entry['uppercase']}");
      print("  Lowercase: ${entry['lowercase']}");
      print("  Reversed: ${entry['reversed']}");
      print("  Length: ${entry['length']}");
      print("  Timestamp: ${entry['timestamp']}");
      print("  Days ago: ${DateTimeDemo.dateDifference(entry['timestamp'], DateTime.now())}");
      print("");
    }
  }

  // Save entries to file
  Future<void> saveToFile() async {
    String content = "STRING LOGGER APPLICATION - ${DateTime.now()}\n\n";
    
    for (int i = 0; i < logEntries.length; i++) {
      var entry = logEntries[i];
      content += "ENTRY ${i + 1}:\n";
      content += "Original: ${entry['original']}\n";
      content += "Uppercase: ${entry['uppercase']}\n";
      content += "Lowercase: ${entry['lowercase']}\n";
      content += "Reversed: ${entry['reversed']}\n";
      content += "Length: ${entry['length']}\n";
      content += "Timestamp: ${entry['timestamp']}\n";
      content += "Days ago: ${DateTimeDemo.dateDifference(entry['timestamp'], DateTime.now())}\n\n";
    }

    await FileHandler.writeToFile(logFile, content);
    
    // Verify by reading
    String savedContent = await FileHandler.readFromFile(logFile);
    print("\nSaved content preview:\n${savedContent.substring(0, 200)}...");
  }

  // Run the application
  Future<void> run() async {
    print("=== STRING LOGGER APPLICATION ===");
    print("This application demonstrates:");
    print("- String manipulation");
    print("- Collections usage");
    print("- File handling");
    print("- Date and time operations");
    print("");

    // Add some sample entries
    addEntry("Hello World");
    addEntry("Dart Programming");
    addEntry("Flutter Development");

    // Display entries
    displayEntries();

    // Save to file
    await saveToFile();

    // Demonstrate individual components
    print("\n" + "="*50);
    StringManipulator.demonstrate();
    
    print("\n" + "="*50);
    CollectionDemo.demonstrateAll();
    
    print("\n" + "="*50);
    DateTimeDemo.demonstrate();
    
    print("\n" + "="*50);
    await FileHandler.demonstrate();
  }
}

void main() async {
  // Run the combined application
  final app = StringLoggerApp();
  await app.run();
  
  // Alternatively, you can run individual demonstrations:
  /*
  StringManipulator.demonstrate();
  CollectionDemo.demonstrateAll();
  DateTimeDemo.demonstrate();
  await FileHandler.demonstrate();
  */
}
