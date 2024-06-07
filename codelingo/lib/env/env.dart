import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'modelId', obfuscate: true)
  static final String modelId = _Env.modelId;

  @EnviedField(varName: 'openaiApiKey', obfuscate: true)
  static final String openaiApiKey = _Env.openaiApiKey;
}
 
//dart run build_runner build --delete-conflicting-outputs