enum Flavor {
  YGOR,
  THIAGO,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.YGOR:
        return 'App do Ygor';
      case Flavor.THIAGO:
        return 'App do Thiago';
      default:
        return 'title';
    }
  }

}
