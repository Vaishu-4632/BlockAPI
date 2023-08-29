import 'package:bloc_api/employee_bloc/cubit/employee_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => EmployeeCubit(),
        child: const EmployeeList(),
      ),
    );
  }
}

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<EmployeeCubit>(context).fetchEmployeeList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee List"),
      ),
      body: BlocBuilder<EmployeeCubit, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeProgress){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is EmployeeSuccess){
            print(state);
            return ListView.builder(
                itemCount: state.employeeList.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children:  <Widget>[
                      Text(state.employeeList.data![index].id.toString()),
                      Text(state.employeeList.data![index].employeeName.toString()),
                      Text(state.employeeList.data![index].employeeSalary.toString()),
                      Text(state.employeeList.data![index].employeeAge.toString()),
                      Text(state.employeeList.data![index].profileImage.toString()),
                      const Divider(
                        color: Colors.black,
                      )
                    ],
                  );
                });
          }
          if(state is EmployeeError){
            return Text(state.errorMessage);
          }
        return Container();  
        },
      ),
    );
  }
}
