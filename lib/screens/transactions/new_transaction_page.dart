// ignore: file_names
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:test_driven_app/entities/fuel_entity.dart';
import 'package:test_driven_app/entities/service_type_entity.dart';
import 'package:test_driven_app/entities/vehicle_type_entity.dart';
import 'package:test_driven_app/services/fuel_service.dart';
import 'package:test_driven_app/services/service_service.dart';
import 'package:test_driven_app/services/vehicle_service.dart';

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
      controlsBuilder: (context, details) => Row(
        children: [
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: details.onStepContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child:
                const Text('Siguiente', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: details.onStepCancel,
            child: const Text('Anterior'),
          ),
        ],
      ),
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
      type: StepperType.horizontal,
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

  late Future<Iterable<Fuel>> futureFuel;
  late Future<Iterable<VehicleType>> futureVehicleType;
  late Future<Iterable<ServiceType>> futureServiceType;

  @override
  void initState() {
    super.initState();
    futureFuel = fetchFuelTypes();
    futureVehicleType = fetchVehicleTypes();
    futureServiceType = fetchServiceTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            FutureBuilder<Iterable<VehicleType>>(
                future: futureVehicleType,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownMenu<VehicleType>(
                      requestFocusOnTap: true,
                      label: const Text('Tipo Vehiculo'),
                      width: 220,
                      dropdownMenuEntries: snapshot.data!
                          .map<DropdownMenuEntry<VehicleType>>(
                              (VehicleType vehicleType) {
                        return DropdownMenuEntry<VehicleType>(
                            value: vehicleType, label: vehicleType.Nombre);
                      }).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                }),
            const SizedBox(width: 24),
            FutureBuilder<Iterable<Fuel>>(
                future: futureFuel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownMenu<Fuel>(
                      requestFocusOnTap: true,
                      label: const Text('Combustible'),
                      width: 220,
                      dropdownMenuEntries: snapshot.data!
                          .map<DropdownMenuEntry<Fuel>>((Fuel fuel) {
                        return DropdownMenuEntry<Fuel>(
                            value: fuel, label: fuel.Nombre);
                      }).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                })
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
              child: FutureBuilder<Iterable<ServiceType>>(
                  future: futureServiceType,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Wrap(
                          spacing: 5.0,
                          runSpacing: 10,
                          children: snapshot.data!.map((value) {
                            return ChoiceChip(
                              label: Text(value.Nombre),
                              selected: _service_value == value.Id,
                              onSelected: (bool selected) {
                                setState(() {
                                  _service_value =
                                      (selected ? value.Id : null)!;
                                });
                              },
                            );
                          }).toList());
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return const CircularProgressIndicator();
                  }),
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
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ResponsiveGridRow(children: [
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownMenu<FuelLabel>(
                    label: const Text('Tipo Persona'),
                    width: 300,
                    dropdownMenuEntries: FuelLabel.values
                        .map<DropdownMenuEntry<FuelLabel>>((FuelLabel fuel) {
                      return DropdownMenuEntry<FuelLabel>(
                          value: fuel, label: fuel.label);
                    }).toList(),
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: const Column(
                  children: [Text("Cliente:"), Icon(Icons.check)],
                ),
              )
            ]),
            ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  md: 6,
                  lg: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownMenu<FuelLabel>(
                      label: const Text('Tipo Documento'),
                      width: 300,
                      dropdownMenuEntries: FuelLabel.values
                          .map<DropdownMenuEntry<FuelLabel>>((FuelLabel fuel) {
                        return DropdownMenuEntry<FuelLabel>(
                            value: fuel, label: fuel.label);
                      }).toList(),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  md: 6,
                  lg: 4,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                      )),
                ),
                ResponsiveGridCol(
                  md: 6,
                  lg: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Expedida En",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese el lugar de expedicion';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ResponsiveGridCol(
                    md: 6,
                    lg: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: TextEditingController(),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Nombre",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, ingrese el nombre';
                          }
                          return null;
                        },
                      ),
                    )),
                ResponsiveGridCol(
                  md: 6,
                  lg: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Apellido",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese el apellido';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  md: 6,
                  lg: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Direccion",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese la direccion';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  md: 6,
                  lg: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Telefono",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese el telefono';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  md: 6,
                  lg: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Correo",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese el correo';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    'Agregar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            DataTable(
              showBottomBorder: true,
              dividerThickness: 5,
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
                  DataCell(Text('Admin')),
                  DataCell(Icon(Icons.check)),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('Jane')),
                  DataCell(Text('Smith')),
                  DataCell(Text('User')),
                  DataCell(Icon(Icons.check)),
                ]),
                // Agrega más filas según sea necesario
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
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              md: 4,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu<FuelLabel>(
                  label: const Text('Buscar por'),
                  dropdownMenuEntries: FuelLabel.values
                      .map<DropdownMenuEntry<FuelLabel>>((FuelLabel fuel) {
                    return DropdownMenuEntry<FuelLabel>(
                        value: fuel, label: fuel.label);
                  }).toList(),
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 5,
              lg: 4,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese un valor';
                      }
                      return null;
                    },
                  )),
            ),
            ResponsiveGridCol(
              md: 3,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    'Buscar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Placa",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese una placa';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Marca",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese marca';
                      }
                      return null;
                    },
                  ),
                )),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Linea",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese una linea';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Modelo",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese un modelo';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Tipo",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese Tipo';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Clase",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese clase';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Color",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese Color';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Combustible",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese combustible';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Cilindraje",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese cilindraje';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Motor",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese motor';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Chasis",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese chasis';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Serie",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese serie';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Armado",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese armado';
                    }
                    return null;
                  },
                ),
              ),
            ),
            ResponsiveGridCol(
              md: 6,
              lg: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Numero de seguridad",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese Numero de seguridad';
                    }
                    return null;
                  },
                ),
              ),
            )
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
          child: ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Pendiente RUNT",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese RUNT';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                  md: 6,
                  lg: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Pignoracion RUNT",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, ingrese Pignoracion RUNT';
                        }
                        return null;
                      },
                    ),
                  )),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Multas por SIMIT",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese Multas por SIMIT';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Timbre",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese timbre';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Impuestos",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese impuestos';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Licencia Transito",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese licencia transito';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Tarjeta de propiedad",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese tarjeta de propiedad';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Siniestro",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese siniestro';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Declaracion de importacion",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese declaracion de importacion';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Cod. Fasecolda",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, Cod. Fasecolda';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Matriculado",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese matriculado';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Matriculado Fecha",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese matriculado fecha';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "SOAT",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese SOAT';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Fecha de vencimiento",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingrese fecha de vencimiento';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 6,
                lg: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        child: const Text(
                          'Guardar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
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
