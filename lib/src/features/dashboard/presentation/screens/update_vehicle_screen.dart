import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_monitoring_app/src/core/utils/helper.dart';
import 'package:vehicle_monitoring_app/src/shared/presentation/widgets/custom_button.dart';

import '../../../../core/routes/routes.dart';
import '../../domain/entities/vehicle_entity.dart';
import '../bloc/update_vehicle_bloc/update_vehicle_bloc.dart';

class UpdateVehicleScreen extends StatefulWidget {
  const UpdateVehicleScreen({super.key, required this.vehicle});

  final VehicleEntity vehicle;

  static Route route(RouteSettings settings) {
    final VehicleEntity vehicle = settings.arguments as VehicleEntity;
    return MaterialPageRoute(
      builder: (context) =>
          UpdateVehicleScreen(
            vehicle: vehicle,
          ),
    );
  }

  @override
  State<UpdateVehicleScreen> createState() => _UpdateVehicleScreenState();
}

class _UpdateVehicleScreenState extends State<UpdateVehicleScreen> {
  final _formKey = GlobalKey<FormState>();

  double fuelLevel = 0.0;
  double engineTemperature = 0.0;
  double mileage = 0.0;
  String status = '';

  // Form field controllers
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _mileageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fuelLevel = widget.vehicle.fuelLevel ?? 0.0;
    engineTemperature = widget.vehicle.engineTemp ?? 0.0;
    status = widget.vehicle.status;
    mileage = widget.vehicle.mileage ?? 0.0;
    _statusController.text = widget.vehicle.status;
    _mileageController.text = widget.vehicle.mileage.toString();
  }

  void _updateVehicle() {
    if (_formKey.currentState!.validate()) {
      final updatedVehicle = widget.vehicle.copyWith(
        fuelLevel: fuelLevel,
        engineTemp: engineTemperature,
        status: status,
        mileage: double.parse(_mileageController.text),
      );

      context.read<UpdateVehicleBloc>().add(UpdateVehicle(updatedVehicle));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: Text('Update Vehicle')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Fuel Level'),
                    Slider(
                      value: fuelLevel,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: '${fuelLevel.toStringAsFixed(0)}%',
                      onChanged: (value) {
                        setState(() {
                          fuelLevel = value;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Engine Temperature (°C)'),
                    Slider(
                      value: engineTemperature,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: '${engineTemperature.toStringAsFixed(0)}°C',
                      onChanged: (value) {
                        setState(() {
                          engineTemperature = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    const Text('Vehicle Status'),
                    DropdownButtonFormField<String>(
                      value: status,
                      alignment: Alignment.centerLeft,
                      onChanged: (newStatus) {
                        setState(() {
                          status = newStatus!;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                            value: 'Active', child: Text('Active')),
                        DropdownMenuItem(
                            value: 'Inactive', child: Text('Inactive')),
                        DropdownMenuItem(
                            value: 'Under Maintenance',
                            child: Text('Under Maintenance')),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15,
                  children: [
                    const Text('Mileage (in km)'),
                    TextFormField(
                      controller: _mileageController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter mileage';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                BlocConsumer<UpdateVehicleBloc, UpdateVehicleState>(
                  listener: (context, state) {
                    if (state is UpdateVehicleSuccess) {
                      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
                      Helper.showSnackBar(context, state.message);
                    } else if (state is UpdateVehicleFailure) {
                      Helper.showSnackBar(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state is UpdateVehicleInProgress,
                      onPressed: _updateVehicle,
                      text: state is UpdateVehicleInProgress ? 'Updating ': 'Update',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
