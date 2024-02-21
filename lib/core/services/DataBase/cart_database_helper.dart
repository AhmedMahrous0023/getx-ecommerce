import 'package:ecommerce_getx/constance.dart';
import 'package:ecommerce_getx/model/cart_product_model.dart';
import 'package:ecommerce_getx/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await  initDb();
    return _database!;
  }

 Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'CartProductdb');
   Database database = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE $tableCartProduct(
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL,
      $columnProductId TEXT NOT NULL)
      ''');
    });
    return database;
  }

  Future<List<CartProductModel>> getAllProduct()async{
       try {
      var dbClient = await database;
      List<Map> maps = await dbClient.query(tableCartProduct);

      List<CartProductModel> list = maps.isNotEmpty
          ? maps.map((product) => CartProductModel.fromJson(product)).toList()
          : [];
      return list;
    } catch (e) {
      print("Error fetching products: $e");
      return [];
    }
  }

  insert(CartProductModel model) async {
    try {
      var dbClient = await database;
      await dbClient.insert(
        tableCartProduct,
        model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Error inserting product: $e");
    }
  }

  updateProduct(CartProductModel model)async{
      var dbClient = await database;
      return await dbClient.update(tableCartProduct, model.toJson(),where:'$columnProductId =?' ,whereArgs: [model.productId] );
  }

   Future<void> deleteAllProducts() async {
    final dbClient = await database;
    await dbClient.delete(tableCartProduct);
  }

   Future<void> close() async {
    var dbClient = await database;
    await dbClient.close();
  }
}
