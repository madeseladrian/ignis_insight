import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:ignis_insight/presentation/helpers/helpers.dart';
import 'package:ignis_insight/presentation/presenters/presenters.dart';

import 'package:ignis_insight/ui/helpers/helpers.dart';
import '../mocks/mocks.dart';
 
void main() {
  late String email;
  late String password;
  late ValidationSpy validation;
  late GetxLoginPresenter sut;

  setUp(() {
    email = faker.internet.email();
    password = faker.internet.password();
    validation = ValidationSpy();
    sut = GetxLoginPresenter(
      validation: validation
    );
  });

  test('1 - Should call Validation with correct email', () async {
    final formData = {'email': email, 'password': null};
    sut.validateEmail(email);
    verify(() => validation.validate(field: 'email', input: formData)).called(1);
  });

  test('2,3,4 - Should emailErrorStream returns invalidFieldError if email is empty', () async {
    validation.mockValidationError(value: ValidationError.invalidField);

    sut.emailErrorStream.listen(expectAsync1((error) => expect(error, UIError.invalidField)));
    sut.isFormValidStream.listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('5 - Should emailErrorStream returns null if validation email succeeds', () async {
    sut.emailErrorStream.listen(expectAsync1((error) => expect(error, null)));
    sut.isFormValidStream.listen(expectAsync1((isValid) => expect(isValid, false)));
    
    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('6 - Should call Validation with correct password', () async {
    final formData = {'email': null, 'password': password};
    
    sut.validatePassword(password);
    
    verify(() => validation.validate(field: 'password', input: formData)).called(1);
  });
}