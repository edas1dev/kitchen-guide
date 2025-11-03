class Category {
  late String titulo;
  late String subtitulo;
  late String url;
  late List<String> query;

  Category({
    required this.titulo,
    required this.subtitulo,
    required this.query,
    required this.url,
  });

  Category.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    subtitulo = json['subtitulo'];
    query = json['query'].cast<String>();
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['subtitulo'] = this.subtitulo;
    data['query'] = this.query;
    data['url'] = this.url;
    return data;
  }
}
