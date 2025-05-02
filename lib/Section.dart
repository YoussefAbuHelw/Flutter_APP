class A extends Auth with N, B {
  @override
  void b() {
    // TODO: implement b
  }

  @override
  void auth() {
    // TODO: implement auth
  }

  @override
  void n() {
    // TODO: implement n
  }
}

abstract mixin class N {
  void n();
}

abstract mixin class B {
  void b();
}

abstract class Auth {
  void auth();
}
