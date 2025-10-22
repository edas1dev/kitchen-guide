import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? databaseConnection;

  static initDB() async {
    if (databaseConnection != null) {
      return databaseConnection;
    }
    String path = await getDatabasesPath();
    String dbName = 'kitchenguide.db';

    String dbPath = join(path, dbName);
    databaseConnection = await openDatabase(dbPath, version: 1, onCreate: onCreate);
    return databaseConnection!;
  }

  static Future<void> onCreate(Database  db, int version) async {
    await db.execute('''
    CREATE TABLE Categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      titulo TEXT NOT NULL,
      subtitulo TEXT NOT NULL,
      url TEXT NOT NULL
    );
    ''');

    await db.execute('''
    CREATE TABLE PopularTags (
      nome TEXT NOT NULL
    );
    ''');

    await db.execute('''
    CREATE TABLE RecentTags (
      nome TEXT NOT NULL UNIQUE,
      createdAt INTEGER NOT NULL
    );
    ''');

    await db.execute('''
    CREATE TABLE Profile (
      nome TEXT NOT NULL,
      email TEXT NOT NULL UNIQUE,
      password TEXT NOT NULL UNIQUE,
      urlImage TEXT NOT NULL
    );
    ''');

    await db.execute('''
    CREATE TABLE Recipes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      kcal TEXT NOT NULL,
      time TEXT NOT NULL,
      image TEXT NOT NULL,
      bookmarked INTEGER NOT NULL DEFAULT 0
    );
    ''');

    await db.execute('''
    INSERT INTO Categories (titulo, subtitulo, url) VALUES
      ('Nível de Habilidade', 'Fácil, Médio, Avançado', 'assets/images/categories/cat1.png'),
      ('Tempo de Receita', 'Abaixo de 30 min, 1 hora ou mais', 'assets/images/categories/cat2.png'),
      ('Dieta', 'Vegetariano, Não Vegano, Vegano', 'assets/images/categories/cat3.png'),
      ('Culinária', 'Indiano, Chinesa, Italiana e mais', 'assets/images/categories/cat4.png'),
      ('Cursos', 'Aperitivos, Pratos Principais e mais', 'assets/images/categories/cat5.png'),
      ('Comida Saudável', 'Baixo em calorias e mais', 'assets/images/categories/cat6.png');
    ''');

    await db.execute('''
    INSERT INTO PopularTags (nome) VALUES
      ('Leite'),
      ('Ovos'),
      ('Pão'),
      ('Frango'),
      ('Cebola'),
      ('Manteiga'),
      ('Tomate'),
      ('Açafrão');
    ''');

    await db.execute('''
    INSERT INTO RecentTags (nome, createdAt) VALUES
      ('Cenoura', 1),
      ('Milho', 2);
    ''');

    /*await db.execute('''
    INSERT INTO Profile (nome, email, password, urlImage) VALUES
      ('admin', 'admin@', '123', 'assets/images/default_pfp.jpg');
    ''');*/

    await db.execute('''
    INSERT INTO recipes (title, kcal, time, image, bookmarked) VALUES
      ('Omelete de Legumes', '180 kcal', '10 min', 'assets/images/recipes/omelete.jpg', 1),
      ('Macarrão Alho e Óleo', '320 kcal', '15 min', 'assets/images/recipes/macarrao.jpg', 1),
      ('Bolo de Cenoura', '280 kcal', '55 min', 'assets/images/recipes/bolo.jpg', 0),
      ('Espaguete de Abobrinha', '280 kcal', '15 min', 'assets/images/recipes/espaguete.jpg', 0),
      ('Salada de Frango', '130 kcal', '20 min', 'assets/images/recipes/salada.jpg', 0),
      ('Wrap de Frango', '300 kcal', '20 min', 'assets/images/recipes/wrap.jpg', 0);
    ''');
  }
}