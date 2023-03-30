void main() {
  repeteFrase(0, 10, "será que funciona?");
  
}

void repeteFrase(int i, int y, String text) {
 for(i; i < y; i++){
    print(text);
 } 
}
//_______________________________________________________

void main() {
  repeteFrase(text: "olá", i: 0, y: 10);
  
}

void repeteFrase({int? i, int? y, String? text}) {
 //for(i; i < y; i++){
   // print(text);
 //} 
  print(i ?? 10);
  print(y ?? 1000);
  print(text ?? "veio nada");

}
//_____________segunda parte________________________

void main(){
  Cliente cli1 = Cliente("Osmar Contato", "000.000.000-00");
  print(cli1);
  Cliente cli2 = Cliente("Fabíola Mendes", "011.011.011-01");
  print(cli2);
}


class Cliente {
  //atributos
  late String nome;
  late String cpf;
  
  //métodos
  Cliente(this.nome, this.cpf);
  
  @override 
  String toString(){
     return "Nome: $nome\n"+
             "CPF: $cpf";
   }
}
