class Category {
  late String titulo;
  late String subtitulo;
  late String url;

  Category({
    required this.titulo,
    required this.subtitulo,
    required this.url,
  });

  Category.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    subtitulo = json['subtitulo'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['subtitulo'] = this.subtitulo;
    data['url'] = this.url;
    return data;
  }
}
