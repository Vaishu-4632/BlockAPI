import 'package:bloc/bloc.dart';
import 'package:bloc_api/employee_model/employee_model.dart';
import 'package:bloc_api/employee_service/employee_service.dart';
import 'package:meta/meta.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());
  Future<void> fetchEmployeeList() async {
    emit(EmployeeProgress());
    try{
        final result = await fetchEmployeeStatus();
        emit(EmployeeSuccess(result));
    }
    catch(error) {
        emit(EmployeeError("Try after sometime"));
    }

  }
}
