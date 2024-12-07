import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() =>
      ['en', 'fr', 'ar', 'es', 'de', 'it', 'zh_Hans'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? arText = '',
    String? esText = '',
    String? deText = '',
    String? itText = '',
    String? zh_HansText = '',
  }) =>
      [
        enText,
        frText,
        arText,
        esText,
        deText,
        itText,
        zh_HansText
      ][languageIndex] ??
      '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // landing_2
  {
    '8jzezbkv': {
      'en': 'RETURNING USER',
      'ar': 'المستخدم العائد',
      'de': 'WIEDERKOMMENDER BENUTZER',
      'es': 'USUARIO QUE REGRESA',
      'fr': 'UTILISATEUR RÉCIT',
      'it': 'UTENTE DI RITORNO',
      'zh_Hans': '回访用户',
    },
    'eoqzsria': {
      'en': 'NEW ACCOUNT',
      'ar': 'حساب جديد',
      'de': 'NEUES KONTO',
      'es': 'NUEVA CUENTA',
      'fr': 'NOUVEAU COMPTE',
      'it': 'NUOVO ACCOUNT',
      'zh_Hans': '新账户',
    },
    'ndn8csz9': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
      'zh_Hans': '家',
    },
  },
  // register_1
  {
    'j3ahtyum': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'de': 'E-Mail',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'it': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    '0y72540s': {
      'en': 'Set Username',
      'ar': 'تعيين اسم المستخدم',
      'de': 'Benutzernamen festlegen',
      'es': 'Establecer nombre de usuario',
      'fr': 'Définir le nom d\'utilisateur',
      'it': 'Imposta nome utente',
      'zh_Hans': '设置用户名',
    },
    'iwh8blq0': {
      'en': 'Set Password',
      'ar': 'تعيين كلمة المرور',
      'de': 'Passwort festlegen',
      'es': 'Establecer contraseña',
      'fr': 'Définir le mot de passe',
      'it': 'Imposta password',
      'zh_Hans': '设置密码',
    },
    'rbyjtamj': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Passwort bestätigen',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
      'it': 'Conferma password',
      'zh_Hans': '确认密码',
    },
    'zjt9fa7m': {
      'en': 'Create Profile',
      'ar': 'إنشاء الملف الشخصي',
      'de': 'Profil erstellen',
      'es': 'Crear perfil',
      'fr': 'Créer un profil',
      'it': 'Crea profilo',
      'zh_Hans': '创建个人资料',
    },
    '9ff2av9a': {
      'en': 'Already have an account? ',
      'ar': 'هل لديك حساب بالفعل؟',
      'de': 'Hast du schon ein Konto?',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte ?',
      'it': 'Hai già un account?',
      'zh_Hans': '已有账户？',
    },
    '5ekued7g': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
      'de': 'Anmelden',
      'es': 'Iniciar sesión',
      'fr': 'Se connecter',
      'it': 'Registrazione',
      'zh_Hans': '登入',
    },
  },
  // login
  {
    'frgf67v4': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'de': 'E-Mail',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
      'it': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    'nk489rao': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'it': 'Password',
      'zh_Hans': '密码',
    },
    'jghlmdp1': {
      'en': 'Grant Access',
      'ar': 'منح الوصول',
      'de': 'Zugriff gewähren',
      'es': 'Conceder acceso',
      'fr': 'Accorder l\'accès',
      'it': 'Concedi l\'accesso',
      'zh_Hans': '授予访问权限',
    },
    't4ih114h': {
      'en': 'Forgot password?',
      'ar': 'هل نسيت كلمة السر؟',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié ?',
      'it': 'Ha dimenticato la password?',
      'zh_Hans': '忘记密码？',
    },
  },
  // landing_1
  {
    'w16ws6x5': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
      'zh_Hans': '家',
    },
  },
  // profile
  {
    '2yunfrvh': {
      'en': 'Randy Alcorn',
      'ar': 'راندي الكورن',
      'de': 'Randy Alcorn',
      'es': 'Randy Alcorn',
      'fr': 'Randy Alcorn',
      'it': 'Randy Alcorn',
      'zh_Hans': '兰迪·阿尔康',
    },
    'oy95ws7i': {
      'en': '240 Sales',
      'ar': '240 مبيعات',
      'de': '240 Verkäufe',
      'es': '240 Ventas',
      'fr': '240 Ventes',
      'it': '240 vendite',
      'zh_Hans': '240 销售',
    },
    'epy1dmex': {
      'en': 'San Antonio, Tx.',
      'ar': 'سان أنطونيو، تكساس.',
      'de': 'San Antonio, Texas.',
      'es': 'San Antonio, Texas.',
      'fr': 'San Antonio, Texas.',
      'it': 'San Antonio, Texas.',
      'zh_Hans': '德克萨斯州圣安东尼奥',
    },
    'j7ylzr3y': {
      'en': 'Trips',
      'ar': 'الرحلات',
      'de': 'Reisen',
      'es': 'Viajes',
      'fr': 'Voyages',
      'it': 'Viaggi',
      'zh_Hans': '旅行',
    },
    'ie4gzdc2': {
      'en': '200',
      'ar': '200',
      'de': '200',
      'es': '200',
      'fr': '200',
      'it': '200',
      'zh_Hans': '200',
    },
    '1gu2boij': {
      'en': 'Favorites',
      'ar': 'المفضلة',
      'de': 'Favoriten',
      'es': 'Favoritos',
      'fr': 'Favoris',
      'it': 'Preferiti',
      'zh_Hans': '收藏夹',
    },
    'uzlldo55': {
      'en': '99',
      'ar': '99',
      'de': '99',
      'es': '99',
      'fr': '99',
      'it': '99',
      'zh_Hans': '99',
    },
    'v4xo0o0b': {
      'en': 'Chatbot',
      'ar': 'المفضلة',
      'de': 'Favoriten',
      'es': 'Favoritos',
      'fr': 'Favoris',
      'it': 'Preferiti',
      'zh_Hans': '收藏夹',
    },
    'akan3idx': {
      'en': 'press here',
      'ar': '99',
      'de': '99',
      'es': '99',
      'fr': '99',
      'it': '99',
      'zh_Hans': '99',
    },
    '386l0p3m': {
      'en': '[username]',
      'ar': '[اسم المستخدم]',
      'de': '[Benutzername]',
      'es': '[nombre de usuario]',
      'fr': '[nom d\'utilisateur]',
      'it': '[nome utente]',
      'zh_Hans': '[用户名]',
    },
    'lisgsj6t': {
      'en': 'Past Trips',
      'ar': 'الرحلات السابقة',
      'de': 'Vergangene Reisen',
      'es': 'Viajes pasados',
      'fr': 'Voyages passés',
      'it': 'Viaggi passati',
      'zh_Hans': '过往旅程',
    },
    'h3mx2ops': {
      'en': 'Activity',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
      'fr': 'Activité',
      'it': 'Attività',
      'zh_Hans': '活动',
    },
    'k211c3ij': {
      'en': 'Favorites',
      'ar': 'المفضلة',
      'de': 'Favoriten',
      'es': 'Favoritos',
      'fr': 'Favoris',
      'it': 'Preferiti',
      'zh_Hans': '收藏夹',
    },
    'xnu3hul5': {
      'en': 'PROFILE',
      'ar': 'حساب تعريفي',
      'de': 'PROFIL',
      'es': 'PERFIL',
      'fr': 'PROFIL',
      'it': 'PROFILO',
      'zh_Hans': '轮廓',
    },
    'w9qxzuk0': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
      'zh_Hans': '家',
    },
  },
  // ItPast
  {
    '1ovoueni': {
      'en': 'PAST TRIPS',
      'ar': 'الرحلات السابقة',
      'de': 'VERGANGENE REISEN',
      'es': 'VIAJES PASADOS',
      'fr': 'VOYAGES PASSÉS',
      'it': 'VIAGGI PASSATI',
      'zh_Hans': '过往旅程',
    },
    '78g4t8e9': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
      'zh_Hans': '家',
    },
  },
  // ItFav
  {
    '62ysntx2': {
      'en': 'FAVORITE TRIPS',
      'ar': 'الرحلات المفضلة',
      'de': 'LIEBLINGSREISEN',
      'es': 'VIAJES FAVORITOS',
      'fr': 'VOYAGES PRÉFÉRÉS',
      'it': 'VIAGGI PREFERITI',
      'zh_Hans': '最喜欢的旅行',
    },
    'jw9advu1': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
      'zh_Hans': '家',
    },
  },
  // ItEdit
  {
    'pn2rnhjb': {
      'en': 'EDIT ITENIRARY',
      'ar': 'تعديل المسار',
      'de': 'REISEROUTE BEARBEITEN',
      'es': 'EDITAR ITENIRARIO',
      'fr': 'MODIFIER L\'ITINÉRAIRE',
      'it': 'MODIFICA ITINERARIO',
      'zh_Hans': '编辑行程',
    },
    '86cffytg': {
      'en': 'Country',
      'ar': 'دولة',
      'de': 'Land',
      'es': 'País',
      'fr': 'Pays',
      'it': 'Paese',
      'zh_Hans': '国家',
    },
    'ev2ntwmv': {
      'en': 'Enter country',
      'ar': 'أدخل البلد',
      'de': 'Land eingeben',
      'es': 'Introducir país',
      'fr': 'Entrez le pays',
      'it': 'Inserisci il paese',
      'zh_Hans': '输入国家',
    },
    '7bamicf6': {
      'en': 'City',
      'ar': 'مدينة',
      'de': 'Stadt',
      'es': 'Ciudad',
      'fr': 'Ville',
      'it': 'Città',
      'zh_Hans': '城市',
    },
    '04gaakrm': {
      'en': 'Enter city',
      'ar': 'أدخل المدينة',
      'de': 'Stadt eingeben',
      'es': 'Introducir ciudad',
      'fr': 'Entrez la ville',
      'it': 'Inserisci la città',
      'zh_Hans': '输入城市',
    },
    'j59xrnzu': {
      'en': 'Date',
      'ar': 'تاريخ',
      'de': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
      'it': 'Data',
      'zh_Hans': '日期',
    },
    's70733sg': {
      'en': 'Enter date',
      'ar': 'أدخل التاريخ',
      'de': 'Datum eingeben',
      'es': 'Introducir fecha',
      'fr': 'Entrez la date',
      'it': 'Inserisci la data',
      'zh_Hans': '输入日期',
    },
    'yeguxvug': {
      'en': 'Persons per group',
      'ar': 'الأشخاص لكل مجموعة',
      'de': 'Personen pro Gruppe',
      'es': 'Personas por grupo',
      'fr': 'Personnes par groupe',
      'it': 'Persone per gruppo',
      'zh_Hans': '每组人数',
    },
    '7ic0rxds': {
      'en': 'ADD',
      'ar': 'يضيف',
      'de': 'HINZUFÜGEN',
      'es': 'AGREGAR',
      'fr': 'AJOUTER',
      'it': 'AGGIUNGERE',
      'zh_Hans': '添加',
    },
    'jrurn1c9': {
      'en': 'Place',
      'ar': 'مكان',
      'de': 'Ort',
      'es': 'Lugar',
      'fr': 'Lieu',
      'it': 'Posto',
      'zh_Hans': '地方',
    },
    'q4mb5dox': {
      'en': 'Date',
      'ar': 'تاريخ',
      'de': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
      'it': 'Data',
      'zh_Hans': '日期',
    },
    'd9f1i1fg': {
      'en': 'Pyramids',
      'ar': 'الأهرامات',
      'de': 'Pyramiden',
      'es': 'Pirámides',
      'fr': 'Pyramides',
      'it': 'Piramidi',
      'zh_Hans': '金字塔',
    },
    'xeb8y8zv': {
      'en': '01/01/1999',
      'ar': '01/01/1999',
      'de': '01.01.1999',
      'es': '01/01/1999',
      'fr': '01/01/1999',
      'it': '01/01/1999',
      'zh_Hans': '1999 年 1 月 1 日',
    },
    'j4rx1zvt': {
      'en': 'Sphinx',
      'ar': 'أبو الهول',
      'de': 'Sphinx',
      'es': 'Esfinge',
      'fr': 'Sphinx',
      'it': 'Sfinge',
      'zh_Hans': '狮身人面像',
    },
    'aagdkj0a': {
      'en': '01/01/1999',
      'ar': '01/01/1999',
      'de': '01.01.1999',
      'es': '01/01/1999',
      'fr': '01/01/1999',
      'it': '01/01/1999',
      'zh_Hans': '1999 年 1 月 1 日',
    },
    'wdatw2cy': {
      'en': 'Karnak',
      'ar': 'الكرنك',
      'de': 'Karnak',
      'es': 'Karnak',
      'fr': 'Karnak',
      'it': 'Tempio di Karnak',
      'zh_Hans': '卡纳克神庙',
    },
    'zu2uf6lv': {
      'en': '01/01/1999',
      'ar': '01/01/1999',
      'de': '01.01.1999',
      'es': '01/01/1999',
      'fr': '01/01/1999',
      'it': '01/01/1999',
      'zh_Hans': '1999 年 1 月 1 日',
    },
    'ayur9jym': {
      'en': 'DONE',
      'ar': 'منتهي',
      'de': 'ERLEDIGT',
      'es': 'HECHO',
      'fr': 'FAIT',
      'it': 'FATTO',
      'zh_Hans': '完毕',
    },
  },
  // loading
  {
    '9jo5wx6x': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
      'zh_Hans': '家',
    },
  },
  // ItNew
  {
    '5hu3ms86': {
      'en': 'NEW ITENIRARY',
      'ar': 'مسار جديد',
      'de': 'NEUE REISEROUTE',
      'es': 'NUEVO ITINERARIO',
      'fr': 'NOUVEL ITINÉRAIRE',
      'it': 'NUOVO ITINERARIO',
      'zh_Hans': '新行程',
    },
    'vpuk0044': {
      'en': 'Country',
      'ar': 'دولة',
      'de': 'Land',
      'es': 'País',
      'fr': 'Pays',
      'it': 'Paese',
      'zh_Hans': '国家',
    },
    'pde7qu7l': {
      'en': 'Enter city',
      'ar': 'أدخل المدينة',
      'de': 'Stadt eingeben',
      'es': 'Introducir ciudad',
      'fr': 'Entrez la ville',
      'it': 'Inserisci la città',
      'zh_Hans': '输入城市',
    },
    '4d20j660': {
      'en': 'City',
      'ar': 'مدينة',
      'de': 'Stadt',
      'es': 'Ciudad',
      'fr': 'Ville',
      'it': 'Città',
      'zh_Hans': '城市',
    },
    'jalwqz7r': {
      'en': 'Enter city',
      'ar': 'أدخل المدينة',
      'de': 'Stadt eingeben',
      'es': 'Introducir ciudad',
      'fr': 'Entrez la ville',
      'it': 'Inserisci la città',
      'zh_Hans': '输入城市',
    },
    'w18y9ugx': {
      'en': 'Date',
      'ar': 'تاريخ',
      'de': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
      'it': 'Data',
      'zh_Hans': '日期',
    },
    'swhqqwiu': {
      'en': 'Enter date',
      'ar': 'أدخل التاريخ',
      'de': 'Datum eingeben',
      'es': 'Introducir fecha',
      'fr': 'Entrez la date',
      'it': 'Inserisci la data',
      'zh_Hans': '输入日期',
    },
    'd9stfx8l': {
      'en': 'Persons per group',
      'ar': 'الأشخاص لكل مجموعة',
      'de': 'Personen pro Gruppe',
      'es': 'Personas por grupo',
      'fr': 'Personnes par groupe',
      'it': 'Persone per gruppo',
      'zh_Hans': '每组人数',
    },
    'ym5gjf7a': {
      'en': 'ADD',
      'ar': 'يضيف',
      'de': 'HINZUFÜGEN',
      'es': 'AGREGAR',
      'fr': 'AJOUTER',
      'it': 'AGGIUNGERE',
      'zh_Hans': '添加',
    },
    'etvii1wb': {
      'en': 'Place',
      'ar': 'مكان',
      'de': 'Ort',
      'es': 'Lugar',
      'fr': 'Lieu',
      'it': 'Posto',
      'zh_Hans': '地方',
    },
    'l9l6794k': {
      'en': 'Date',
      'ar': 'تاريخ',
      'de': 'Datum',
      'es': 'Fecha',
      'fr': 'Date',
      'it': 'Data',
      'zh_Hans': '日期',
    },
    'mgqp6ft6': {
      'en': 'DONE',
      'ar': 'منتهي',
      'de': 'ERLEDIGT',
      'es': 'HECHO',
      'fr': 'FAIT',
      'it': 'FATTO',
      'zh_Hans': '完毕',
    },
  },
  // nearbyVisited
  {
    'autbyu58': {
      'en': 'NEARBY ATTRACTIONS VISITED',
      'ar': 'المعالم السياحية القريبة التي تمت زيارتها',
      'de': 'BESUCHTE ATTRAKTIONEN IN DER NÄHE',
      'es': 'ATRACCIONES CERCANAS VISITADAS',
      'fr': 'ATTRACTIONS À PROXIMITÉ VISITÉES',
      'it': 'ATTRAZIONI VICINE VISITATE',
      'zh_Hans': '参观过的附近的景点',
    },
    'm1ewwog2': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
      'zh_Hans': '家',
    },
  },
  // itView
  {
    'ae1lhxze': {
      'en': 'ITENIRARY VIEW',
      'ar': 'عرض مسار الرحلة',
      'de': 'REISEROUTE ANSICHT',
      'es': 'VISTA DEL ITENIRARIO',
      'fr': 'VUE DE L\'ITINERAIRE',
      'it': 'VISUALIZZAZIONE DELL\'ITINERARIO',
      'zh_Hans': '行程安排',
    },
    'rdorpllq': {
      'en': 'DONE',
      'ar': 'منتهي',
      'de': 'ERLEDIGT',
      'es': 'HECHO',
      'fr': 'FAIT',
      'it': 'FATTO',
      'zh_Hans': '完毕',
    },
  },
  // forgetPassword
  {
    'v5tz4v3m': {
      'en': 'FORGOT PASSWORD...',
      'ar': 'هل نسيت كلمة السر...',
      'de': 'PASSWORT VERGESSEN...',
      'es': 'HAS OLVIDADO TU CONTRASEÑA...',
      'fr': 'MOT DE PASSE OUBLIÉ...',
      'it': 'HA DIMENTICATO LA PASSWORD...',
      'zh_Hans': '忘记密码...',
    },
    '0a1ge4wh': {
      'en':
          'Enter your email address and we\'ll send you instructions to reset your password.',
      'ar':
          'أدخل عنوان بريدك الإلكتروني وسنرسل إليك تعليمات لإعادة تعيين كلمة المرور الخاصة بك.',
      'de':
          'Geben Sie Ihre E-Mail-Adresse ein und wir senden Ihnen Anweisungen zum Zurücksetzen Ihres Passworts.',
      'es':
          'Ingrese su dirección de correo electrónico y le enviaremos instrucciones para restablecer su contraseña.',
      'fr':
          'Saisissez votre adresse e-mail et nous vous enverrons des instructions pour réinitialiser votre mot de passe.',
      'it':
          'Inserisci il tuo indirizzo email e ti invieremo le istruzioni per reimpostare la password.',
      'zh_Hans': '输入您的电子邮件地址，我们将向您发送重置密码的说明。',
    },
    'j6ygrgas': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'de': 'E-Mail-Adresse',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
      'it': 'Indirizzo e-mail',
      'zh_Hans': '电子邮件',
    },
    'jnuemez6': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
      'de': 'Passwort zurücksetzen',
      'es': 'Restablecer contraseña',
      'fr': 'Réinitialiser le mot de passe',
      'it': 'Reimposta password',
      'zh_Hans': '重设密码',
    },
  },
  // chat_ai_Screen
  {
    'u5w2hpbh': {
      'en': 'AI Chatbot',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'm8is5qis': {
      'en': 'What is your dream Itenirary?',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    '3plsdwkk': {
      'en': 'Enter your prompt here',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'kkgqqy6o': {
      'en': 'Submit',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'd1a0aopg': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'it': 'Casa',
      'zh_Hans': '家',
    },
  },
  // cardSplit
  {
    '14vy8z3a': {
      'en': 'Edit Itinerary',
      'ar': 'تعديل مسار الرحلة',
      'de': 'Reiseroute bearbeiten',
      'es': 'Editar itinerario',
      'fr': 'Modifier l\'itinéraire',
      'it': 'Modifica itinerario',
      'zh_Hans': '编辑行程',
    },
  },
  // splitSquareCard
  {
    'bi6025iq': {
      'en': 'View',
      'ar': 'منظر',
      'de': 'Sicht',
      'es': 'Vista',
      'fr': 'Voir',
      'it': 'Visualizzazione',
      'zh_Hans': '看法',
    },
    '0l01t8zw': {
      'en': '[username] Favorited [Location]',
      'ar': '[اسم المستخدم] المفضلة [الموقع]',
      'de': '[Benutzername] Als Favorit markiert [Standort]',
      'es': '[nombre de usuario] Favoritos [Ubicación]',
      'fr': '[nom d\'utilisateur] Ajouté aux favoris [Emplacement]',
      'it': '[nome utente] Preferito [Posizione]',
      'zh_Hans': '[用户名] 已收藏 [位置]',
    },
    'nuue2tdy': {
      'en': 'Trips',
      'ar': 'الرحلات',
      'de': 'Reisen',
      'es': 'Viajes',
      'fr': 'Voyages',
      'it': 'Viaggi',
      'zh_Hans': '旅行',
    },
    'xelvd1ex': {
      'en': '3 hrs. ago',
      'ar': 'منذ 3 ساعات',
      'de': 'vor 3 Std.',
      'es': 'Hace 3 horas',
      'fr': 'Il y a 3 heures',
      'it': '3 ore fa',
      'zh_Hans': '3 小时前',
    },
  },
  // cardSplitSetCopy
  {
    'wv8295xi': {
      'en': '1. The Great Pyramid of Giza.\n',
      'ar': '1. الهرم الأكبر بالجيزة.',
      'de': '1. Die Große Pyramide von Gizeh.',
      'es': '1. La Gran Pirámide de Giza.',
      'fr': '1. La Grande Pyramide de Gizeh.',
      'it': '1. La Grande Piramide di Giza.',
      'zh_Hans': '1.吉萨大金字塔。',
    },
    'pgu46dsc': {
      'en':
          'The Great Pyramid of Giza, also known as the Pyramid of Khufu, is the oldest and largest of the three pyramids in the Giza Pyramid Complex. Built around 2600 BC, it was constructed during Egypt\'s Fourth Dynasty as a tomb for the Pharaoh Khufu. Originally standing at 146.6 meters, it was the tallest man-made structure in the world for over 3,800 years. The pyramid was built with approximately 2.3 million limestone blocks, each weighing up to 15 tons. Today, it stands at 138.5 meters due to the removal of its outer limestone casing, exposing the underlying core structure. As the last remaining wonder of the Seven Wonders of the Ancient World, it represents the pinnacle of ancient Egyptian engineering and has fascinated archaeologists, historians, and tourists for centuries.\n\n\n\n\n',
      'ar':
          'الهرم الأكبر بالجيزة، والمعروف أيضًا باسم هرم خوفو، هو أقدم وأكبر الأهرامات الثلاثة في مجمع أهرامات الجيزة. بُني حوالي عام 2600 قبل الميلاد، وتم بناؤه خلال الأسرة الرابعة في مصر كمقبرة للفرعون خوفو. يبلغ ارتفاعه في الأصل 146.6 مترًا، وكان أطول هيكل من صنع الإنسان في العالم لأكثر من 3800 عام. تم بناء الهرم بحوالي 2.3 مليون كتلة من الحجر الجيري، يصل وزن كل منها إلى 15 طنًا. يبلغ ارتفاعه اليوم 138.5 مترًا بسبب إزالة غلافه الخارجي من الحجر الجيري، مما أدى إلى كشف الهيكل الأساسي الأساسي. وباعتباره آخر عجائب الدنيا السبع المتبقية في العالم القديم، فإنه يمثل قمة الهندسة المصرية القديمة وقد أذهل علماء الآثار والمؤرخين والسياح لقرون.',
      'de':
          'Die Große Pyramide von Gizeh, auch Cheops-Pyramide genannt, ist die älteste und größte der drei Pyramiden des Pyramidenkomplexes von Gizeh. Sie wurde um 2600 v. Chr. während der vierten Dynastie Ägyptens als Grabstätte für Pharao Cheops errichtet. Mit einer ursprünglichen Höhe von 146,6 Metern war sie über 3.800 Jahre lang das höchste von Menschenhand geschaffene Bauwerk der Welt. Die Pyramide wurde aus etwa 2,3 Millionen Kalksteinblöcken gebaut, von denen jeder bis zu 15 Tonnen wog. Heute ist sie 138,5 Meter hoch, da die äußere Kalksteinhülle entfernt wurde und die darunterliegende Kernstruktur freigelegt wurde. Als letztes verbliebenes Wunder der Sieben Weltwunder der Antike stellt sie den Höhepunkt der altägyptischen Ingenieurskunst dar und fasziniert Archäologen, Historiker und Touristen seit Jahrhunderten.',
      'es':
          'La Gran Pirámide de Giza, también conocida como la Pirámide de Keops, es la más grande y antigua de las tres pirámides del complejo de las pirámides de Giza. Construida alrededor del año 2600 a. C., fue construida durante la Cuarta Dinastía de Egipto como tumba del faraón Keops. Originalmente, medía 146,6 metros y fue la estructura más alta construida por el hombre en el mundo durante más de 3800 años. La pirámide se construyó con aproximadamente 2,3 millones de bloques de piedra caliza, cada uno de los cuales pesa hasta 15 toneladas. Hoy, se encuentra a 138,5 metros debido a la eliminación de su revestimiento exterior de piedra caliza, lo que expuso la estructura central subyacente. Como la última maravilla restante de las Siete Maravillas del Mundo Antiguo, representa el pináculo de la ingeniería del antiguo Egipto y ha fascinado a arqueólogos, historiadores y turistas durante siglos.',
      'fr':
          'La grande pyramide de Gizeh, également connue sous le nom de pyramide de Khéops, est la plus ancienne et la plus grande des trois pyramides du complexe pyramidal de Gizeh. Construite vers 2600 av. J.-C., elle a été érigée pendant la quatrième dynastie égyptienne comme tombeau du pharaon Khéops. D\'une hauteur initiale de 146,6 mètres, elle a été la plus haute structure artificielle du monde pendant plus de 3 800 ans. La pyramide a été construite avec environ 2,3 millions de blocs de calcaire, pesant chacun jusqu\'à 15 tonnes. Aujourd\'hui, elle s\'élève à 138,5 mètres en raison du retrait de son enveloppe extérieure en calcaire, exposant la structure centrale sous-jacente. En tant que dernière merveille restante des sept merveilles du monde antique, elle représente le summum de l\'ingénierie égyptienne antique et fascine les archéologues, les historiens et les touristes depuis des siècles.',
      'it':
          'La Grande Piramide di Giza, nota anche come Piramide di Cheope, è la più antica e grande delle tre piramidi del Complesso Piramidale di Giza. Costruita intorno al 2600 a.C., fu edificata durante la Quarta Dinastia egizia come tomba per il faraone Cheope. Originariamente alta 146,6 metri, è stata la struttura artificiale più alta del mondo per oltre 3.800 anni. La piramide fu costruita con circa 2,3 milioni di blocchi di calcare, ciascuno del peso di 15 tonnellate. Oggi è alta 138,5 metri a causa della rimozione del suo rivestimento esterno in calcare, che ha esposto la struttura centrale sottostante. Come ultima meraviglia rimasta delle Sette Meraviglie del Mondo Antico, rappresenta l\'apice dell\'antica ingegneria egizia e ha affascinato archeologi, storici e turisti per secoli.',
      'zh_Hans':
          '吉萨大金字塔，也被称为胡夫金字塔，是吉萨金字塔群三座金字塔中最古老、最大的一座。它建于公元前 2600 年左右，是埃及第四王朝法老胡夫的陵墓。它最初高 146.6 米，在 3800 多年的时间里一直是世界上最高的人造建筑。这座金字塔用大约 230 万块石灰石建造而成，每块重达 15 吨。如今，由于外层的石灰石外壳被拆除，露出了下面的核心结构，它高 138.5 米。作为古代世界七大奇迹中最后一个幸存的奇迹，它代表了古埃及工程技术的巅峰，几个世纪以来一直让考古学家、历史学家和游客着迷。',
    },
    'gaw3yjac': {
      'en': 'Find On Google Maps',
      'ar': 'البحث على خرائط جوجل',
      'de': 'Auf Google Maps finden',
      'es': 'Encontrar en Google Maps',
      'fr': 'Trouver sur Google Maps',
      'it': 'Trova su Google Maps',
      'zh_Hans': '在 Google 地图上查找',
    },
  },
  // splitSquareCardCopy
  {
    'k5kbuwxu': {
      'en': 'View',
      'ar': 'منظر',
      'de': 'Sicht',
      'es': 'Vista',
      'fr': 'Voir',
      'it': 'Visualizzazione',
      'zh_Hans': '看法',
    },
    '9ivv59o1': {
      'en': '[username] Visited [Location]',
      'ar': '[اسم المستخدم] زار [الموقع]',
      'de': '[Benutzername] hat [Standort] besucht',
      'es': '[nombre de usuario] visitó [ubicación]',
      'fr': '[nom d\'utilisateur] a visité [emplacement]',
      'it': '[nome utente] Ha visitato [luogo]',
      'zh_Hans': '[用户名] 访问过 [地点]',
    },
    '6oidkr9h': {
      'en': 'Trips',
      'ar': 'الرحلات',
      'de': 'Reisen',
      'es': 'Viajes',
      'fr': 'Voyages',
      'it': 'Viaggi',
      'zh_Hans': '旅行',
    },
    'wn3ksf0g': {
      'en': '3 hrs. ago',
      'ar': 'منذ 3 ساعات',
      'de': 'vor 3 Std.',
      'es': 'Hace 3 horas',
      'fr': 'Il y a 3 heures',
      'it': '3 ore fa',
      'zh_Hans': '3 小时前',
    },
  },
  // button
  {
    '5bdua88d': {
      'en': 'VIEW ALL',
      'ar': 'عرض الكل',
      'de': 'ALLE ANZEIGEN',
      'es': 'VER TODO',
      'fr': 'VOIR TOUT',
      'it': 'VISUALIZZA TUTTO',
      'zh_Hans': '查看全部',
    },
  },
  // selectLanguage
  {
    'ljcaq5f2': {
      'en': 'NEARBY',
      'ar': 'قريب',
      'de': 'NAHE',
      'es': 'CERCANO',
      'fr': 'PROCHE',
      'it': 'NELLE VICINANZE',
      'zh_Hans': '附近',
    },
  },
  // selectLangaugeTab
  {
    'i4ukggnj': {
      'en': 'Select Language',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'phpjov1v': {
      'en': 'English',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'b88bxdh0': {
      'en': 'Spanish',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'n2tv9j59': {
      'en': 'Arabic',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    '3hsxs0tz': {
      'en': 'French',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'l6rxzu5c': {
      'en': 'Chinese',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'r5ihxtk2': {
      'en': 'Italian',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'khj4sigl': {
      'en':
          'Your selected language will be used throughout the app. You can change this at any time in settings.',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
  },
  // user_ListSmall
  {
    '11fmtnqb': {
      'en': 'ME',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
  },
  // deleteDialog
  {
    '5j974o3q': {
      'en': 'Options',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'yzzbn3uj': {
      'en': 'Invite Users',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'smq04mzj': {
      'en': 'Delete Chat',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'ipqmf4j8': {
      'en': 'Confirm Delete',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    '8mfrsf4q': {
      'en': 'You can\'t undo this action.',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'jenvnwkc': {
      'en': 'Delete',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    '8s7ssixa': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    '6ekv0sd9': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'xhgy9sz5': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    '259s8a75': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    '99r8m4b1': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'v81cw323': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'lix8mr9x': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'sq4mfeh0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    '4q2fdvky': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'b7ogy15k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    '6j3vusv5': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'inasbqk4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'bluwvc9u': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'o3zzg1la': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'k0m2odri': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'evblndk0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'hgseg88e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'do7z8h6h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'jfqi2y9f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'p1zc4or4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    '1oh69amr': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    '6g5m8p13': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'pughgg1i': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    '0v9yl00u': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
    'gsvn4sxw': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'fr': '',
      'it': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
