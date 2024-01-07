// ignore: file_names
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  static const _steps = [
    Step(title: Text("Servicio"), content: ServiceForm()),
    Step(title: Text("Personas"), content: PersonForm()),
    Step(title: Text("Buscar Vehiculo"), content: VehicleForm()),
    Step(title: Text("Datos del vehiculo"), content: LegalDataVehicleForm()),
    Step(title: Text("Informacion del pago"), content: PaymentForm())
  ];

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stepper(
      steps: _steps,
      currentStep: _currentStep,
      onStepContinue: () {
        setState(() {
          if (_currentStep < _steps.length - 1) {
            _currentStep += 1;
          } else {
            _currentStep = 0;
          }
        });
      },
      onStepCancel: () {
        setState(() {
          if (_currentStep > 0) {
            _currentStep -= 1;
          } else {
            _currentStep = 0;
          }
        });
      },
      type: StepperType.vertical,
    ));
  }
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

class ServiceForm extends StatefulWidget {
  const ServiceForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  final String selectedRadio = '';
  final String selectedAdditionalRadio = '';
  final List<String> listServices = [
    "Basico",
    "Intermedio",
    "Peritaje",
    "Avaluo Total",
  ];
  final List<String> listAditionalServices = [
    "Suspension",
    "Compresion",
  ];
  // ignore: non_constant_identifier_names
  int _service_value = 0;
  // ignore: non_constant_identifier_names
  int _add_service_value = 0;

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
        const SizedBox(height: 30),
        const Row(
          children: [
            Text('Tipo de servicio:'),
          ],
        ),
        const SizedBox(height: 10.0),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              child: Wrap(
                  spacing: 5.0,
                  runSpacing: 10,
                  children: listServices.asMap().entries.map((value) {
                    return ChoiceChip(
                      label: Text(value.value),
                      selected: _service_value == value.key,
                      onSelected: (bool selected) {
                        setState(() {
                          _service_value = (selected ? value.key : null)!;
                        });
                      },
                    );
                  }).toList()),
            )
          ],
        ),
        const SizedBox(height: 30),
        const Row(
          children: [
            Text('Adicionales:'),
          ],
        ),
        const SizedBox(height: 10.0),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              child: Wrap(
                  spacing: 5.0,
                  runSpacing: 10,
                  children: listAditionalServices.asMap().entries.map((value) {
                    return ChoiceChip(
                      label: Text(value.value),
                      selected: _add_service_value == value.key,
                      onSelected: (bool selected) {
                        setState(() {
                          _add_service_value = (selected ? value.key : null)!;
                        });
                      },
                    );
                  }).toList()),
            )
          ],
        ),
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
          children: [
            ResponsiveGridRow(children: [
              ResponsiveGridCol(
                  child: DropdownMenu<FuelLabel>(
                requestFocusOnTap: true,
                label: const Text('Tipo Persona'),
                dropdownMenuEntries: FuelLabel.values
                    .map<DropdownMenuEntry<FuelLabel>>((FuelLabel fuel) {
                  return DropdownMenuEntry<FuelLabel>(
                      value: fuel, label: fuel.label);
                }).toList(),
              )),
              ResponsiveGridCol(child: const Text("Cliente: "))
            ]),
            ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  md: 6,
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
                        border: OutlineInputBorder(), labelText: 'Nombre'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese su nombre';
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
                        border: OutlineInputBorder(), labelText: 'Apellido'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese su apellido';
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
            )
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
