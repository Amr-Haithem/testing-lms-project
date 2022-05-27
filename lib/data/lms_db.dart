import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MusicAppDB {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('lms.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    print(dbPath);
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    
    return await db.execute('''
CREATE TABLE Student
(
  name VARCHAR(255) NOT NULL,
  student_id INT NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (student_id)
);

CREATE TABLE professor
(
  name VARCHAR(255) NOT NULL,
  prof_id INT NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (prof_id)
);

CREATE TABLE Course
(
  name VARCHAR(255) NOT NULL,
  content VARCHAR(255) NOT NULL,
  course_id INT NOT NULL,
  prof_id INT NOT NULL,
  PRIMARY KEY (course_id),
  FOREIGN KEY (prof_id) REFERENCES professor(prof_id)
);

CREATE TABLE Excersize
(
  question VARCHAR(255) NOT NULL,
  answer VARCHAR(255) NOT NULL,
  ex_id INT NOT NULL,
  course_id INT NOT NULL,
  PRIMARY KEY (ex_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE enrolled_student_course
(
  quiz_grade INT NOT NULL,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE have_student_prof
(
  student_id INT NOT NULL,
  prof_id INT NOT NULL,
  PRIMARY KEY (student_id, prof_id),
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (prof_id) REFERENCES professor(prof_id)
);
    ''');
  }

  Future deleteATable(Database db, String tableName) async {
    await db.execute("DROP TABLE IF EXISTS $tableName");
  }

  

  Future close() async {
    final db = await database;
    db.close();
  }
}
