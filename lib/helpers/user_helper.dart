import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

String userTable = "userTable";
String idColumn = "idColumn";
String usernameColumn = "usernameColumn";
String emailColumn = "emailColumn";
String phoneColumn = "phoneColumn";
String imgColumn = "imgColumn";
String addressColumn = "addressColumn";
String birthdayColumn = "birthdayColumn";
String confirmEmailColumn = "confirmEmailColumn";
String confirmPasswordColumn = "confirmPasswordColumn";
String passwordColumn = "passwordColumn";
String cityColunm = "cityColumn";
String stateColunm = "stateColumn";
String countryColunm = "countryColumn";


class UserHelper{
  UserHelper.internal();

  static final UserHelper _instance = UserHelper.internal();

  factory UserHelper() => _instance;

  Database? _db;

  Future<Database?> get db async {
    if(_db != null){
      return _db;
    }else{
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = p.join(databasePath, "usersnew.db");

    return await openDatabase(path, version: 1, onCreate: (db, newerVersion) async {
      await db.execute("CREATE TABLE $userTable($idColumn INTEGER PRIMARY KEY, $usernameColumn TEXT, $emailColumn TEXT,"
      "$phoneColumn TEXT, $imgColumn TEXT, $addressColumn TEXT, $birthdayColumn TEXT, $confirmEmailColumn TEXT"
      "$confirmPasswordColumn TEXT, $passwordColumn TEXT, $cityColunm TEXT, $stateColunm TEXT, $countryColunm TEXT)"
      );
    },); 
  }

  //Recebe e salva o contato
  Future<Users> saveUser(Users users) async {
    Database? dbUser = await db;//obtêm o banco de dados
    users.id = await dbUser!.insert(userTable, users.toMap());//insere um contato na tabela userTable
    return users;
  }

  Future<Users?> getUsers(int id) async {
    Database? dbUser = await db;
    List<Map> maps = await dbUser!.query(
      userTable,
      columns: [
        idColumn,
        usernameColumn,
        emailColumn,
        confirmEmailColumn,
        phoneColumn,
        imgColumn,
        addressColumn,
        birthdayColumn,
        passwordColumn,
        confirmPasswordColumn,
        cityColunm,
        stateColunm,
        countryColunm,
      ],
      where: "$idColumn = ?",
      whereArgs: [id],
    );
    if(maps.isNotEmpty){
      return Users.fromMap(maps.first);
    }else{
      return null;
    }
  }

}

class Users {
  Users();

  int? id;
  String? username;
  String? phone;
  String? email;
  String? confirmEmail;
  String? img;
  String? address;
  String? birthday;
  String? password;
  String? confirmPassword;
  String? city;
  String? state;
  String? country;

  Users.fromMap(Map map){
    id = map[idColumn];
    username = map[usernameColumn];
    phone = map[phoneColumn];
    email = map[emailColumn];
    confirmEmail = map[confirmEmail];
    img = map[imgColumn];
    address = map[addressColumn];
    birthday = map[birthdayColumn];
    password = map[passwordColumn];
    confirmPassword = map[confirmPassword];
    city = map[cityColunm];
    state = map[stateColunm];
    country = map[countryColunm];
  }

  Map<String,dynamic> toMap() {
    Map<String, dynamic> map = {
      usernameColumn: username,
      phoneColumn: phone,
      emailColumn: email,
      confirmEmailColumn: confirmEmail,
      imgColumn: img,
      addressColumn: address,
      birthdayColumn: birthday,
      passwordColumn: password,
      confirmPasswordColumn: confirmPassword,
      cityColunm: city,
      stateColunm: state,
      countryColunm: country,
    };
    if(id != null) {
      map[idColumn] = id;
    }
    return map;
  }

}