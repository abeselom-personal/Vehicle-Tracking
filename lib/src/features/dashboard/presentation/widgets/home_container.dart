import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utils/helper.dart';
import '../../../../shared/presentation/widgets/error_container.dart';
import '../bloc/fetch_all_vehicles_bloc/fetch_all_vehicles_bloc.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllVehiclesBloc, FetchAllVehiclesState>(
      builder: (context, state) {
        if (state is FetchAllVehiclesInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchAllVehiclesFailure) {
          return ErrorContainer(
            onTapRetry: () {
              context.read<FetchAllVehiclesBloc>().add(FetchAllVehicles());
            },
          );
        } else if (state is FetchAllVehiclesSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: state.vehicles.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.vehicleDetails,
                        arguments: state.vehicles[index],
                      );
                    },
                    leading: Hero(
                      tag: state.vehicles[index].id,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(state.vehicles[index].imgUrl ?? ''),
                      ),
                    ),
                    title: Text(state.vehicles[index].name),
                    subtitle: Text(state.vehicles[index].locationName),
                    trailing: Text(state.vehicles[index].status, style: TextStyle(color: state.vehicles[index].status == 'Active' ? Colors.green : Colors.orange),),
                  ),
                  Divider(),
                ],
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
