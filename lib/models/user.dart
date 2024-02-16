class User {
  final String? id;
  final String name;
  final String email;
  //final double valor;
  final String avatarUrl;

  const User({
    this.id,
    required this.name,
    required this.email,
    //required this.valor,
    required this.avatarUrl,
  });
}
