// ---------------------------
// 1. ENCAPSULATION
// ---------------------------
class Patient {
  // Private variables (encapsulation)
  String _patientId;
  String _name;
  int _age;
  String _gender;
  List<String> _medicalHistory;
  double _billAmount;
  
  // Constructor
  Patient(this._patientId, this._name, this._age, this._gender, [this._billAmount = 0.0])
      : _medicalHistory = [];
  
  // Public getters (controlled access)
  String get patientId => _patientId;
  String get name => _name;
  int get age => _age;
  String get gender => _gender;
  double get billAmount => _billAmount;
  
  // Controlled methods for modifying private data
  void addMedicalRecord(String record) {
    _medicalHistory.add(record);
    print('Medical record added for $name');
  }
  
  List<String> getMedicalHistory() {
    return List.from(_medicalHistory); // Return copy to maintain encapsulation
  }
  
  void addToBill(double amount) {
    if (amount > 0) {
      _billAmount += amount;
      print('Added \$${amount.toStringAsFixed(2)} to bill. Total: \$$_billAmount');
    }
  }
  
  void payBill(double amount) {
    if (amount > 0 && amount <= _billAmount) {
      _billAmount -= amount;
      print('Payment of \$${amount.toStringAsFixed(2)} received. Remaining: \$$_billAmount');
    } else {
      print('Invalid payment amount');
    }
  }
  
  // Method to display patient info
  void displayPatientInfo() {
    print('Patient ID: $_patientId');
    print('Name: $_name');
    print('Age: $_age');
    print('Gender: $_gender');
    print('Current Bill: \$$_billAmount');
  }
}

// ---------------------------
// 2. ABSTRACTION
// ---------------------------
abstract class MedicalStaff {
  String staffId;
  String name;
  String specialization;
  
  MedicalStaff(this.staffId, this.name, this.specialization);
  
  // Abstract methods - must be implemented by subclasses
  void performDuty();
  void generateReport();
  
  // Concrete method
  void displayStaffInfo() {
    print('Staff ID: $staffId');
    print('Name: $name');
    print('Specialization: $specialization');
  }
}

abstract class MedicalProcedure {
  String procedureName;
  double baseCost;
  
  MedicalProcedure(this.procedureName, this.baseCost);
  
  // Abstract method
  double calculateCost();
  void performProcedure(Patient patient);
}

// ---------------------------
// 3. INHERITANCE
// ---------------------------
// Superclass for all medical staff
class Doctor extends MedicalStaff {
  int _yearsOfExperience;
  List<String> _assignedPatients;
  
  Doctor(String staffId, String name, String specialization, this._yearsOfExperience)
      : _assignedPatients = [],
        super(staffId, name, specialization);
  
  int get yearsOfExperience => _yearsOfExperience;
  
  void assignPatient(String patientId) {
    _assignedPatients.add(patientId);
    print('Patient $patientId assigned to Dr. $name');
  }
  
  void prescribeMedication(Patient patient, String medication) {
    patient.addMedicalRecord('Prescribed: $medication by Dr. $name');
    patient.addToBill(50.0); // Consultation fee
    print('Dr. $name prescribed $medication to ${patient.name}');
  }
  
  // Implementing abstract method
  @override
  void performDuty() {
    print('Dr. $name is consulting patients');
  }
  
  @override
  void generateReport() {
    print('=== Medical Report by Dr. $name ===');
    print('Specialization: $specialization');
    print('Experience: $_yearsOfExperience years');
    print('Assigned Patients: ${_assignedPatients.length}');
  }
}

// Another subclass inheriting from MedicalStaff
class Nurse extends MedicalStaff {
  String _shift;
  List<String> _wardResponsibilities;
  
  Nurse(String staffId, String name, String specialization, this._shift)
      : _wardResponsibilities = [],
        super(staffId, name, specialization);
  
  String get shift => _shift;
  
