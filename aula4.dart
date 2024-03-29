void main() {
  Cliente paulo = Cliente(nome: "Paulo");
  Cliente andre = Cliente(nome: "Andre");
  print(paulo.toString());
  print(andre);
}

class Cliente {
  String? nome;         //late ?

  Cliente({this.nome});

  @override
  String toString(){
    return "Bom dia $nome.";
  }
}

-------------------------------------------------------------------------------------------

void main() {
  Cliente paulo = Cliente("Paulo");
  Cliente andre = Cliente("Andre");
  print(paulo.toString());
  print(andre);

  print(paulo.nome);
  paulo.nome = "Paulete";
  print(paulo.nome);
}

class Cliente {
  String? nome;        //late ?     publico

  Cliente({this.nome});

  @override
  String toString(){
    return "Bom dia $nome.";
  }
}

---------------------------------------------------------------------------------------------------

void main() {
  Cliente paulo = Cliente("Paulo");
  Cliente andre = Cliente("Andre");
  print(paulo.toString());
  print(andre);

  print(paulo._nome);
  paulo._nome = "Paulete";
  print(paulo._nome);
}

class Cliente {
  //String? nome;        late ?     publico
  final String? _nome;         //final (constante) _privado

  Cliente(this._nome);

  @override
  String toString(){
    return "Bom dia $_nome.";
  }
}

---------------------------- SET GET ------------------------------------------------

void main() {
  Cliente paulo = Cliente("Paulo");
  Cliente andre = Cliente("Andre");
  print(paulo.toString());
  print(andre);

  print(paulo.getNome);
  paulo.setNome = "Paulete";
  print(paulo.getNome);
}

class Cliente {
  //String? nome;        late ?     publico
  String? _nome;         //final (constante) _privado

  Cliente(this._nome);

  set setNome(n) => _nome = n;      // => {}
  String? get getNome => _nome;

  @override
  String toString(){
    return "Bom dia $_nome.";
  }
}

-------------------------------------------------------------------------------------------

void main() {
  Cliente paulo = Cliente("Paulo");
  Cliente andre = Cliente("Andre");
  print(paulo.toString());
  print(andre);

  print(paulo.getNome);
  paulo.setNome = "Paulete";

  print(andre.getNome);
  andre.setNome = "Andreza";

  paulo.informa("Paulete");
  andre.informa("Andreza");
}

class Cliente {
  //Atributos
  String? _nome;

  //Método construtor
  Cliente(this._nome);

  //Getters e Setters
  set setNome(n) => _nome = n;
  String? get getNome => _nome;

  //Métodos específicos
  void informa(String dado) {
    String maiuscula = dado.toUpperCase();
    String minuscula = dado.toLowerCase();
    int letras = dado.length;
    print("Maiúsculo: $maiuscula"+
         "\nMinúsculo: $minuscula"+
         "\nCaracteres: $letras");
  }

  //Método toString
  @override
  String toString(){
    return "Bom dia $_nome.";
  }
}
