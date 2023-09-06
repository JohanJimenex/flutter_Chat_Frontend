// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:async';

Future<void> getPokemon() async {
  Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/ditto');
  var response = await http.get(url);
  print('Response body: ${response.body}');
}

void testStream() {
  // Stream

  // Creamos un StreamController que emitirá enteros.
  StreamController<int> contadorController = StreamController<int>();

  // Creamos el Stream a partir del StreamController.
  // Stream<int> contadorStream = contadorController.stream;

  // Creamos un contador que cuenta del 1 al 5 y emite un valor cada segundo.
  int contador = 1;

  Timer.periodic(const Duration(seconds: 1), (timer) {
    if (contador <= 5) {
      contadorController
          .add(contador); // Emitimos el valor del contador al Stream.
      contador++;
    } else {
      contadorController
          .close(); // Cerramos el Stream después de emitir todos los valores.
      timer.cancel();
    }
  });

  // Subscribimos un oyente al Stream para escuchar los eventos emitidos.
  contadorController.stream.listen((valor) {
    print("Contador: $valor");
  });
}
