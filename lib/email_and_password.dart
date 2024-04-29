import 'package:flutter/foundation.dart';

typedef E = Emails;
typedef P = Passwords;

class Emails {
  const Emails();

  static const email = Key('milos@gmail.com');
}

class Passwords {
  const Passwords();

  static const password = Key('testing');
}
