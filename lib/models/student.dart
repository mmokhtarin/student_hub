class Student {
  final String id;
  final String name;
  final String matricNumber;
  final String programme;
  final String email;
  final double cgpa;
  final int semester;

  const Student({
    required this.id,
    required this.name,
    required this.matricNumber,
    required this.programme,
    required this.email,
    required this.cgpa,
    required this.semester,
  });
}

final List<Student> sampleStudents = [
  const Student(
    id: '1',
    name: 'Muhammad Mokhtarin',
    matricNumber: '105256',
    programme: 'Software Engineering',
    email: '105256@siswa.unimas.my',
    cgpa: 3.90,
    semester: 5,
  ),
  const Student(
    id: '2',
    name: 'Nur Damia Syazana',
    matricNumber: '102833',
    programme: 'Software Engineering',
    email: '102833@siswa.unimas.my',
    cgpa: 4.00,
    semester: 5,
  ),
  const Student(
    id: '3',
    name: 'Fernandez Rugu',
    matricNumber: '104184',
    programme: 'Software Engineering',
    email: '104184@siswa.unimas.my',
    cgpa: 3.85,
    semester: 5,
  ),
  const Student(
    id: '4',
    name: 'Danial Naseem Iman',
    matricNumber: '103768',
    programme: 'Software Engineering',
    email: '103768@siswa.unimas.my',
    cgpa: 4.00,
    semester: 5,
  ),
  const Student(
    id: '5',
    name: 'Ahmad Haziq Irfan',
    matricNumber: '103121',
    programme: 'Software Engineering',
    email: '103121@siswa.unimas.my',
    cgpa: 3.60,
    semester: 5,
  ),
  const Student(
    id: '6',
    name: 'Johan Semit',
    matricNumber: '060703',
    programme: 'Data Engineering',
    email: '060703@siswa.unimas.my',
    cgpa: 3.88,
    semester: 6,
  ),
  const Student(
    id: '7',
    name: 'Kimi Anak toli',
    matricNumber: '121213',
    programme: 'Motorsport Engineering',
    email: '121213@siswa.unimas.my',
    cgpa: 3.67,
    semester: 2,
  ),
  const Student(
    id: '8',
    name: 'George Rusli',
    matricNumber: '445566',
    programme: 'Information Systems',
    email: '445566@siswa.unimas.my',
    cgpa: 3.95,
    semester: 6,
  ),
  const Student(
    id: '9',
    name: 'Liwis Hamilton',
    matricNumber: '998877',
    programme: 'Network Computing',
    email: '998877@siswa.unimas.my',
    cgpa: 3.60,
    semester: 4,
  ),
  const Student(
    id: '10',
    name: 'Max verstopper',
    matricNumber: '112233',
    programme: 'Aerospace Engineering',
    email: '112233@siswa.unimas.my',
    cgpa: 3.78,
    semester: 3,
  ),
];
