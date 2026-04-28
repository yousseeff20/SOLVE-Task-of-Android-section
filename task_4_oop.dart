abstract class Skills {
  void programming();
  void communication();
}

class Person {
  String name;
  int _age;
  static String universityName = "Sohag University";

  Person(this.name, this._age);

  int get age => _age;

  set age(int value) {
    if (value > 0) {
      _age = value;
    }
  }
}

class Employee extends Person {
  double salary;

  Employee(String name, int age, this.salary) : super(name, age);

  void showInfo() {
    print("Name: $name");
    print("Age: $age");
    print("Salary: $salary");
  }
}

class Developer extends Employee implements Skills {
  Developer(String name, int age, double salary) : super(name, age, salary);

  @override
  void programming() {
    print("Developer is coding...");
  }

  @override
  void communication() {
    print("Developer communicates with the team.");
  }

  @override
  void showInfo() {
    print("=== Developer Info ===");
    super.showInfo();
  }
}

void main() {
  print("University: ${Person.universityName}");
  var dev = Developer("ziad", 22, 8000);

  dev.showInfo();
  dev.programming();
  dev.communication();
}
