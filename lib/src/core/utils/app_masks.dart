import 'package:flutter/services.dart';
import 'package:weather_app_bloc_flutter/src/core/infra/utils/masks/mask_text_input_formatter.dart';
import 'package:weather_app_bloc_flutter/src/core/infra/utils/masks/number_decimal_input_formatter.dart';

class AppMasks {
  AppMasks._();

  static final money = NumberDecimalInputFormatter(
    symbol: 'R\$',
    locale: 'pt_Br',
  );

  static final cep = MaskTextInputFormatter(mask: '#####-###');

  static FilteringTextInputFormatter onlyLetters = FilteringTextInputFormatter.allow(
    RegExp('[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+|s'),
  );
}
