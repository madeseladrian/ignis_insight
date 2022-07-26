import 'package:equatable/equatable.dart';
import '../protocols/protocols.dart';

class EmailValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  @override 
  List get props => [field];

  const EmailValidation(this.field);

  @override
  String? validate(Map input) {
    return null;
  }
}