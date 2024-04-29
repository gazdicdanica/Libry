import 'package:flutter/foundation.dart';

typedef K = Keys;

class Keys {
  const Keys();

  //SIGN UP, LOGIN, FORGOT PASSWORD KEYS
  static const nextBtn = Key('next');
  static const emailField = Key('email'); //
  static const passwordField = Key('password'); //
  static const confirmPasswordField = Key('confirmPassword');//
  static const loginBtn = Key('login');//
  static const logoutBtn = Key('logout');//
  static const forgotPassword = Key('forgotPassword');//
  static const forgotMessage = Key('forgotMessage');//
  static const resetBtn = Key('resetLink');//
  static const resetMessage = Key('resetMessage');//
  static const goBackBtn = Key('goBack');//
  static const reloadBtn = Key('reload');//
  static const removeFav = Key('removeFav');


  //NAVIGATION BAR KEYS
  static const accountBtn = Key('account');
  static const homeBtn = Key('home');
  static const favoritesBtn = Key('favorites');

  //SEARCH SCREEN
  static const searchBtn = Key('search');
  static const searchInputField = Key('searchInputField');
  static const removeBtn = Key('removeBtn');

  //LIST OF PACKAGES SCREEN
  static const mpl = Key('mpl');
  static const nwl = Key('nwl');
  static const package = Key('package');
  static const favorite = Key('favorite');
  static const webView = Key('keyView');
  static const backWV = Key('backWV');

  //MY ACCOUNT KEYS
  static const changeTheme = Key('changeTheme');
  static const deleteBtn = Key('deleteBtn');

  //DO THE SAME FOR EMAIL I PASSWORD I WELCOME TO LIBRY FOR EXAMPLE

}
