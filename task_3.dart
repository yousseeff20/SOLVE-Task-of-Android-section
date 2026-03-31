void main() {
  Set<String> students = {"usef", "shaza"};

  addStudent(students, "Ashraf");
  addStudent(students, "usef");

  print("Students (FCIA):");
  students.forEach((s) => print(s));

  print("\nStudents (Recursion):");
  printStudentsRecursively(students.toList(), 0);

  Set<String> newStudents = {"Ahmed", "Fouad"};
  students = {...students, ...newStudents};

  print("\nMerged Students:");
  students.forEach((s) => print(s));

  Map<String, List<double>> studentCourses = {};

  addCourse(studentCourses, "usef", "Math", 80);
  addCourse(studentCourses, "usef", "Science", 90);
  addCourse(studentCourses, "shaza", "Math", 100);

  print("\nAverages:");
  students.forEach((student) {
    double avg = averageGrade(studentCourses, student);
    print("$student: $avg");
  });
}

void addStudent(Set<String> students, String name) {
  students.add(name);
}

void printStudentsRecursively(List<String> list, int index) {
  if (index >= list.length) return;
  print(list[index]);
  printStudentsRecursively(list, index + 1);
}

void addCourse(
  Map<String, List<double>> map,
  String student,
  String course, [
  double grade = 0,
]) {
  map.putIfAbsent(student, () => []);
  map[student]!.add(grade);
}

double averageGrade(Map<String, List<double>> map, String student) {
  var grades = map[student];
  if (grades == null || grades.isEmpty) return 0;

  double sum = grades.reduce((a, b) => a + b);
  return sum / grades.length;
}
