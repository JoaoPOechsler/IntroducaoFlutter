enum Sexo { MASCULINO, FEMININO }

Sexo? strToSexo(String? str) {
  if (str == null) {
    return null;
  }
  switch (str.toUpperCase()) {
    case 'MASCULINO':
    case 'M':
      return Sexo.MASCULINO;
    case 'FEMININO':
    case 'F':
      return Sexo.FEMININO;
  }
}

class Pessoa {
  String? nome;
  String? cpf;
  DateTime? nascimento;
  int? idade;
  Sexo? sexo;

  Pessoa(this.nome, this.cpf, this.nascimento, this.sexo);

  Pessoa.fromMap(Map<String, String> map) {
    nome = map['nome'];
    cpf = map['cpf'];
    nascimento = DateTime.parse(map["nascimento"] ?? "2000-01-01");
    idade = int.parse(map["idade"] ?? "00");
    sexo = strToSexo(map['sexo']);
  }

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

  Programador(
      String? nome, String? cpf, DateTime? nascimento, Sexo? sexo, this.salario)
      : super(nome, cpf, nascimento, sexo);

  Programador.fromMap(Map<String, String> map) : super.fromMap(map) {
    salario = double.tryParse(map[salario] ?? "0.0");
  }

  @override
  String toString() {
    return "nome=$nome, cpf=$cpf, nascimento$nascimento, idade=$idade, "
        "sexo=$sexo, salario=$salario";
  }
}

void mainEntidades() {
  final map = {
    'nome': 'Joao',
    'nascimento': '2003-07-24',
    'sexo': 'M',
    'salario': '10000.0'
  };

  Pessoa pessoa = Programador.fromMap(map);

  // Programador pessoa = Programador();
  // pessoa.nome = "João";
  // pessoa.cpf = "060.275.489-59";
  // pessoa.nascimento = DateTime(2003, 07, 24);
  // pessoa.idade = 18;
  // pessoa.sexo = Sexo.MASCULINO;
  // pessoa.salario = isBoss ? 20000.0 : 10000.0;

  // print(pessoa.toString());

  List<String> nomes = ['Carlos', 'João', 'Samuel', 'Antonio', 'Cleiton'];

  // FOR tradicional estilo PHP/Java
  for (int i = 0; i < nomes.length; i++) {
    if (nomes[i].toUpperCase().startsWith('S')) {
      break;
    }
    print("$i = ${nomes[i]}");
  }
}
