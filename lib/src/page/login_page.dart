import 'package:flutter/material.dart';

//
import 'package:flutter/services.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';
import 'package:text_chunk_styling/text_chunk_styling.dart';
import 'package:number_to_character/number_to_character.dart';

class PruebaPage extends StatefulWidget {
  @override
  State<PruebaPage> createState() => _PruebaPageState();
}

class _PruebaPageState extends State<PruebaPage> {
  //declaracion de variables
  String _empleado = '';
  String _empresa = '';
  String _cliente = '';
  String _contactempresa = '';
  final _costoproducto = TextEditingController();
  final _margen = TextEditingController();
  int _pv = 0;

  final _formKey = GlobalKey<FormState>();
  var converter = NumberToCharacterConverter('es');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba Tecnica'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        // listview donde carga todos los inputs
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          children: [
            _nombreEmpleado(),
            const Divider(),
            _nombreEmpresa(),
            const Divider(),
            _contactoCliente(),
            const Divider(),
            _empresaCliente(),
            const Divider(),
            _costoProducto(),
            const Divider(),
            _margenEstimado(),
            const Divider(),
            _botonCalcular(context),
          ],
        ),
      ),
    );
  }

// metodo  input del empleado y estilo
  Widget _nombreEmpleado() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'No pudimos procesar el precio ya que no tenemos el Nombre del Empleado!';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      autofocus: true,
      cursorColor: Colors.red,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.red, width: 2.0)),
        labelStyle: const TextStyle(color: Colors.red),
        labelText: ('Nombre y Apellido'),
        hintText: 'Ingresa el nombre y apellido',
        suffixIcon: const Icon(
          Icons.accessibility_new_rounded,
          color: Colors.red,
        ),
        icon: const Icon(
          Icons.account_circle_outlined,
          color: Colors.red,
        ),
      ),
      onChanged: (value) {
        setState(() {});
        _empleado = value;
      },
    );
  }

// metodo input de la empresa y estilo
  Widget _nombreEmpresa() {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'No pudimos procesar el precio ya que no tenemos el Nombre de la Empresa!';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        cursorColor: Colors.red,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0)),
          hintText: 'Ingresa el nombre de la empresa',
          labelStyle: const TextStyle(color: Colors.red),
          labelText: ('Nombre de la Empresa'),
          suffixIcon: const Icon(
            Icons.business_center_outlined,
            color: Colors.red,
          ),
          icon: const Icon(
            Icons.business_rounded,
            color: Colors.red,
          ),
        ),
        onChanged: (value) => setState(() {
              _empresa = value;
            }));
  }

// metodo  input del cliente y estilo
  Widget _contactoCliente() {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'No pudimos procesar el precio ya que no tenemos el Nombre del Cliente!';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        //autofocus: true,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0)),
          hintText: 'Nombre del Cliente',
          labelStyle: const TextStyle(color: Colors.red),
          labelText: ('Nombre del  Cliente'),
          suffixIcon: const Icon(
            Icons.person,
            color: Colors.red,
          ),
          icon: const Icon(
            Icons.person_outline,
            color: Colors.red,
          ),
        ),
        onChanged: (value) => setState(() {
              _cliente = value;
            }));
  }

// metodo  input de empresa  cliente y estilo
  Widget _empresaCliente() {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'No pudimos procesar el precio ya que no tenemos el Nombre de la Empresa Cliente!';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        //autofocus: true,
        cursorColor: Colors.red,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0)),
          hintText: 'Nombre de la Empresa Cliente',
          labelStyle: const TextStyle(color: Colors.red),
          labelText: ('Nombre de la Empresa Cliente'),
          suffixIcon: const Icon(
            Icons.factory_rounded,
            color: Colors.red,
          ),
          icon: const Icon(
            Icons.business_rounded,
            color: Colors.red,
          ),
        ),
        onChanged: (value) => setState(() {
              _contactempresa = value;
            }));
  }

//metodo  imput costo del producto y estilo
  Widget _costoProducto() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (value) {
          if (value!.isEmpty) {
            return 'No pudimos procesar el precio ya que no tenemos el Costo!';
          }
          return null;
        },
        controller: _costoproducto,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.red,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0)),
          hintText: 'Costo',
          labelStyle: const TextStyle(color: Colors.red),
          labelText: ('Costo Producto'),
          suffixIcon: const Icon(
            Icons.bakery_dining_rounded,
            color: Colors.red,
          ),
          icon: const Icon(
            Icons.attach_money_rounded,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

// metodo  input del margen y estilo
  Widget _margenEstimado() {
    return TextFormField(
      inputFormatters: [
// se realiza limitacion para que solo pueda ingresar numeros has el 99.9 como num maximo
        FilteringTextInputFormatter.digitsOnly,

        NumberTextInputFormatter(
            decimalDigits: 1,
            maxValue: '99.9',
            overrideDecimalPoint: true,
            insertDecimalPoint: true),
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return 'No pudimos procesar el precio ya que no tenemos la Margen Estimada!';
        }
        return null;
      },
      controller: _margen,
      cursorColor: Colors.red,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: Colors.red, width: 2.0)),
          hintText: '0-99.99...',
          labelStyle: const TextStyle(color: Colors.red),
          labelText: ('Margen Estimado'),
          suffixIcon: const Icon(
            Icons.percent_rounded,
            color: Colors.red,
          ),
          icon: const Icon(Icons.timeline_rounded, color: Colors.red)),
    );
  }

//metodo boton para realizar la verificacion de los campos y llama la funcion calculo del PV
  Widget _botonCalcular(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130.0),
      child: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            setState(() {
              _calcular(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Hola $_empleado!'),
                      content: TextChunkStyling(
                        text:
                            'El precio de venta del producto que deseas entregar a $_cliente de la compañía $_contactempresa es de \$$_pv (${converter.convertInt(_pv)}).\n Con esta venta la $_empresa tendra una margen de ${_margen.text}%',
                        highlightText: [
                          _cliente,
                          _contactempresa,
                          '$_pv',
                          _empresa
                        ],
                        highlightTextStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Entendido'))
                      ],
                    );
                  });
            });
          }
        },
        label: const Text('Calcular'),
        icon: const Icon(Icons.calculate_rounded),
      ),
    );
  }

//funcion que recibe parametros para realizar la formula y tener el PV
  _calcular(context) {
    double resultado;
    double margenPorcen;
    margenPorcen = double.parse(_margen.text) / 100;
    resultado = double.parse(_costoproducto.text) / (1 - margenPorcen);
    _pv = double.parse(resultado.toStringAsFixed(6)).round();
    return _pv;
  }
}
