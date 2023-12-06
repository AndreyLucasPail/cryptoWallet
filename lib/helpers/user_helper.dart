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
      "$phoneColumn TEXT, $imgColumn TEXT, $addressColumn TEXT, $birthdayColumn TEXT, $confirmEmailColumn TEXT,"
      "$confirmPasswordColumn TEXT, $passwordColumn TEXT, $cityColunm TEXT, $stateColunm TEXT, $countryColunm TEXT)"
      );
    },); 
  }

  //Recebe e salva o usuario
  Future<Users> saveUser(Users users) async {
    Database? dbUser = await db;//obtêm o banco de dados
    users.id = await dbUser!.insert(userTable, users.toMap());//insere um usuario na tabela userTable
    return users;
  }

  Future<Users?> getUsers(int id) async {
    Database? dbUser = await db;
    List<Map<String, dynamic>> maps = await dbUser!.query(
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

  Future<int> deleteUser(int id) async {
    Database? dbUser = await db;
    return await dbUser!.delete(userTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int?> updateUser(Users user) async {
    Database? dbUser = await db;
    return await dbUser!.update(
      userTable, 
      user.toMap(),
      where: "$idColumn = ?",
      whereArgs: [user.id],
    );
  }

  Future<List> getAllUsers() async {
    Database? dbUser = await db;

    List listMap = await dbUser!.rawQuery("SELECT * FROM $userTable");
    List<Users> listUsers = [];
    for(Map<String, dynamic> m in listMap){
      listUsers.add(Users.fromMap(m));
    }
    return listUsers;
  }

  Future close() async {
    Database? dbUser = await db;
    dbUser!.close();
  }

}

class Users {
  Users(
    {this.id,
    required this.username,
    required this.phone,
    required this.email,
    required this.confirmEmail,
    required this.img,
    required this.address,
    required this.birthday,
    required this.password,
    required this.confirmPassword,
    required this.city,
    required this.state,
    required this.country,}
  );

  int? id = 0;
  String username = "";
  String phone = "";
  String email = "";
  String confirmEmail = "";
  String img = "";
  String address = "";
  String birthday = "";
  String password = "";
  String confirmPassword = "";
  String city = "";
  String state = "";
  String country = "";

  factory Users.fromMap(Map<String, dynamic> map){
    return Users(
      id: map[idColumn],
      username: map[usernameColumn],
      phone: map[phoneColumn],
      email: map[emailColumn],
      confirmEmail: map[confirmEmailColumn],
      img: map[imgColumn],
      address: map[addressColumn],
      birthday: map[birthdayColumn],
      password: map[passwordColumn],
      confirmPassword: map[confirmPasswordColumn],
      city: map[cityColunm],
      state: map[stateColunm],
      country: map[countryColunm],
    );
  }

  Map<String,dynamic> toMap() {
    return {
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
  }

  @override
  String toString() {
    return "Contact(id: $id, name: $username, email: $email, confirmemail: $confirmEmail, phone: $phone, img: $img, address: $address,"
    "birthday: $birthday, password: $password, city: $city, state: $state, country: $country)";
  }

}