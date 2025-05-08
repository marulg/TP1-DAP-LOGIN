import 'package:flutter/material.dart';


void main() {
runApp(const MainApp());
}

class MainApp extends StatefulWidget {
const MainApp({super.key});

@override
MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
TextEditingController textoUsuario = TextEditingController();
TextEditingController textoContra = TextEditingController();
// se usan para leer lo que el usuario escribe en los campos de texto

String usuarioPuesto = "NoInput";
String contraPuesta = "NoInput";

String username = "marulg";
String password = "meca2025";
 
Color colorRespuesta = Colors.white; // para poder modificar el color mas facil segun q respuesta te salga
String resultado = ""; // lo mismo pero con el texto q salga

bool ocultarContra = true; // para ocultar y mostrar la contraseña

void enviar() {
 setState(() {
   usuarioPuesto = textoUsuario.text;
   contraPuesta = textoContra.text;

   if (usuarioPuesto == "") {
     resultado = "Porfavor, llene el campo de usuario.";
     colorRespuesta = const Color.fromARGB(255, 79, 64, 64);
   }
   if (contraPuesta == "") {
     resultado = "Porfavor, llene el campo de contraseña.";
     colorRespuesta = const Color.fromARGB(255, 79, 64, 64);
   }
   if (usuarioPuesto == "" && contraPuesta == "") {
     resultado = "Porfavor llene ambos campos.";
     colorRespuesta = const Color.fromARGB(255, 79, 64, 64);
   }
   if (usuarioPuesto != "" && contraPuesta != "") {
     resultado = "Contraseña/Usuario incorrectos";
     colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
   }
   if (usuarioPuesto == username && contraPuesta == password) {
     resultado = "Bienvenido!";
     colorRespuesta = const Color.fromARGB(255, 92, 208, 77);
   }
 });
}

@override
Widget build(BuildContext context) {
 return MaterialApp(
   home: Scaffold(
     body: Center(
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           const Text(
             "Ingrese usuario y contraseña.",
             style: TextStyle(fontSize: 24, color: Colors.black),
             textAlign: TextAlign.center,
           ),
           const SizedBox(height: 40),
           SizedBox(
             height: 40,
             width: 200,
             child: TextField(
               controller: textoUsuario,
             ),
           ),
           const SizedBox(height: 20),
           SizedBox(
             height: 40,
             width: 200,
             child: TextField(
               controller: textoContra,
               obscureText: ocultarContra,
               decoration: InputDecoration(
                 suffixIcon: IconButton( // el ojito que oculta/muestra
                   icon: Icon(
                     ocultarContra ? Icons.visibility_off : Icons.visibility, // si esta en true pone el icono del ojo con la raya (oculto), si no pone el normal
                   ),
                   onPressed: () {
                     setState(() {
                       ocultarContra = !ocultarContra; // invierte el valor de ocultarContra al tocar botón (si estaba en true pasa a false y viceversa)
                     });
                   },
                 ),
               ),
             ),
           ),
           const SizedBox(height: 30),
           ElevatedButton(onPressed: enviar, child: const Text("LOG IN")), // cuando se toca el botón llama a la función q piensa la respuesta
           const SizedBox(height: 20),
           Text(
             resultado, // el texto se queda en blanco hasta que la funcion "enviar" lo cambie
             style: TextStyle(fontSize: 18, color: colorRespuesta),
           ),
         ],
       ),
     ),
   ),
 );
}
}