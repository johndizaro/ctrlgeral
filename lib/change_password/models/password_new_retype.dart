import 'package:formz/formz.dart';

enum PasswordNewRetypeValidationError { empty }

class PasswordNewRetype extends FormzInput<String, PasswordNewRetypeValidationError> {
  const PasswordNewRetype.pure() : super.pure('');
  const PasswordNewRetype.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordNewRetypeValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : PasswordNewRetypeValidationError.empty;
  }
}
