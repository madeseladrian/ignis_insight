import 'package:mocktail/mocktail.dart';

import 'package:ignis_insight/domain/entities/entities.dart';
import 'package:ignis_insight/domain/helpers/helpers.dart';
import 'package:ignis_insight/domain/usecases/usecases.dart';

class AuthenticationSpy extends Mock implements Authentication {
  When mockAuthenticationCall() => when(() => auth(any()));
  void mockAuthentication(AccountEntity data) => 
    mockAuthenticationCall().thenAnswer((_) async => data);
  void mockAuthenticationError(DomainError error) => 
    mockAuthenticationCall().thenThrow(error);
}