  void addWardResponsibility(String ward) {
    _wardResponsibilities.add(ward);
    print('Nurse $name assigned to ward: $ward');
  }
  
  void monitorPatient(Patient patient) {
    patient.addMedicalRecord('Vitals monitored by Nurse $name');
    print('Nurse $name is monitoring ${patient.name}');
  }
  
  // Implementing abstract method with different implementation
  @override
  void performDuty() {
    print('Nurse $name is on $shift shift, providing patient care');
  }
  
  @override
  void generateReport() {
    print('=== Nursing Report by $name ===');
    print('Shift: $_shift');
    print('Ward Responsibilities: $_wardResponsibilities');
  }
}

// ---------------------------
// 4. POLYMORPHISM
// ---------------------------
// Implementing the abstract MedicalProcedure class with different implementations

class Surgery extends MedicalProcedure {
  double complexityFactor;
  int durationHours;
  
  Surgery(String procedureName, double baseCost, this.complexityFactor, this.durationHours)
      : super(procedureName, baseCost);
  
  // Implementing abstract method
  @override
  double calculateCost() {
    return baseCost * complexityFactor * durationHours;
  }
  
  @override
  void performProcedure(Patient patient) {
    double cost = calculateCost();
    patient.addToBill(cost);
    patient.addMedicalRecord('Surgery: $procedureName performed. Cost: \$${cost.toStringAsFixed(2)}');
    print('Performing $procedureName on ${patient.name}');
    print('Surgery completed. Duration: $durationHours hours. Cost: \$${cost.toStringAsFixed(2)}');
  }
}

class DiagnosticTest extends MedicalProcedure {
  int numberOfTests;
  double labFee;
  
  DiagnosticTest(String procedureName, double baseCost, this.numberOfTests, this.labFee)
      : super(procedureName, baseCost);
  
  // Different implementation of the same abstract method
  @override
  double calculateCost() {
    return (baseCost * numberOfTests) + labFee;
  }
  
  @override
  void performProcedure(Patient patient) {
    double cost = calculateCost();
    patient.addToBill(cost);
    patient.addMedicalRecord('Diagnostic Test: $procedureName. Number of tests: $numberOfTests. Cost: \$${cost.toStringAsFixed(2)}');
    print('Conducting $procedureName on ${patient.name}');
    print('Diagnostic completed. Tests: $numberOfTests. Cost: \$${cost.toStringAsFixed(2)}');
  }
}

class TherapySession extends MedicalProcedure {
  int sessionDuration; // in minutes
  String therapyType;
  
  TherapySession(String procedureName, double baseCost, this.sessionDuration, this.therapyType)
      : super(procedureName, baseCost);
  
  @override
  double calculateCost() {
    return baseCost * (sessionDuration / 60); // Cost per hour
  }
  
  @override
  void performProcedure(Patient patient) {
    double cost = calculateCost();
    patient.addToBill(cost);
    patient.addMedicalRecord('Therapy: $therapyType session. Duration: $sessionDuration mins. Cost: \$${cost.toStringAsFixed(2)}');
    print('Conducting $therapyType therapy for ${patient.name}');
    print('Therapy session completed. Duration: $sessionDuration minutes. Cost: \$${cost.toStringAsFixed(2)}');
  }
}

// ---------------------------
// HOSPITAL MANAGEMENT CLASS
// ---------------------------
class Hospital {
  String _name;
  List<Patient> _patients;
  List<MedicalStaff> _staff;
  
  Hospital(this._name) 
      : _patients = [],
        _staff = [];
  
  void admitPatient(Patient patient) {
    _patients.add(patient);
    print('Patient ${patient.name} admitted to $_name');
  }
  
  void hireStaff(MedicalStaff staff) {
    _staff.add(staff);
    print('${staff.name} hired as ${staff.specialization}');
  }
  
