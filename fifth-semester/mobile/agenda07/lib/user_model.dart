class UserModel {
  String? id;
  String nome;
  String email;
  String endereco;
  String nascimento;
  String senha;

  UserModel({
    this.id,
    required this.nome,
    required this.email,
    required this.endereco,
    required this.nascimento,
    required this.senha,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      nome: map['nome'] ?? '', 
      email: map['email'] ?? '',
      endereco: map['endereco'] ?? '',
      nascimento: map['nascimento'] ?? '',
      senha: map['senha'] ?? '',
    );
  }
}
