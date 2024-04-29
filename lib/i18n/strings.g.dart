/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 160 (80 per locale)
///
/// Built on 2024-04-25 at 11:09 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  en(languageCode: 'en', build: Translations.build),
  sr(languageCode: 'sr', build: _StringsSr.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode, // ignore: unused_element
      this.countryCode, // ignore: unused_element
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, Translations> build;

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, Translations> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, Translations> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, Translations> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

	// Translations
	String get welcome => 'Welcome to Libry';
	String get email => 'Email';
	String get email_hint => 'Your email address';
	String get email_format_error => 'Email is not in correct format!';
	String get password => 'Password';
	String get password_hint => 'Your password';
	String get password_error => 'Password should contain 6 characters!';
	String get forgot_password => 'Forgot your password?';
	String get confirm_password => 'Confirm password';
	String get confirm_password_hint => 'Repeat your password';
	String get confirm_password_error => 'Passwords do not match!';
	String get login => 'Login';
	String get singup => 'Sign up';
	String get singup_redirect => 'Don\'t have an account?';
	String get singin_redirect => 'Already have an account?';
	String get email_already_in_use => 'Email is already in use!';
	String get invalid_credential => 'Invalid email or password!';
	String get auth_failed => 'Authentication failed! Please try again later!';
	String get reset_password_title => 'Please enter your email below and we will send you a reset link.';
	String get reset_password_btn => 'Send reset link';
	String get reset_password_success => 'We\'ve sent you an email with a link to reset your password. Please check your emails.';
	String get reset_password_error => 'Failed to send reset link. Please try again later!';
	String get go_back => 'Go back';
	String get platforms => 'Platforms';
	String get platforms_empty => 'There are no platforms found';
	String get tab_most_popular => 'Most popular';
	String get tab_newest => 'Newest';
	String get search => 'Search';
	String get search_hint => 'Enter search keyword in order to find packages you are looking for.';
	String get search_empty => 'There are no found packages for the entered search criteria!';
	String get libraries_error => 'Failed to load libraries.';
	String get platforms_error => 'Failed to load platforms.';
	String get internet_error => 'No internet connection.';
	String get error => 'Error occurred. Try again later.';
	String get my_account => 'My Account';
	String get name => 'Name';
	String get lastname => 'Last name';
	String get logout => 'Log out';
	String get change => 'change';
	String get confirm_logout => 'Are you sure you want to log out?';
	String get yes => 'Yes';
	String get no => 'No';
	String get theme => 'Theme';
	String get language => 'Language';
	String get navigation_home => 'Home';
	String get navigation_favorites => 'Favorites';
	String get navigation_profile => 'Account';
	String get language_en => 'English';
	String get language_sr => 'Serbian';
	String get library_details => 'Library details';
	String get license => 'License';
	String get keywords => 'Keywords';
	String get repo_status => 'Repository status';
	String get platform => 'Platform';
	String get stars => 'Stars';
	String get latest_release_num => 'Latest release number';
	String get published_at => 'Published at';
	String get latest_stable_release => 'Latest stable release';
	String get homepage => 'Homepage';
	String get theme_system => 'System theme';
	String get theme_light => 'Light theme';
	String get theme_dark => 'Dark theme';
	String get delete_account => 'Delete account';
	String get confirm_delete_account => 'Are you sure you want to delete your account?';
	String get delete_account_error => 'Failed to delete user account, please try again later.';
	String get reauth_account_error => 'Failed to reauthenticate, please try again later.';
	String get end_of_list => 'You\'ve reached the end';
	String get back_history => 'No back history item';
	String get forward_history => 'No forward history item';
	String get add_favorites => 'Package added to favorites';
	String get remove_favorites => 'Package removed from favorites';
	String get error_favorites => 'Error occurred while updating favorites';
	String get no_favorites => 'There are no favorite packages yet!';
	String get explanation_adding => 'If you want to add a package to your favorites, press the heart icon.';
	String get reauthenticate => 'Re-authenticate';
	String get enter_password => 'Please enter your password to continue';
	String get confirm => 'Confirm';
	String get cancel => 'Cancel';
	String get wrong_password => 'Invalid password, please try again.';
	String get too_many_requests => 'Too many requests, please try again later.';
  String get onborading_title_search => 'Find your perfect code companion!';
  String get welcome_onboarding => 'Welcome to Libry!';
  String get onborading_title_details => 'Discover package details!';
  String get onborading_title_favorites => 'Create your favorites!';
  String get onborading_description_welcome => "Get ready to dive into the world of programming tools! We'll guide you through the vast landscape of programming tools by introducing essential packages.";
  String get onborading_description_search => 'Embark on a journey of library exploration with our intuitive search feature. Quickly find the perfect libraries to enhance your projects.';
  String get onborading_description_details => 'Explore in-depth information about package to elevate your projects. Dive into detailed descriptions, versions, and more with our package details feature.';
  String get onborading_description_favorites => 'Curate your favorite libraries effortlessly. Easily add your preferred libraries, then enjoy access to your curated list whenever you need it.';

}

