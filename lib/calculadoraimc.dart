String calculateIMC(String nome, double altura, double peso) {
  double x = (altura / 100);
  double imc = peso / (x * x);
  imc = double.parse(imc.toStringAsFixed(2));

  if (imc < 16) {
    return ("$nome você está com $imc de imc, MAGREZA GRAVE");
  } else if (imc > 16 && imc < 17) {
    return ("$nome você está com $imc de imc, MAGREZA MODERADA");
  } else if (imc > 17 && imc < 18.5) {
    return ("$nome você está com $imc de imc, MAGREZA LEVE");
  } else if (imc > 18.5 && imc < 25) {
    return ("$nome você está com $imc de imc, SAUDÁVEL");
  } else if (imc > 25 && imc < 30) {
    return ("$nome você está com $imc de imc, SOBREPESO");
  } else if (imc > 30 && imc < 35) {
    return ("$nome você está com $imc de imc, OBESIDADE GRAU I");
  } else if (imc > 35 && imc < 40) {
    return ("$nome você está com $imc de imc, OBESIDADE GRAU II (SEVERA)");
  } else if (imc >= 40) {
    return ("$nome você está com $imc de imc, OBESIDADE GRAU III (MÓRBIDA)");
  } else {
    return ("Deu ruim");
  }
}
