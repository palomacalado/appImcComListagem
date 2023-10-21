import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Pessoa {
  @HiveField(0)
  String nome = "";
  @HiveField(1)
  double peso = 0;
  @HiveField(2)
  double altura = 0;
  @HiveField(3)
  String imc = "";

  Pessoa(this.nome, this.peso, this.altura, this.imc);

  String getNome() {
    return nome;
  }

  double getPeso() {
    return peso;
  }

  double getAltura() {
    return altura;
  }

  String getIMC() {
    return imc;
  }

  void setIMC(String imcEntrada) {
    imc = imcEntrada;
  }
}

@HiveType(typeId: 1)
class PessoaAdapter extends TypeAdapter<Pessoa> {
  @override
  final int typeId = 1; // O typeId deve ser único para cada adaptador

  @override
  Pessoa read(BinaryReader reader) {
    return Pessoa(
      reader.read(),
      reader.read(),
      reader.read(),
      reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Pessoa obj) {
    writer.write(obj.nome);
    writer.write(obj.altura);
    writer.write(obj.peso);
    writer.write(obj.imc);
  }
}