  void displayHospitalStatus() {
    print('\n=== $_name Status ===');
    print('Total Patients: ${_patients.length}');
    print('Total Staff: ${_staff.length}');
    
    print('\n--- Staff List ---');
    for (var staff in _staff) {
      staff.displayStaffInfo();
      print('---');
    }
  }
}

// ---------------------------
// MAIN FUNCTION TO DEMONSTRATE ALL CONCEPTS
// ---------------------------
void main() {
  print('=== HOSPITAL MANAGEMENT SYSTEM ===');
  
  // Create hospital
  Hospital cityHospital = Hospital('City General Hospital');
  
  print('\n=== ENCAPSULATION DEMONSTRATION ===');
  Patient patient1 = Patient('P001', 'John Smith', 45, 'Male');
  patient1.displayPatientInfo();
  patient1.addMedicalRecord('Initial consultation');
  patient1.addToBill(100.0);
  patient1.payBill(50.0);
  
  Patient patient2 = Patient('P002', 'Mary Johnson', 32, 'Female', 200.0);
  patient2.displayPatientInfo();
  
  print('\n=== INHERITANCE DEMONSTRATION ===');
  Doctor cardiologist = Doctor('D001', 'Robert Brown', 'Cardiology', 15);
  cardiologist.displayStaffInfo();
  cardiologist.assignPatient('P001');
  cardiologist.prescribeMedication(patient1, 'Aspirin');
  
  Nurse headNurse = Nurse('N001', 'Sarah Wilson', 'Emergency Care', 'Night');
  headNurse.displayStaffInfo();
  headNurse.addWardResponsibility('ICU');
  headNurse.monitorPatient(patient2);
  
  print('\n=== POLYMORPHISM WITH MEDICAL STAFF ===');
  List<MedicalStaff> staffMembers = [
    Doctor('D002', 'Alice Green', 'Pediatrics', 8),
    Nurse('N002', 'Mike Davis', 'Surgical Ward', 'Day'),
    cardiologist,
    headNurse
  ];
  
  // Same method call, different implementations
  for (MedicalStaff staff in staffMembers) {
    staff.performDuty();
    staff.generateReport();
    print('---');
  }
  
  print('\n=== POLYMORPHISM WITH MEDICAL PROCEDURES ===');
  List<MedicalProcedure> procedures = [
    Surgery('Heart Bypass', 5000.0, 1.5, 4),
    DiagnosticTest('Blood Test', 50.0, 5, 25.0),
    TherapySession('Physical Therapy', 120.0, 45, 'Rehabilitation')
  ];
  
  // Same method call, different implementations
  for (MedicalProcedure procedure in procedures) {
    procedure.performProcedure(patient1);
    print('---');
  }
  
  print('\n=== HOSPITAL OPERATIONS ===');
  // Admit patients to hospital
  cityHospital.admitPatient(patient1);
  cityHospital.admitPatient(patient2);
  
  // Hire staff
  cityHospital.hireStaff(cardiologist);
  cityHospital.hireStaff(headNurse);
  
  // Display final status
  cityHospital.displayHospitalStatus();
  
  print('\n=== PATIENT FINAL STATUS ===');
  patient1.displayPatientInfo();
  print('Medical History: ${patient1.getMedicalHistory()}');
  
  print('\n=== COMPREHENSIVE DEMONSTRATION ===');
  // Demonstrate complex hospital workflow
  Doctor surgeon = Doctor('D003', 'Emma Thompson', 'Surgery', 20);
  Patient surgicalPatient = Patient('P003', 'David Lee', 58, 'Male');
  
  print('Surgical Procedure Workflow:');
  surgeon.prescribeMedication(surgicalPatient, 'Anesthesia');
  
  Surgery appendectomy = Surgery('Appendectomy', 3000.0, 1.2, 2);
  appendectomy.performProcedure(surgicalPatient);
  
  surgicalPatient.payBill(1000.0);
  
  print('\nFinal Patient Bill: \$${surgicalPatient.billAmount}');
  print('Medical Records: ${surgicalPatient.getMedicalHistory()}');
}
