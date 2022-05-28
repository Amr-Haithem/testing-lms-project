import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LmsDB {
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

  Future _sqlStatementsExecuter(Database db, List<String> statements) async {
    for (var statement in statements) {
      await db.execute(statement);
    }
  }

  Future _intializeConstants(Database db) async {
   await _sqlStatementsExecuter(db, [
      '''
INSERT INTO Student(name,student_id,user_name,password) VALUES
 ('amr haithem',0,'amr','amor'),
 ('omar banna',1,'omar','amor');
''',
      '''
 INSERT INTO professor(name,prof_id,user_name,password) VALUES
 ('shehab',0,'shehab','sheba'),
 ('Hekal',1,'hekal','hekal');''',
      '''
 INSERT INTO Course(name,content,course_id,prof_id) VALUES
 ('vibration and waves','no content yet',0,0),
 ('Logic design','no content yet',1,0),
 ('Signals and systems','no content yet',2,0),
 ('programming','no content yet',3,1),
 ('Advanced programming','no content yet',4,1),
 ('Embedded systems','no content yet',5,1),
 ('Literature and love','no content yet',6,0);
'''
    ]);
  }

  Future testFunction(Database db) async {
    dynamic data = await db.query('Course');
    print(data);
  }

  Future<void> deleteDatabase(String databaseName) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, databaseName);
    await databaseFactory.deleteDatabase(path);
  }

  Future _createDB(Database db, int version) async {
    print('meow');
    await _sqlStatementsExecuter(db, [
      '''CREATE TABLE Student
(
  name VARCHAR(255) NOT NULL,
  student_id INT NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (student_id)
);''',
      '''
CREATE TABLE professor
(
  name VARCHAR(255) NOT NULL,
  prof_id INT NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (prof_id)
);
''',
      '''
CREATE TABLE Course
(
  name VARCHAR(255) NOT NULL,
  content VARCHAR(255) NOT NULL,
  course_id INT NOT NULL,
  prof_id INT NOT NULL,
  PRIMARY KEY (course_id),
  FOREIGN KEY (prof_id) REFERENCES professor(prof_id)
);''',
      '''
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
''',
      '''
CREATE TABLE have_student_prof
(
  student_id INT NOT NULL,
  prof_id INT NOT NULL,
  PRIMARY KEY (student_id, prof_id),
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (prof_id) REFERENCES professor(prof_id)
);'''
    ]);
    _intializeConstants(db);
  }

  Future deleteATable(Database db, String tableName) async {
    await db.execute("DROP TABLE IF EXISTS $tableName");
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
