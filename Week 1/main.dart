void main() async {
  print("Hello World!");

  // few data types
  int age = 10;
  String name = "Abdullah";
  Map<String, String> address = {
    "city": "Karachi",
    "country": "Pakistan",
  };

  // above information can be written in a record like this
  var myRecord = (
    name: "Abdullah",
    age: 10,
    address: {
      "city": "Karachi",
      "country": "Pakistan",
    }
  ); // not a map

  print(myRecord.name);

  // interpolated string
  print(
      "My name is $name and I am $age years old. Address: $address. Decode it yourself.");

  // nullable data type
  int? nullableAge = null;
  // few null operators
  print(nullableAge ?? 0); // same as: nullableAge != null ? nullableAge : 0
  print(nullableAge
      ?.isOdd); // provides safe access to nullableAge.isOdd. in other languages program would probably crash here

  // lists
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);
  for (var number in numbers) {
    print(number);
  }
  // spread operator
  List<int> moreNumbers = [...numbers, 6, 7, 8, 9, 10];
  print(moreNumbers);

  // consuming stream function
  print("Consuming stream function");
  await for (var number in myStream(10)) {
    print(number);
  }
  streamConsumer(myStream(10));
  streamConsumer(myStream(10)); 

  // school
  var school = School<Student>([]);
  school.addStudent(Student("Abdullah", 10, "The Educators"));
  school.addStudent(Student("Ali", 10, "The Educators"));
  print(school.students);
}

int sum(int a, int b) {
  return a + b;
}

// arrow function
int sum2(int a, int b) => a + b;

// optional parameters
int sum3(int a, [int? b]) => a + (b ?? 0);

// async stream function
Stream<int> myStream(int upto) async* {
  for (int i = 0; i < upto; i++) {
    yield i;
  }
}

void streamConsumer(Stream<int> stream) {
  stream.listen((event) {
    print(event);
  });
}

class Person {
  String name;
  int age;
  Person(this.name, this.age);
}

// inheritance
class Student extends Person {
  String school;
  Student(String name, int age, this.school) : super(name, age);

  @override
  String toString() {
    return "Student: $name, $age, $school";
  }
}

// teacher
class Teacher extends Person {
  String subject;
  Teacher(String name, int age, this.subject) : super(name, age);
}

// generics
class School<T extends Person> {
  List<T> students = [];
  // staff room
  // let's say for now that only teachers are allowed
  StaffRoom<Teacher> staffRoom = StaffRoom<Teacher>([]);
  // this fails
  // StaffRoom<Student> staffRoomFailed = StaffRoom<Student>([]);
  School(this.students);
  void addStudent(T student) {
    students.add(student);
  }
}

// staff room
// let's say for now that only teachers are allowed
class StaffRoom<T extends Teacher> {
  List<T> staff = [];
  StaffRoom(this.staff);
  void addStaff(T staff) {
    this.staff.add(staff);
  }
}
