// ignore: file_names
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Transaccion"),
        primary: true,
      ),
      body: const Column(
        children: [
          Padding(padding: EdgeInsets.all(16.0), child: TransactionForm())
        ],
      ),
    );
  }
}

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransactionForm createState() => _TransactionForm();
}

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownMenu<ColorLabel>(
              initialSelection: ColorLabel.green,
              requestFocusOnTap: true,
              label: const Text('Color'),
              dropdownMenuEntries: ColorLabel.values
                  .map<DropdownMenuEntry<ColorLabel>>((ColorLabel color) {
                return DropdownMenuEntry<ColorLabel>(
                  value: color,
                  label: color.label,
                  style: MenuItemButton.styleFrom(
                    foregroundColor: color.color,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 24),
            DropdownMenu<ColorLabel>(
              initialSelection: ColorLabel.green,
              requestFocusOnTap: true,
              label: const Text('Color'),
              dropdownMenuEntries: ColorLabel.values
                  .map<DropdownMenuEntry<ColorLabel>>((ColorLabel color) {
                return DropdownMenuEntry<ColorLabel>(
                  value: color,
                  label: color.label,
                  style: MenuItemButton.styleFrom(
                    foregroundColor: color.color,
                  ),
                );
              }).toList(),
            )
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Radio(
              value: 'Basico',
              groupValue: selectedRadio,
              onChanged: (value) {
                setState(() {
                  selectedRadio = value.toString();
                });
              },
            ),
            const Text('Básico'),
            Radio(
              value: 'Intermedio',
              groupValue: selectedRadio,
              onChanged: (value) {
                setState(() {
                  selectedRadio = value.toString();
                });
              },
            ),
            const Text('Intermedio'),
            Radio(
              value: 'Peritaje',
              groupValue: selectedRadio,
              onChanged: (value) {
                setState(() {
                  selectedRadio = value.toString();
                });
              },
            ),
            const Text('Peritaje'),
            Radio(
              value: 'Avaluo total',
              groupValue: selectedRadio,
              onChanged: (value) {
                setState(() {
                  selectedRadio = value.toString();
                });
              },
            ),
            const Text('Avaluo total'),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Adicional:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 10),
            Radio(
              value: 'Opcion1',
              groupValue: selectedAdditionalRadio,
              onChanged: (value) {
                setState(() {
                  selectedAdditionalRadio = value.toString();
                });
              },
            ),
            const Text('Opción 1'),
            const SizedBox(width: 10),
            Radio(
              value: 'Opcion2',
              groupValue: selectedAdditionalRadio,
              onChanged: (value) {
                setState(() {
                  selectedAdditionalRadio = value.toString();
                });
              },
            ),
            const Text('Opción 2'),
          ],
        ),
        const SizedBox(height: 20),
        ExpansionTile(
          title: const Text("personas"),
          controlAffinity: ListTileControlAffinity.leading,
          children: [
            const SizedBox(height: 10),
            DropdownMenu<ColorLabel>(
              initialSelection: ColorLabel.green,
              requestFocusOnTap: true,
              label: const Text('Color'),
              dropdownMenuEntries: ColorLabel.values
                  .map<DropdownMenuEntry<ColorLabel>>((ColorLabel color) {
                return DropdownMenuEntry<ColorLabel>(
                  value: color,
                  label: color.label,
                  style: MenuItemButton.styleFrom(
                    foregroundColor: color.color,
                  ),
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
                    decoration:
                        const InputDecoration(labelText: 'Número de Documento'),
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
                    decoration: const InputDecoration(labelText: 'Expedida en'),
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
                    decoration: const InputDecoration(labelText: 'Nombre'),
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(labelText: 'Apellido'),
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
                    decoration: const InputDecoration(labelText: 'Dirección'),
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
                    decoration: const InputDecoration(labelText: 'Teléfono'),
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(labelText: 'Correo'),
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
                    decoration: const InputDecoration(labelText: 'Placa'),
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
                    decoration: const InputDecoration(labelText: 'Marca'),
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
                    decoration: const InputDecoration(labelText: 'Linea'),
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
                    decoration: const InputDecoration(labelText: 'Modelo'),
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(labelText: 'Tipo'),
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
                    decoration: const InputDecoration(labelText: 'Clase'),
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
                    decoration: const InputDecoration(labelText: 'Color'),
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
                    decoration: const InputDecoration(labelText: 'Combustible'),
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(labelText: 'Cilindraje'),
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
                    decoration: const InputDecoration(labelText: 'Motor'),
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
                    decoration: const InputDecoration(labelText: 'Chasis'),
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
                    decoration: const InputDecoration(labelText: 'Serie'),
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(labelText: 'Armado'),
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
                    decoration:
                        const InputDecoration(labelText: 'Numero de seguridad'),
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
                    decoration: const InputDecoration(labelText: 'Placa'),
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
                    decoration: const InputDecoration(labelText: 'Marca'),
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
                    decoration: const InputDecoration(labelText: 'Linea'),
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
                    decoration: const InputDecoration(labelText: 'Modelo'),
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(labelText: 'Tipo'),
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
                    decoration: const InputDecoration(labelText: 'Clase'),
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
                    decoration: const InputDecoration(labelText: 'Color'),
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
                    decoration: const InputDecoration(labelText: 'Combustible'),
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(labelText: 'Cilindraje'),
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
                    decoration: const InputDecoration(labelText: 'Motor'),
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
                    decoration: const InputDecoration(labelText: 'Chasis'),
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
                    decoration: const InputDecoration(labelText: 'Serie'),
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(labelText: 'Armado'),
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
                    decoration:
                        const InputDecoration(labelText: 'Numero de seguridad'),
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
                    decoration:
                        const InputDecoration(labelText: 'Metodo de pago'),
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
                    decoration:
                        const InputDecoration(labelText: 'Valor total a pagar'),
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
