import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'Giphy_key')
  static const String giphyKey = _Env.giphyKey;
}
