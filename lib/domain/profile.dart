class Profile {
  late String nome;
  late String email;
  late String password;
  late String urlImage;

  Profile({
    required this.nome,
    required this.email,
    required this.password,
    required this.urlImage,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    password = json['password'];
    urlImage = json['urlImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['password'] = this.password;
    data['urlImage'] = this.urlImage;
    return data;
  }
}
