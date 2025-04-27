//função que converte de celsius para Fahrenheit
double converterCelsiusFahrenheit(double celsius){
  double fahrenheit = (celsius * 9/5) + 32;
  return fahrenheit;
}

//função que converte de celcius para kelvin
double converterCelsiusKelvin(double celsius){
  double kelvin = celsius + 273.15;
  return kelvin;
}

void main(){
  //lista de temperaturas passadas
  List<double> temperaturas = [0.0, 4.2, 15.0, 18.1, 21.7, 32.0, 40.0, 41.0];
  //percorrendo com um forEach e já printando as temperaturas chamando as funções de conversão
  temperaturas.forEach((e){
    print("Celsius: $e | Fahrenheit: ${converterCelsiusFahrenheit(e).toStringAsFixed(2)} | Kelvin: ${converterCelsiusKelvin(e).toStringAsFixed(2)}");
  });
  
}