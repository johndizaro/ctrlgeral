import 'package:formz/formz.dart';

enum PasswordNewValidationError { empty }

class PasswordNew extends FormzInput<String, PasswordNewValidationError> {
  const PasswordNew.pure() : super.pure('');
  const PasswordNew.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordNewValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : PasswordNewValidationError.empty;
  }
}