// Path: <root>
class _StringsSr implements Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsSr.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.sr,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <sr>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _StringsSr _root = this; // ignore: unused_field

	// Translations
	@override String get welcome => 'Dobrodošli u Libry';
	@override String get email => 'Email adresa';
	@override String get email_hint => 'Vaša email adresa';
	@override String get email_format_error => 'Email adresa nije u dobrom formatu!';
	@override String get password => 'Lozinka';
	@override String get password_hint => 'Vaša lozinka';
	@override String get password_error => 'Lozinka mora da sadrži bar 6 karaktera!';
	@override String get forgot_password => 'Zaboravili ste lozinku?';
	@override String get confirm_password => 'Potvrdite lozinku';
	@override String get confirm_password_hint => 'Ponovite Vašu lozinku';
	@override String get confirm_password_error => 'Lozinke se ne podudaraju!';
	@override String get login => 'Prijavi se';
	@override String get singup => 'Registruj se';
	@override String get singup_redirect => 'Nemate nalog?';
	@override String get singin_redirect => 'Već imate nalog?';
	@override String get email_already_in_use => 'Email adresa se već koristi!';
	@override String get invalid_credential => 'Email adresa ili lozinka nisu ispravni!';
	@override String get auth_failed => 'Autentifikacija nije uspela! Molimo Vas pokušajte kasnije.';
	@override String get reset_password_title => 'Molim Vas upišite Vašu email adresu ispod i poslaćemo Vam reset link.';
	@override String get reset_password_btn => 'Pošalji reset link';
	@override String get reset_password_success => 'Poslali smo Vam email sa uputstvima kako da resetujete Vaš password. Molimo Vas proverite email sanduče.';
	@override String get reset_password_error => 'Greška prilikom slanja emaila! Molimo Vas pokušajte kasnije.';
	@override String get go_back => 'Idi nazad';
	@override String get platforms => 'Platforme';
	@override String get platforms_empty => 'Nema dostupnih platformi';
	@override String get tab_most_popular => 'Najpopularniji';
	@override String get tab_newest => 'Najnoviji';
	@override String get search => 'Pretraga';
	@override String get search_hint => 'Unesite ključnu reč da pronađete paket koji tražite.';
	@override String get search_empty => 'Nema dostupnih paketa za uneti kriterijum pretrage.';
	@override String get libraries_error => 'Greška prilikom učitavanja paketa!';
	@override String get platforms_error => 'Greška prilikom učitavanja platformi!';
	@override String get internet_error => 'Nemate pristup internetu!';
	@override String get error => 'Došlo je do greške. Pokušajte ponovo kasnije.';
	@override String get my_account => 'Moj nalog';
	@override String get name => 'Ime';
	@override String get lastname => 'Prezime';
	@override String get logout => 'Odjavite se';
	@override String get change => 'izmeni';
	@override String get confirm_logout => 'Da li ste sigurni da želite da se odjavite?';
	@override String get yes => 'Da';
	@override String get no => 'Ne';
	@override String get theme => 'Tema';
	@override String get language => 'Jezik';
	@override String get navigation_home => 'Početna';
	@override String get navigation_favorites => 'Omiljeno';
	@override String get navigation_profile => 'Nalog';
	@override String get language_en => 'Engleski';
	@override String get language_sr => 'Srpski';
	@override String get library_details => 'Detalji biblioteke';
	@override String get license => 'Licenca';
	@override String get keywords => 'Ključne reči';
	@override String get repo_status => 'Status repozitorijuma';
	@override String get platform => 'Platforma';
	@override String get stars => 'Zvezde';
	@override String get latest_release_num => 'Broj poslednjeg izdanja';
	@override String get published_at => 'Objavljeno u';
	@override String get latest_stable_release => 'Stabilno izdanje';
	@override String get homepage => 'Početna stranica';
	@override String get theme_system => 'Sistemska tema';
	@override String get theme_light => 'Svetla tema';
	@override String get theme_dark => 'Tamna tema';
	@override String get delete_account => 'Obriši nalog';
	@override String get confirm_delete_account => 'Da li ste sigurni da želite da obrišete svoj nalog?';
	@override String get delete_account_error => 'Nije uspelo brisanje korisničkog naloga, molimo pokušajte kasnije.';
	@override String get reauth_account_error => 'Nije uspela autentifikacija, molimo pokušajte kasnije.';
	@override String get end_of_list => 'Došli ste do kraja';
	@override String get back_history => 'Nema stavki u istoriji';
	@override String get forward_history => 'Nema stavki ispred';
	@override String get add_favorites => 'Paket dodat u omiljene';
	@override String get remove_favorites => 'Paket uklonjen iz omiljenih';
	@override String get error_favorites => 'Greška prilikom ažuriranja omiljenih paketa';
	@override String get no_favorites => 'Nemate omiljene pakete!';
	@override String get explanation_adding => 'Ako želite da dodate paket u omiljene, pritisnite na ikonu srca.';
	@override String get reauthenticate => 'Autentifikujte se';
	@override String get enter_password => 'Unesite svoju lozinku da biste nastavili';
	@override String get confirm => 'Potvrdi';
	@override String get cancel => 'Otkaži';
	@override String get wrong_password => 'Pogrešna lozinka, pokušajte ponovo.';
	@override String get too_many_requests => 'Previše puta ste poslali zahtev, pokušajte ponovo kasnije.';
  @override String get welcome_onboarding => 'Dobrodošli u Libry!';
  @override String get onborading_title_search => 'Pronađite idealnog saradnika za kodiranje!';
  @override String get onborading_title_details => 'Otkrijte detalje o paketu!';
  @override String get onborading_title_favorites => 'Vaša lista favorita!';
  @override String get onborading_description_welcome => 'Pripremite se za istraživanje sveta programskih alata! Vodićemo vas kroz raznovrstno okruženje alata predstavljajući vam osnovne pakete.';
  @override String get onborading_description_search => 'Krenite na putovanje istraživanja biblioteka uz našu intuitivnu pretragu. Brzo pronađite savršene biblioteke koje će unaprediti vaše projekte.';
  @override String get onborading_description_details => 'Istražite detaljne informacije o paketu kako biste unapredili svoje projekte. Zaronite u detaljne opise, verzije i dodatne informacije pomoću naše funkcije detalja o paketu.';
  @override String get onborading_description_favorites => 'Jednostavno dodajte vaše preferirane biblioteke, a zatim uživajte u pristupu vašoj odabranoj listi kad god vam je potrebno.';

}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'welcome': return 'Welcome to Libry';
			case 'email': return 'Email';
			case 'email_hint': return 'Your email address';
			case 'email_format_error': return 'Email is not in correct format!';
			case 'password': return 'Password';
			case 'password_hint': return 'Your password';
			case 'password_error': return 'Password should contain 6 characters!';
			case 'forgot_password': return 'Forgot your password?';
			case 'confirm_password': return 'Confirm password';
			case 'confirm_password_hint': return 'Repeat your password';
			case 'confirm_password_error': return 'Passwords do not match!';
			case 'login': return 'Login';
			case 'singup': return 'Sign up';
			case 'singup_redirect': return 'Don\'t have an account?';
			case 'singin_redirect': return 'Already have an account?';
			case 'email_already_in_use': return 'Email is already in use!';
			case 'invalid_credential': return 'Invalid email or password!';
			case 'auth_failed': return 'Authentication failed! Please try again later!';
			case 'reset_password_title': return 'Please enter your email below and we will send you a reset link.';
			case 'reset_password_btn': return 'Send reset link';
			case 'reset_password_success': return 'We\'ve sent you an email with a link to reset your password. Please check your emails.';
			case 'reset_password_error': return 'Failed to send reset link. Please try again later!';
			case 'go_back': return 'Go back';
			case 'platforms': return 'Platforms';
			case 'platforms_empty': return 'There are no platforms found';
			case 'tab_most_popular': return 'Most popular';
			case 'tab_newest': return 'Newest';
			case 'search': return 'Search';
			case 'search_hint': return 'Enter search keyword in order to find packages you are looking for.';
			case 'search_empty': return 'There are no found packages for the entered search criteria!';
			case 'libraries_error': return 'Failed to load libraries.';
			case 'platforms_error': return 'Failed to load platforms.';
			case 'internet_error': return 'No internet connection.';
			case 'error': return 'Error occurred. Try again later.';
			case 'my_account': return 'My Account';
			case 'name': return 'Name';
			case 'lastname': return 'Last name';
			case 'logout': return 'Log out';
			case 'change': return 'change';
			case 'confirm_logout': return 'Are you sure you want to log out?';
			case 'yes': return 'Yes';
			case 'no': return 'No';
			case 'theme': return 'Theme';
			case 'language': return 'Language';
			case 'navigation_home': return 'Home';
			case 'navigation_favorites': return 'Favorites';
			case 'navigation_profile': return 'Account';
			case 'language_en': return 'English';
			case 'language_sr': return 'Serbian';
			case 'library_details': return 'Library details';
			case 'license': return 'License';
			case 'keywords': return 'Keywords';
			case 'repo_status': return 'Repository status';
			case 'platform': return 'Platform';
			case 'stars': return 'Stars';
			case 'latest_release_num': return 'Latest release number';
			case 'published_at': return 'Published at';
			case 'latest_stable_release': return 'Latest stable release';
			case 'homepage': return 'Homepage';
			case 'theme_system': return 'System theme';
			case 'theme_light': return 'Light theme';
			case 'theme_dark': return 'Dark theme';
			case 'delete_account': return 'Delete account';
			case 'confirm_delete_account': return 'Are you sure you want to delete your account?';
			case 'delete_account_error': return 'Failed to delete user account, please try again later.';
			case 'reauth_account_error': return 'Failed to reauthenticate, please try again later.';
			case 'end_of_list': return 'You\'ve reached the end';
			case 'back_history': return 'No back history item';
			case 'forward_history': return 'No forward history item';
			case 'add_favorites': return 'Package added to favorites';
			case 'remove_favorites': return 'Package removed from favorites';
			case 'error_favorites': return 'Error occurred while updating favorites';
			case 'no_favorites': return 'There are no favorite packages yet!';
			case 'explanation_adding': return 'If you want to add a package to your favorites, press the heart icon.';
			case 'reauthenticate': return 'Re-authenticate';
			case 'enter_password': return 'Please enter your password to continue';
			case 'confirm': return 'Confirm';
			case 'cancel': return 'Cancel';
			case 'wrong_password': return 'Invalid password, please try again.';
			case 'too_many_requests': return 'Too many requests, please try again later.';
      case 'welcome_onboarding' : return  'Welcome to Libry!';
      case 'onborading_title_search' : return 'Find your perfect code companion!';
      case 'onborading_title_details' : return 'Discover package cetails!';
      case 'onborading_title_favorites' : return 'Create your favorites!';
      case 'onborading_description_search' : return 'Embark on a journey of library exploration with our intuitive search feature. Quickly find the perfect libraries to enhance your projects.';
      case 'onborading_description_welcome' : return "Get ready to dive into the world of programming tools! We'll guide you through the vast landscape of programming tools by introducing essential packages.";
      case 'onborading_description_details' : return 'Explore in-depth information about package to elevate your projects. Dive into detailed descriptions, versions, and more with our package details feature.';
      case 'onborading_description_favorites' : return 'Curate your favorite libraries effortlessly. Easily add your preferred libraries, then enjoy access to your curated list whenever you need it.';    
			default: return null;
		}
	}
}

