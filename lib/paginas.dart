import 'package:flutter/material.dart';

//pagina 1
class Pagina1 extends StatefulWidget {

  Pagina1({
    super.key,
  });

  @override
  State<Pagina1> createState() => _Pagina1State();
}

class _Pagina1State extends State<Pagina1> {
  final List<String> items = [];

  @override
  Widget build(BuildContext context) {
    TextEditingController controlador_texto1 = TextEditingController();
    TextEditingController controlador_texto2 = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('pagina 1'))),
      body: Center(
          child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Text(items[index]);
        },
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextFormField(
              controller: controlador_texto1,
              decoration: const InputDecoration(hintText: 'Nombre'),
            ),
            TextFormField(
              controller: controlador_texto2,
              decoration: const InputDecoration(hintText: 'Pais'),
            ),
            FilledButton(
              child: const Text('Agregar item'),
              onPressed: () {
                print('nombre ${controlador_texto1.text}');
                print('pais ${controlador_texto2.text}');
                items.add('${controlador_texto1.text} - ${controlador_texto2.text}');
                setState(() {
                  
                });
              },
            ),
            FilledButton(
              child: const Text('Ir a pagina 2'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Pagina2(items: items)));
              },
            ),
          ],
        ),
      ),
    );
  }
}

//pagina 2
class Pagina2 extends StatefulWidget {

  final List<String> items;
   const Pagina2({
    super.key, required this.items
  });

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  

  String item_seleccionado = 'item 1';

  @override
  Widget build(BuildContext context) {
    item_seleccionado= item_seleccionado.isEmpty && widget.items.isNotEmpty? widget.items[0]:item_seleccionado;

    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('pagina 2'))),
      body: Center(
        child: DropdownButton(
          value: item_seleccionado,
         items: widget.items.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item)
            );
         }).toList(), 
        onChanged: (String? value){
          item_seleccionado= value!;
          print('onchanged $value');
          print('itemsseleccionado $item_seleccionado');
          setState(() {
            
          });
        }),
      ),
      floatingActionButton: FilledButton(
        child: const Text('Ir a pagina 1'),
          onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
