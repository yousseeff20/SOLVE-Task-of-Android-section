import 'dart:io';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  stdout.write("Enter number of students: ");
  int numStudents = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < numStudents; i++) {
    stdout.write("Enter student name: ");
    String name = stdin.readLineSync()!;

    stdout.write("Enter number of subjects: ");
    int numSubjects = int.parse(stdin.readLineSync()!);

    List<double> grades = [];

    for (int j = 0; j < numSubjects; j++) {
      stdout.write("Enter grade for subject ${j + 1}: ");
      double grade = double.parse(stdin.readLineSync()!);
      grades.add(grade);
    }

    studentNames.add(name);
    studentGrades.add(grades);
  }

  while (true) {
    print("\n===== MENU =====");
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");

    stdout.write("Choose option: ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      for (int i = 0; i < studentNames.length; i++) {
        double avg =
            studentGrades[i].reduce((a, b) => a + b) / studentGrades[i].length;

        String grade;
        if (avg >= 90) {
          grade = "A";
        } else if (avg >= 80) {
          grade = "B";
        } else if (avg >= 70) {
          grade = "C";
        } else {
          grade = "F";
        }

        print(
          "${studentNames[i].toUpperCase()} - Average: ${avg.toStringAsFixed(2)} - Grade: $grade",
        );
      }
    } else if (choice == 2) {
      stdout.write("Enter student name: ");
      String search = stdin.readLineSync()!;

      int index = studentNames.indexWhere(
        (element) => element.toLowerCase() == search.toLowerCase(),
      );

      if (index == -1) {
        print("Student not found");
      } else {
        double avg =
            studentGrades[index].reduce((a, b) => a + b) /
            studentGrades[index].length;

        print("Average grade: ${avg.round()}");
      }
    } else if (choice == 3) {
      print("Program ended");
      break;
    } else {
      print("Invalid option");
    }
  }
}
