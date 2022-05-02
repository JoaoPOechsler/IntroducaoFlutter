enum Sexo { MASCULINO, FEMININO }

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  int? idade;
  Sexo? sexo;
  double? salario;
  bool? programador;

  @override
  String toString() {
    return "nome=$nome, cpf=$cpf, nascimento$nascimento, idade=$idade, "
        "sexo=$sexo, salario.$salario, programador=$programador";
  }

}

void mainEntidades() {
  Pessoa pessoa = Pessoa();
  pessoa.nome = "João";
  pessoa.cpf = "060.275.489-59";
  pessoa.nascimento = DateTime(2003, 07, 24);
  pessoa.idade = 18;
  pessoa.sexo = Sexo.MASCULINO;
  pessoa.salario = 10000.09;
  pessoa.programador = true;

  print(pessoa.toString());
}