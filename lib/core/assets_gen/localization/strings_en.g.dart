///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
	late final TranslationsMapEn map = TranslationsMapEn.internal(_root);
	late final TranslationsDrawerEn drawer = TranslationsDrawerEn.internal(_root);
	late final TranslationsErrorEn error = TranslationsErrorEn.internal(_root);
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSettingsSwitchTheThemeEn SwitchTheTheme = TranslationsSettingsSwitchTheThemeEn.internal(_root);
	late final TranslationsSettingsSwithTheDBEn SwithTheDB = TranslationsSettingsSwithTheDBEn.internal(_root);
}

// Path: map
class TranslationsMapEn {
	TranslationsMapEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get settings => 'Settings';
}

// Path: drawer
class TranslationsDrawerEn {
	TranslationsDrawerEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Map App Location'
	String get name => 'Map App Location';

	/// en: 'v1.0.0'
	String get version => 'v1.0.0';
}

// Path: error
class TranslationsErrorEn {
	TranslationsErrorEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Oops, something was wrong'
	String get errorText => 'Oops, something was wrong';
}

// Path: settings.SwitchTheTheme
class TranslationsSettingsSwitchTheThemeEn {
	TranslationsSettingsSwitchTheThemeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Switch the theme'
	String get theme => 'Switch the theme';

	/// en: 'Light Theme'
	String get light => 'Light Theme';

	/// en: 'Dark Theme'
	String get dark => 'Dark Theme';
}

// Path: settings.SwithTheDB
class TranslationsSettingsSwithTheDBEn {
	TranslationsSettingsSwithTheDBEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose a type of database'
	String get db => 'Choose a type of database';

	/// en: 'Drift'
	String get drift => 'Drift';

	/// en: 'Sqlite3'
	String get sqlite => 'Sqlite3';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		return switch (path) {
			'settings.SwitchTheTheme.theme' => 'Switch the theme',
			'settings.SwitchTheTheme.light' => 'Light Theme',
			'settings.SwitchTheTheme.dark' => 'Dark Theme',
			'settings.SwithTheDB.db' => 'Choose a type of database',
			'settings.SwithTheDB.drift' => 'Drift',
			'settings.SwithTheDB.sqlite' => 'Sqlite3',
			'map.settings' => 'Settings',
			'drawer.name' => 'Map App Location',
			'drawer.version' => 'v1.0.0',
			'error.errorText' => 'Oops, something was wrong',
			_ => null,
		};
	}
}

