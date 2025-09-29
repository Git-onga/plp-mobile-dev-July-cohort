void main() {
  print(" --- ONLINE SHOPPING CART SYSTEM ---");

  // Cart: item -> price
  Map<String, int> shelf = {
    "Jogoo 2kg": 130,
    "Exe 3kg": 170,
    "Naivas Sugar 2kg": 200,
    "400g Naivas White Bread": 65,
    "Pearl White Long Grain 2kg": 290,
    "Fresh Fry 2L": 550,
    "2L Coca Cola": 180
  };

  // ✅ Convert Map values to a List of prices
  var priceList = shelf.values.toList();
  var sumPriceList = priceList.reduce((a, b) => a + b);
  print('Total price: kes $sumPriceList');

  // ✅ Anonymous function: filter out items below a threshold (e.g., < 100)
  var filteredPrices = priceList.where((price) => price >= 200).toList();
  print("Filtered items (>= kes 200): $filteredPrices");

  // ✅ Higher-Order Function: Apply discount
  List<double> applyDiscount(
      List<int> prices, double Function(double) discountFunc) {
    return prices.map((price) => discountFunc(price.toDouble())).toList();
  }

  // Example discount: 10% off
  var discountedPrices = applyDiscount(filteredPrices, (price) => price * 0.9);
  print("Prices after 10% discount: $discountedPrices");

  // ✅ Standard Function: Calculate total with optional tax
  double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
    var subtotal = prices.fold(0.0, (a, b) => a + b);
    return subtotal + (subtotal * taxRate);
  }

  // Calculate total with 5% tax
  var totalWithTax = calculateTotal(discountedPrices, taxRate: 0.05);
  print("Total with tax kes: $totalWithTax");

  // ✅ Recursive Function: Factorial discount
  int calculateFactorialDiscount(int n) {
    if (n <= 1) return 1;
    return n * calculateFactorialDiscount(n - 1);
  }

  int itemCount = discountedPrices.length;
  int factorialDiscount = calculateFactorialDiscount(itemCount);
  print("Factorial discount ($itemCount!): $factorialDiscount%");

  // Apply factorial discount
  var finalPrice = totalWithTax * (1 - factorialDiscount / 100);
  print("Final price after factorial discount: $finalPrice");
}
