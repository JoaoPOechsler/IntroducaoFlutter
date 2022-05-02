enum Sexo { MASCULINO, FEMININO }

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  int? idade;
  Sexo? sexo;

  int? getIdade() {
    if (nascimento == null) {
      return null;
    }
    final hoje = DateTime.now();
    final idade = hoje.difference(nascimento!);
    return idade.inDays ~/ 365;
  }

  @override
  String toString() {
    return "nome=$nome, cpf=$cpf, nascimento$nascimento, idade=${getIdade()}, "
        "sexo=$sexo";
  }

}

class Programador extends Pessoa {
  double? salario;

  @override
  String toString() {
    return "nome=$nome, cpf=$cpf, nascimento$nascimento, idade=$idade, "
        "sexo=$sexo, salario=$salario";
  }
}

void mainEntidades() {
  Pessoa pessoa = Programador();
  pessoa.nome = "João";
  pessoa.cpf = "060.275.489-59";
  pessoa.nascimento = DateTime(2003, 07, 24);
  pessoa.idade = 18;
  pessoa.sexo = Sexo.MASCULINO;

  print(pessoa.toString());
}