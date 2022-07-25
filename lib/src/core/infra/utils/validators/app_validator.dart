import 'package:flutter/widgets.dart' show FormFieldValidator, TextEditingController;

import 'cnpj_validator.dart';
import 'cpf_validator.dart';

class AppValidator {
  AppValidator._();

  static FormFieldValidator required(String m) {
    return (v) {
      if (v?.isEmpty ?? true) return m;
      return null;
    };
  }

  static FormFieldValidator<String> min(int min, String m) {
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if ((v?.length ?? 0) < min) return m;
      return null;
    };
  }

  static FormFieldValidator<String> max(int max, String m) {
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if ((v?.length ?? 0) > max) return m;
      return null;
    };
  }

  static FormFieldValidator<String> between(
    int minimumLength,
    int maximumLength,
    String errorMessage,
  ) {
    assert(minimumLength < maximumLength);
    return multiple([
      min(minimumLength, errorMessage),
      max(maximumLength, errorMessage),
    ]);
  }

  static FormFieldValidator<String> number(String m) {
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if (double.tryParse(v!) != null) {
        return null;
      } else {
        return m;
      }
    };
  }

  static FormFieldValidator<String> email(String m) {
    return (v) {
      if (v?.isEmpty ?? true) return null;
      final emailRegex = RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
      if (emailRegex.hasMatch(v!)) return null;
      return m;
    };
  }

  static FormFieldValidator<String> cpf(String m) {
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if (CpfValidator.isValid(v!)) {
        return null;
      } else {
        return m;
      }
    };
  }

  static FormFieldValidator<String> cnpj(String m) {
    return (v) {
      if (v?.isEmpty ?? true) return null;
      if (CNPJValidator.isValid(v!)) {
        return null;
      } else {
        return m;
      }
    };
  }

  static FormFieldValidator<String> multiple(List<FormFieldValidator<String>> v) {
    return (value) {
      for (final validator in v) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }

  static FormFieldValidator<String> date(String errorMessage) {
    return (value) {
      final date = DateTime.tryParse(value ?? '');
      if (date == null) {
        return errorMessage;
      }
      return null;
    };
  }

  static FormFieldValidator<String> compare(TextEditingController? controller, String message) {
    return (value) {
      final textCompare = controller?.text ?? '';
      if (value == null || textCompare != value) {
        return message;
      }
      return null;
    };
  }
}
