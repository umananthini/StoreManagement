import 'package:shared_preferences/shared_preferences.dart';

class helperfunction {
  static String sharedPreferenceToken = "Token";
  static String sharedPreferenceuserloggedin = "userloggedin";
  static String LoginUsername = "Loginusername";
  static String LoginBranch = "Loginbranch";
  static String LoginPassword = "Loginpassword";
  static String LoginDatabase = "Logindatabase";

//get //

  static Future<String?> getloginUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(LoginUsername);
  }

  static Future<String?> getloginpassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(LoginPassword);
  }

  static Future<String?> getLoginBranch() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(LoginBranch);
  }

  static Future<String?> getLoginDatabase() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(LoginDatabase);
  }

//clear//

  static clearLoginBranch() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove(LoginBranch);
  }

  static clearloginpassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove(LoginPassword);
  }

  static clearusername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove(LoginUsername);
  }

  static clearloginDatabase() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove(LoginDatabase);
  }

//Save//

  static Future<bool> loginusernameSharedPreference(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(LoginUsername, name);
  }

  static Future<bool> LoginBranchSharedPreference(String branch) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(LoginBranch, branch);
  }

  static Future<bool> LoginPasswordSharedPreference(String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(LoginPassword, password);
  }

  static Future<bool> LoginDatabaseSharedPreference(String database) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(LoginDatabase, database);
  }

  static Future<bool> saveTokenSharedPreference(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceToken, token);
  }

  static Future<bool> saveloggedinSharedPreference(bool login) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(sharedPreferenceuserloggedin, login);
  }

  static Future<bool?> getloggedinSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(sharedPreferenceuserloggedin);
  }
}
