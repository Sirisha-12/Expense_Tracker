import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DbHelper {
  late Box box;
  late SharedPreferences preferences;
  DbHelper() {
    openBox();
  }
  openBox() {
    box = Hive.box('money');
  }

  Future deleteData(int index) async {
    await box.deleteAt(index);
  }

  Future addData(int amount, String note, String type, DateTime date) async {
    var value = {
      "amount": amount,
      "note": note,
      "type": type,
      "date": date,
    };
    box.add(value);
  }

  addName(String name) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString("name", name);
  }

  getName() async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getString('name');
  }
}
