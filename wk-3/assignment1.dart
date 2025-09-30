// ---------------------------
// 1. ENCAPSULATION
// ---------------------------
class BankAccount {
  // Private variables (encapsulation)
  String _accountNumber;
  double _balance;
  String _accountHolder;
  
  // Constructor
  BankAccount(this._accountNumber, this._accountHolder, [this._balance = 0.0]);
  
  // Public getters (controlled access)
  String get accountNumber => _accountNumber;
  String get accountHolder => _accountHolder;
  double get balance => _balance;
  
  // Controlled methods for modifying private data
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Invalid deposit amount');
    }
  }
  
  bool withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
      return true;
    } else {
      print('Insufficient funds or invalid amount');
      return false;
    }
  }
  
  // Method to display account info
  void displayAccountInfo() {
    print('Account: $_accountNumber');
    print('Holder: $_accountHolder');
    print('Balance: \$$_balance');
  }
}

// ---------------------------
// 2. ABSTRACTION
// ---------------------------
abstract class Loan {
  double principal;
  double interestRate;
  
  Loan(this.principal, this.interestRate);
  
  // Abstract method - must be implemented by subclasses
  double calculateInterest();
  
  // Abstract method
  void displayLoanTerms();
  
  // Concrete method
  void displayGeneralInfo() {
    print('Principal: \$$principal');
    print('Interest Rate: ${interestRate * 100}%');
  }
}

// ---------------------------
// 3. INHERITANCE
// ---------------------------
// Superclass
class SavingsAccount extends BankAccount {
  double _interestRate;
  
  SavingsAccount(String accountNumber, String accountHolder, double balance, this._interestRate)
      : super(accountNumber, accountHolder, balance);
  
  double get interestRate => _interestRate;
  
  void applyInterest() {
    double interest = _balance * _interestRate;
    _balance += interest;
    print('Interest applied: \$${interest.toStringAsFixed(2)}');
  }
  
  // Overriding parent class method
  @override
  void displayAccountInfo() {
    print('=== Savings Account ===');
    super.displayAccountInfo();
    print('Interest Rate: ${(_interestRate * 100).toStringAsFixed(2)}%');
  }
}

// Another subclass inheriting from BankAccount
class CurrentAccount extends BankAccount {
  double _overdraftLimit;
  
  CurrentAccount(String accountNumber, String accountHolder, double balance, this._overdraftLimit)
      : super(accountNumber, accountHolder, balance);
  
  // Overriding withdraw method to include overdraft
  @override
  bool withdraw(double amount) {
    if (amount > 0 && amount <= (_balance + _overdraftLimit)) {
      _balance -= amount;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
      if (_balance < 0) {
        print('Warning: Overdraft used. Current balance: \$${_balance.toStringAsFixed(2)}');
      }
      return true;
    } else {
      print('Withdrawal amount exceeds available balance and overdraft limit');
      return false;
    }
  }
  
  @override
  void displayAccountInfo() {
    print('=== Current Account ===');
    super.displayAccountInfo();
    print('Overdraft Limit: \$$_overdraftLimit');
  }
}

// ---------------------------
// 4. POLYMORPHISM
// ---------------------------
// Implementing the abstract Loan class with different implementations

class HomeLoan extends Loan {
  int loanTerm; // in years
  
  HomeLoan(double principal, double interestRate, this.loanTerm)
      : super(principal, interestRate);
  
  // Implementing abstract method
  @override
  double calculateInterest() {
    return principal * interestRate * loanTerm;
  }
  
  @override
  void displayLoanTerms() {
    print('=== Home Loan ===');
    displayGeneralInfo();
    print('Loan Term: $loanTerm years');
    print('Total Interest: \$${calculateInterest().toStringAsFixed(2)}');
    print('Total Payment: \$${(principal + calculateInterest()).toStringAsFixed(2)}');
  }
}

class CarLoan extends Loan {
  int loanTerm; // in months
  
  CarLoan(double principal, double interestRate, this.loanTerm)
      : super(principal, interestRate);
  
  // Different implementation of the same abstract method
  @override
  double calculateInterest() {
    // Monthly compounding for car loans
    double monthlyRate = interestRate / 12;
    return principal * monthlyRate * loanTerm;
  }
  
  @override
  void displayLoanTerms() {
    print('=== Car Loan ===');
    displayGeneralInfo();
    print('Loan Term: $loanTerm months');
    print('Total Interest: \$${calculateInterest().toStringAsFixed(2)}');
    print('Total Payment: \$${(principal + calculateInterest()).toStringAsFixed(2)}');
  }
}

// ---------------------------
// MAIN FUNCTION TO DEMONSTRATE ALL CONCEPTS
// ---------------------------
void main() {
  print('=== ENCAPSULATION DEMONSTRATION ===');
  BankAccount account = BankAccount('123456', 'John Doe', 1000.0);
  account.displayAccountInfo();
  account.deposit(500.0);
  account.withdraw(200.0);
  // account._balance = 10000; // This would cause an error - private variable
  
  print('\n=== INHERITANCE DEMONSTRATION ===');
  SavingsAccount savings = SavingsAccount('SAV001', 'Alice Smith', 5000.0, 0.05);
  savings.displayAccountInfo();
  savings.applyInterest();
  
  CurrentAccount current = CurrentAccount('CUR001', 'Bob Johnson', 2000.0, 1000.0);
  current.displayAccountInfo();
  current.withdraw(2500.0); // Uses overdraft
  
  print('\n=== POLYMORPHISM DEMONSTRATION ===');
  List<Loan> loans = [
    HomeLoan(100000, 0.06, 15),
    CarLoan(25000, 0.08, 36)
  ];
  
  // Same method call, different implementations
  for (Loan loan in loans) {
    loan.displayLoanTerms();
    print('');
  }
  
  print('\n=== POLYMORPHISM WITH BANK ACCOUNTS ===');
  List<BankAccount> accounts = [
    SavingsAccount('SAV002', 'Carol White', 3000.0, 0.04),
    CurrentAccount('CUR002', 'David Brown', 1500.0, 500.0),
    BankAccount('REG001', 'Eve Green', 2000.0)
  ];
  
  // Same method call, different behaviors due to method overriding
  for (BankAccount acc in accounts) {
    acc.displayAccountInfo();
    print('---');
  }
}