extension on _StringsSr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'welcome': return 'Dobrodošli u Libry';
			case 'email': return 'Email adresa';
			case 'email_hint': return 'Vaša email adresa';
			case 'email_format_error': return 'Email adresa nije u dobrom formatu!';
			case 'password': return 'Lozinka';
			case 'password_hint': return 'Vaša lozinka';
			case 'password_error': return 'Lozinka mora da sadrži bar 6 karaktera!';
			case 'forgot_password': return 'Zaboravili ste lozinku?';
			case 'confirm_password': return 'Potvrdite lozinku';
			case 'confirm_password_hint': return 'Ponovite Vašu lozinku';
			case 'confirm_password_error': return 'Lozinke se ne podudaraju!';
			case 'login': return 'Prijavi se';
			case 'singup': return 'Registruj se';
			case 'singup_redirect': return 'Nemate nalog?';
			case 'singin_redirect': return 'Već imate nalog?';
			case 'email_already_in_use': return 'Email adresa se već koristi!';
			case 'invalid_credential': return 'Email adresa ili lozinka nisu ispravni!';
			case 'auth_failed': return 'Autentifikacija nije uspela! Molimo Vas pokušajte kasnije.';
			case 'reset_password_title': return 'Molim Vas upišite Vašu email adresu ispod i poslaćemo Vam reset link.';
			case 'reset_password_btn': return 'Pošalji reset link';
			case 'reset_password_success': return 'Poslali smo Vam email sa uputstvima kako da resetujete Vaš password. Molimo Vas proverite email sanduče.';
			case 'reset_password_error': return 'Greška prilikom slanja emaila! Molimo Vas pokušajte kasnije.';
			case 'go_back': return 'Idi nazad';
			case 'platforms': return 'Platforme';
			case 'platforms_empty': return 'Nema dostupnih platformi';
			case 'tab_most_popular': return 'Najpopularniji';
			case 'tab_newest': return 'Najnoviji';
			case 'search': return 'Pretraga';
			case 'search_hint': return 'Unesite ključnu reč da pronađete paket koji tražite.';
			case 'search_empty': return 'Nema dostupnih paketa za uneti kriterijum pretrage.';
			case 'libraries_error': return 'Greška prilikom učitavanja paketa!';
			case 'platforms_error': return 'Greška prilikom učitavanja platformi!';
			case 'internet_error': return 'Nemate pristup internetu!';
			case 'error': return 'Došlo je do greške. Pokušajte ponovo kasnije.';
			case 'my_account': return 'Moj nalog';
			case 'name': return 'Ime';
			case 'lastname': return 'Prezime';
			case 'logout': return 'Odjavite se';
			case 'change': return 'izmeni';
			case 'confirm_logout': return 'Da li ste sigurni da želite da se odjavite?';
			case 'yes': return 'Da';
			case 'no': return 'Ne';
			case 'theme': return 'Tema';
			case 'language': return 'Jezik';
			case 'navigation_home': return 'Početna';
			case 'navigation_favorites': return 'Omiljeno';
			case 'navigation_profile': return 'Nalog';
			case 'language_en': return 'Engleski';
			case 'language_sr': return 'Srpski';
			case 'library_details': return 'Detalji biblioteke';
			case 'license': return 'Licenca';
			case 'keywords': return 'Ključne reči';
			case 'repo_status': return 'Status repozitorijuma';
			case 'platform': return 'Platforma';
			case 'stars': return 'Zvezde';
			case 'latest_release_num': return 'Broj poslednjeg izdanja';
			case 'published_at': return 'Objavljeno u';
			case 'latest_stable_release': return 'Stabilno izdanje';
			case 'homepage': return 'Početna stranica';
			case 'theme_system': return 'Sistemska tema';
			case 'theme_light': return 'Svetla tema';
			case 'theme_dark': return 'Tamna tema';
			case 'delete_account': return 'Obriši nalog';
			case 'confirm_delete_account': return 'Da li ste sigurni da želite da obrišete svoj nalog?';
			case 'delete_account_error': return 'Nije uspelo brisanje korisničkog naloga, molimo pokušajte kasnije.';
			case 'reauth_account_error': return 'Nije uspela autentifikacija, molimo pokušajte kasnije.';
			case 'end_of_list': return 'Došli ste do kraja';
			case 'back_history': return 'Nema stavki u istoriji';
			case 'forward_history': return 'Nema stavki ispred';
			case 'add_favorites': return 'Paket dodat u omiljene';
			case 'remove_favorites': return 'Paket uklonjen iz omiljenih';
			case 'error_favorites': return 'Greška prilikom ažuriranja omiljenih paketa';
			case 'no_favorites': return 'Nemate omiljene pakete!';
			case 'explanation_adding': return 'Ako želite da dodate paket u omiljene, pritisnite na ikonu srca.';
			case 'reauthenticate': return 'Autentifikujte se';
			case 'enter_password': return 'Unesite svoju lozinku da biste nastavili';
			case 'confirm': return 'Potvrdi';
			case 'cancel': return 'Otkaži';
			case 'wrong_password': return 'Pogrešna lozinka, pokušajte ponovo.';
			case 'too_many_requests': return 'Previše puta ste poslali zahtev, pokušajte ponovo kasnije.';
      case 'welcome_onboarding' : return  'Dobrodošli u Libry!';
      case 'onborading_title_search' : return 'Pronađite idealnog saradnika za kodiranje!';
      case 'onborading_title_details' : return 'Otkrijte detalje o paketu!';
      case 'onborading_title_favorites' : return 'Vaša lista favorita!';
      case 'onborading_description_welcome' : return "Pripremite se za istraživanje sveta programskih alata! Vodićemo vas kroz raznovrstno okruženje alata predstavljajući vam osnovne pakete";
      case 'onborading_description_search' : return 'Krenite na putovanje istraživanja biblioteka uz našu intuitivnu pretragu. Brzo pronađite savršene biblioteke koje će unaprediti vaše projekte.';
      case 'onborading_description_details' : return 'Istražite detaljne informacije o paketu kako biste unapredili svoje projekte. Zaronite u detaljne opise, verzije i dodatne informacije pomoću naše funkcije detalja o paketu.';
      case 'onborading_description_favorites' : return 'Jednostavno dodajte vaše preferirane biblioteke, a zatim uživajte u pristupu vašoj odabranoj listi kad god vam je potrebno.';    

			default: return null;
		}
	}
}
