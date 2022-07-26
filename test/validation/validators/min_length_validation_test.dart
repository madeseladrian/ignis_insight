import 'package:test/test.dart';
import 'package:ignis_insight/validation/validators/validators.dart';

void main() {
  late MinLengthValidation sut;

  setUp(() {
    sut = const MinLengthValidation(field: 'any_field', size: 3);
  });

  test('1 - Should return error if value is empty', () {
    final error = sut.validate({'any_field': ''});
    expect(error, 'Campo inválido');
  });
}