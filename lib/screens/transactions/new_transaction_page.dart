// ignore: file_names
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(16.0), child: TransactionForm())
        ],
      )),
    );
  }
}

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransactionForm createState() => _TransactionForm();
}

enum CarsLabel {
  blue('Automovil'),
  pink('Zapatico'),
  green('Motocicleta'),
  yellow('Camion');

  const CarsLabel(this.label);
  final String label;
}

enum FuelLabel {
  blue('Gasolina Corriente'),
  pink('Extra'),
  green('Diesel'),
  yellow('Gas');

  const FuelLabel(this.label);
  final String label;
}

class _TransactionForm extends State<TransactionForm> {
  String selectedValue = 'Opción 1';
  List<String> dropdownItems = ['Opción 1', 'Opción 2', 'Opción 3', 'Opción 4'];
  String selectedRadio = '';
  String selectedAdditionalRadio = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            DropdownMenu<CarsLabel>(
              requestFocusOnTap: true,
              label: const Text('Tipo de vehiculo'),
              width: 220,
              dropdownMenuEntries: CarsLabel.values
                  .map<DropdownMenuEntry<CarsLabel>>((CarsLabel car) {
                return DropdownMenuEntry<CarsLabel>(
                  value: car,
                  label: car.label,
                );
              }).toList(),
            ),
            const SizedBox(width: 24),
            DropdownMenu<FuelLabel>(
              requestFocusOnTap: true,
              label: const Text('Combustible'),
              width: 220,
              dropdownMenuEntries: FuelLabel.values
                  .map<DropdownMenuEntry<FuelLabel>>((FuelLabel fuel) {
                return DropdownMenuEntry<FuelLabel>(
                    value: fuel, label: fuel.label);
              }).toList(),
            )
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const Text('Básico'),
                Radio(
                  value: 'Basico',
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value.toString();
                    });
                  },
                )
              ],
            ),
            Row(
              children: [
                const Text('Intermedio'),
                Radio(
                  value: 'Intermedio',
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value.toString();
                    });
                  },
                )
              ],
            ),
            Row(
              children: [
                const Text('Peritaje'),
                Radio(
                  value: 'Peritaje',
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value.toString();
                    });
                  },
                )
              ],
            ),
            Row(
              children: [
                const Text('Avaluo total'),
                Radio(
                  value: 'Avaluo total',
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value.toString();
                    });
                  },
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Adicionales:',
              style: TextStyle(fontSize: 15),
            ),
            Row(
              children: [
                const Text('Suspension'),
                Radio(
                  value: 'Suspension',
                  groupValue: selectedAdditionalRadio,
                  onChanged: (value) {
                    setState(() {
                      selectedAdditionalRadio = value.toString();
                    });
                  },
                )
              ],
            ),
            Row(
              children: [
                const Text('Compresion'),
                Radio(
                  value: 'Compresion',
                  groupValue: selectedAdditionalRadio,
                  onChanged: (value) {
                    setState(() {
                      selectedAdditionalRadio = value.toString();
                    });
                  },
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        ExpansionTile(
          title: const Text("Personas"),
          controlAffinity: ListTileControlAffinity.leading,
          children: [
            const SizedBox(height: 10),
            DropdownMenu<CarsLabel>(
              requestFocusOnTap: true,
              menuHeight: 50,
              label: const Text('Color'),
              dropdownMenuEntries: CarsLabel.values
                  .map<DropdownMenuEntry<CarsLabel>>((CarsLabel color) {
                return DropdownMenuEntry<CarsLabel>(
                  value: color,
                  label: color.label,
                );
              }).toList(),
            ),
            const PersonForm(),
            DataTable(
              columns: const [
                DataColumn(label: Text('#')),
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Apellido')),
                DataColumn(label: Text('Rol')),
                DataColumn(label: Text('Cliente')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('John')),
                  DataCell(Text('Doe')),
                  DataCell(Text('Desarrollador')),
                  DataCell(Text('Cliente A')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('Jane')),
                  DataCell(Text('Smith')),
                  DataCell(Text('Diseñador')),
                  DataCell(Text('Cliente B')),
                ]),
                // Agrega más filas según sea necesario
              ],
            ),
          ],
        ),
        const ExpansionTile(
          title: Text("Buscar Vehiculo"),
          controlAffinity: ListTileControlAffinity.leading,
          children: [SizedBox(height: 10), VehicleForm()],
        ),
        const ExpansionTile(
          title: Text("Datos legales del vehiculo"),
          controlAffinity: ListTileControlAffinity.leading,
          children: [SizedBox(height: 10), LegalDataVehicleForm()],
        ),
        const ExpansionTile(
          title: Text("Informacion sobre el metodo de pago"),
          controlAffinity: ListTileControlAffinity.leading,
          children: [SizedBox(height: 10), PaymentForm()],
        ),
        const SizedBox(height: 15),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                // color de fondo del botón
                shape: const RoundedRectangleBorder(),
                minimumSize: const Size(double.infinity, 60)),
            child: const Text('Confirmar',
                style: TextStyle(
                  fontSize: 18.0, // Tamaño del texto del botón
                ))),
        const SizedBox(height: 15),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                // color de fondo del botón
                shape: const RoundedRectangleBorder(),
                minimumSize: const Size(double.infinity, 60)),
            child: const Text('Cancelar',
                style: TextStyle(
                  fontSize: 18.0, // Tamaño del texto del botón
                ))),
      ],
    );
  }
}

class PersonForm extends StatefulWidget {
  const PersonForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PersonFormState createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Numero de documento",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese el número de documento';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Expedida en'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese el lugar de expedición';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nombre'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese su nombre';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Apellido'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese su apellido';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Dirección'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese su dirección';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Teléfono'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese su número de teléfono';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Correo'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Por favor, ingrese un correo válido';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VehicleForm extends StatefulWidget {
  const VehicleForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VehicleFormState createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Placa'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese el número de placa';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Marca'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Marca';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Linea'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Linea';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Modelo'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Modelo';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Tipo'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese tipo';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Clase'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese su Clase';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Color'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Color';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Combustible'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Combustible';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Cilindraje'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Cilindraje';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Motor'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Motor';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Chasis'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese chasis';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Serie'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese serie';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Armado'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Armado';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Numero de seguridad'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese numero de seguridad';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LegalDataVehicleForm extends StatefulWidget {
  const LegalDataVehicleForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LegalDataVehicleFormState createState() => _LegalDataVehicleFormState();
}

class _LegalDataVehicleFormState extends State<LegalDataVehicleForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Placa'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese el número de placa';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Marca'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Marca';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Linea'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Linea';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Modelo'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Modelo';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Tipo'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese tipo';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Clase'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese su Clase';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Color'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Color';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Combustible'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Combustible';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Cilindraje'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Cilindraje';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Motor'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Motor';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Chasis'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese chasis';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Serie'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese serie';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Armado'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Armado';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Numero de seguridad'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese numero de seguridad';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Metodo de pago'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese el número de placa';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Valor total a pagar'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Marca';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
