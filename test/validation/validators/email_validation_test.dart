import 'package:ignis_insight/validation/validators/email_validation.dart';
import 'package:test/test.dart';
 
void main() {
  late EmailValidation sut;

  setUp(() {
    sut = const EmailValidation('any_field');
  });
  
  test('1 - Should return null if email is empty', () async {
    final error = sut.validate({'any_field': ''});
    expect(error, null);
  });
}