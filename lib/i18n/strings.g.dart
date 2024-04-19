/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 92 (46 per locale)
///
/// Built on 2024-04-18 at 15:41 UTC

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

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
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
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
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
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
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
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

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
	String get tab_most_popular => 'Most popular packages';
	String get tab_newest => 'Newest packages';
	String get search => 'Search';
	String get search_hint => 'Enter search keyword in order to find packages you are looking for.';
	String get search_empty => 'There are no found packages for the entered search criteria!';
	String get libraries_error => 'Failed to load libraries.';
	String get platforms_error => 'Failed to load platforms.';
	String get internet_error => 'No internet connection.';
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
  String get favorites => 'Favorites';
  String get add_favorites => 'Library added to favorites';
  String get remove_favorites => 'Library removed from favorites';
  String get  error_favorites => 'Error occurred while updating favorites';
  String get no_favorites => 'There are no favorite packages yet';
  String get explanation_adding => 'If you want to receive updates about your favorite packages, add it to favorites by pressing heart icon.';
}

// Path: <root>
class _StringsSr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsSr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.sr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsSr _root = this; // ignore: unused_field

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
	@override String get tab_most_popular => 'Najpopularniji paketi';
	@override String get tab_newest => 'Najnoviji paketi';
	@override String get search => 'Pretraga';
	@override String get search_hint => 'Unesite ključnu reč da pronađete paket koji tražite.';
	@override String get search_empty => 'Nema dostupnih paketa za uneti kriterijum pretrage.';
	@override String get libraries_error => 'Greška prilikom učitavanja paketa!';
	@override String get platforms_error => 'Greška prilikom učitavanja platformi!';
	@override String get internet_error => 'Nemate pristup internetu!';
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
  @override String get favorites => 'Omiljeno';
  @override String get add_favorites => 'Paket dodat u omiljene';
  @override String get remove_favorites => 'Paket uklonjen iz omiljenih';
  @override String get  error_favorites => 'Greška prilikom ažuriranja omiljenih paketa';
  @override String get no_favorites => 'Nemate omiljene pakete!';
  @override String get explanation_adding => 'Ako želite da dobijate ažuriranja o vašim omiljenim paketima, dodajte ih u omiljene pritiskom na ikonu srca.';
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
			case 'tab_most_popular': return 'Most popular packages';
			case 'tab_newest': return 'Newest packages';
			case 'search': return 'Search';
			case 'search_hint': return 'Enter search keyword in order to find packages you are looking for.';
			case 'search_empty': return 'There are no found packages for the entered search criteria!';
			case 'libraries_error': return 'Failed to load libraries.';
			case 'platforms_error': return 'Failed to load platforms.';
			case 'internet_error': return 'No internet connection.';
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
      case 'favorites': return 'Favorites';
      case 'add_favorites' : return 'Package added to favorites.';
      case 'remove_favorites' : return 'Package removed from favorites';
      case 'error_favorites'  : return 'Error occurred while updating favorites';
      case 'no_favorites' : return 'There are no favorite packages yet!';
      case 'explanation_adding' : return 'If you want to receive updates about your favorite packages, add it to favorites by pressing heart icon.';

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
			case 'tab_most_popular': return 'Najpopularniji paketi';
			case 'tab_newest': return 'Najnoviji paketi';
			case 'search': return 'Pretraga';
			case 'search_hint': return 'Unesite ključnu reč da pronađete paket koji tražite.';
			case 'search_empty': return 'Nema dostupnih paketa za uneti kriterijum pretrage.';
			case 'libraries_error': return 'Greška prilikom učitavanja paketa!';
			case 'platforms_error': return 'Greška prilikom učitavanja platformi!';
			case 'internet_error': return 'Nemate pristup internetu!';
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
      case 'favorites': return 'Omiljeno';
      case 'add_favorites' : return 'Paket dodat u omiljene';
      case 'remove_favorites' : return 'Paket uklonjen iz omiljenih';
      case 'error_favorites'  : return 'Greška prilikom ažuriranja omiljenih paketa';
      case 'no_favorites' : return 'Nemate omiljene pakete!';
      case 'explanation_adding' : return 'Ako želite da dobijate ažuriranja o vašim omiljenim paketima, dodajte ih u omiljene pritiskom na ikonu srca.';
			default: return null;
		}
	}
}
