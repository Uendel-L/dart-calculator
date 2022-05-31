// Calculadora em Dart - By Uendel Costa Lima
import 'dart:io';

class Calculadora {
    dynamic number1;
    dynamic number2;
    dynamic operator;

    Calculadora({this.number1=null, this.number2=null, this.operator=null}){
    }

    double operation(number1, number2, operator){
      if (operator == '+'){
        return number1 + number2;
      }

      else if (operator == '-'){
        return number1 - number2;
      }
      
      else if (operator == '/'){
        return number1 / number2;
      }

      else{
        return number1 * number2;
      }
    }

}
try_catch_int(){
  try{
    print("Por favor, digite a opção desejada: ");
    String? s = stdin.readLineSync();
    if (s != null){
      int n = int.parse(s);
      return n;
    }
  }on Exception {
    print("Apenas números são válidos!");
    return try_catch_int();
  }
}

try_catch_double(int number){
  String aux = "";
  if (number == 1){
    aux = "primeiro";
  }else{
    aux = "segundo";
  }
  try{
    print("Por favor, digite o $aux número: ");
    String? s = stdin.readLineSync();
    if (s != null){
      double n = double.parse(s);
      return n;
    }
  }on Exception {
    print("Apenas números são válidos!");
    return try_catch_double(number);
  }
}

dynamic getnumbers(){
  dynamic x = [];
  x.add(try_catch_double(1));
  x.add(try_catch_double(2));
  return x;
}

void main() {
  Calculadora calc = Calculadora();

  print("---------------------------------------");
  print("Bem vindo à sua calculadora");
  print("---------------------------------------");

  while (true) {
      print("\n---------------------------------------");
      print("""Por favor, Digite uma opção para prosseguirmos: 
      Para SOMAR, digite 1\n
      Para SUBTRAIR, digite 2\n
      Para DIVIDIR, digite 3\n
      Para MULTIPLICAR, digite 4\n
      Para SAIR, digite 0\n""");
      print("---------------------------------------");
      int opcao = try_catch_int();

      if (opcao == 1){
        dynamic x = getnumbers();
        print("A soma entre ${x[0]} e ${x[1]} é igual a: ${calc.operation(x[0],x[1],'+')}");
      }

      else if (opcao == 2){
        dynamic x = getnumbers();
        print("A subtração entre ${x[0]} e ${x[1]} é igual a: ${calc.operation(x[0],x[1],'-')}");
      }

      else if (opcao == 3){
        dynamic x = getnumbers();
        print("A divisão entre ${x[0]} e ${x[1]} é igual a: ${calc.operation(x[0],x[1],'/')}");
      }

      else if (opcao == 4){
        dynamic x = getnumbers();
        print("A multiplicação entre ${x[0]} e ${x[1]} é igual a: ${calc.operation(x[0],x[1],'*')}");
      }

      else if (opcao == 0){
        print("Encerrando calculadora...");
        break;
      }

      else{
        print("Opção inválida, as opções são de 0 a 4");
      }
  }
}