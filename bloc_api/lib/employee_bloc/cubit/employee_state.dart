part of 'employee_cubit.dart';

@immutable

abstract class EmployeeState {}

class EmployeeInitial extends EmployeeState {}
class EmployeeProgress extends EmployeeState {}
class EmployeeSuccess extends EmployeeState {
  final EmployeeList employeeList;

  EmployeeSuccess(this.employeeList);
}

class EmployeeError extends EmployeeState {
  final String errorMessage;

  EmployeeError(this.errorMessage);


}
