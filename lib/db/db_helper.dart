import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  initDB() async {
    String path = await getDatabasesPath();
    String dbName = 'kitchenguide.db';

    String dbPath = join(path, dbName);
    return await openDatabase(dbPath, version: 1, onCreate: onCreate);
  }

  Future<void> onCreate(Database  db, int version) async {
    await db.execute('''
    CREATE TABLE Categories (
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
    CREATE TABLE Profile (
      nome TEXT NOT NULL,
      email TEXT NOT NULL UNIQUE,
      urlImage TEXT NOT NULL
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
      ('Manteeeeeiga'),
      ('Tomate'),
      ('Açafrão');
    ''');

    await db.execute('''
    INSERT INTO Profile (nome, email, urlImage) VALUES
      ('Fulano de tal', 'example@gmail.com', 'assets/images/profile_person.jpg');
    ''');
  }
}