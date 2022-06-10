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
''',
      '''
 INSERT INTO Excersize(question,answer,ex_id,course_id) VALUES

 ('set a question',false,0,0),
 ('set a question',false,1,0),
 ('set a question',false,2,0),
 
 ('set a question',false,3,1),
 ('set a question',false,4,1),
 ('set a question',false,5,1),

 ('set a question',false,6,2),
 ('set a question',false,7,2),
 ('set a question',false,8,2),

 ('set a question',false,9,3),
 ('set a question',false,10,3),
 ('set a question',false,11,3),

 ('set a question',false,12,4),
 ('set a question',false,13,4),
 ('set a question',false,14,4),

 ('set a question',false,15,5),
 ('set a question',false,16,5),
 ('set a question',false,17,5),

 ('set a question',false,18,6),
 ('set a question',false,19,6),
 ('set a question',false,20,6)
'''
    ]);
  }

  Future<void> deleteDatabase(String databaseName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, databaseName);
    await databaseFactory.deleteDatabase(path);
  }

  Future _createDB(Database db, int version) async {
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
  answer BOOLEAN NOT NULL,
  ex_id INT NOT NULL,
  course_id INT NOT NULL,
  PRIMARY KEY (ex_id),
  FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
''',
      '''
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
