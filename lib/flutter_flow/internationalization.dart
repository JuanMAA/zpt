import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en', 'de', 'ar'];

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
    String? esText = '',
    String? enText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [esText, enText, deText, arText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // paginaHome
  {
    '2bb3vct7': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // paginaRegistro
  {
    'momge5oj': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // paginaTutorial
  {
    'oo0kk9qe': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // paginaPrincipal
  {
    'ofz2zvlc': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // paginaMiPerfil
  {
    '8srr2k0j': {
      'es': 'Perfil',
      'ar': '',
      'de': '',
      'en': 'Perfil',
    },
  },
  // paginaDetallePago
  {
    '6g6obt3a': {
      'es': 'Detalle de Pago',
      'ar': '',
      'de': '',
      'en': 'Detalle de Pago',
    },
    'imaejg7x': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // paginaEditarPerfil
  {
    '4rzqov3y': {
      'es': 'Editar Perfil',
      'ar': '',
      'de': '',
      'en': 'Editar Perfil',
    },
    '59naq8ur': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // paginaRestablecer
  {
    'l5iggwaz': {
      'es': 'Cambiar contraseña',
      'ar': '',
      'de': '',
      'en': 'Cambiar contraseña',
    },
    'hithegan': {
      'es':
          'Ingresa el correo electrónico asociado a tu cuenta y te enviaremos un enlace para restablecer tu contraseña.',
      'ar': '',
      'de': '',
      'en':
          'Ingresa el correo electrónico asociado a tu cuenta y te enviaremos un enlace para restablecer tu contraseña.',
    },
    'abltlha1': {
      'es': 'Email',
      'ar': '',
      'de': '',
      'en': 'Email',
    },
    'yda13ts0': {
      'es': 'Ingresa tu email',
      'ar': '',
      'de': '',
      'en': 'Ingresa tu email',
    },
    'nfbgvad0': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    '8jmmau8k': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'ar': '',
      'de': '',
      'en': 'Introduzca una dirección de correo electrónico válida',
    },
    'us9izhyt': {
      'es': 'Seleccione una opcion',
      'ar': '',
      'de': '',
      'en': 'Seleccione una opcion',
    },
    '34m5g7xs': {
      'es': 'Enviar enlace de restablecimiento',
      'ar': '',
      'de': '',
      'en': 'Enviar enlace de restablecimiento',
    },
    '5tvk9lv0': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // PaginaNotificationes
  {
    'sc4ff4ce': {
      'es': 'Configurar notificaciones',
      'ar': '',
      'de': '',
      'en': 'Configurar notificaciones',
    },
    'r72zvrv5': {
      'es':
          'Seleccione las notificaciones que desea recibir a continuación y actualizaremos la configuración. ',
      'ar': '',
      'de': '',
      'en':
          'Seleccione las notificaciones que desea recibir a continuación y actualizaremos la configuración. ',
    },
    'gjygkr0n': {
      'es': 'Notificaciones push',
      'ar': '',
      'de': '',
      'en': 'Notificaciones push',
    },
    '3y3yhxbk': {
      'es':
          'Recibir notificaciones push de nuestra aplicación de forma periódica.',
      'ar': '',
      'de': '',
      'en':
          'Recibir notificaciones push de nuestra aplicación de forma periódica.',
    },
    '1ytebj35': {
      'es': 'Notificaciones email ',
      'ar': '',
      'de': '',
      'en': 'Notificaciones email ',
    },
    '9lvh5nst': {
      'es':
          'Recibir notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
      'ar': '',
      'de': '',
      'en':
          'Recibir notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
    },
    'isgrgbfs': {
      'es': 'Guardar Cambios',
      'ar': '',
      'de': '',
      'en': 'Guardar Cambios',
    },
    'a96mlyeh': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // paginaFAQs
  {
    'alczfiiy': {
      'es': 'Política de Privacidad ',
      'ar': '',
      'de': '',
      'en': 'Política de Privacidad ',
    },
    'oks4x95o': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // paginaAgregarCuenta
  {
    'kh58vfmh': {
      'es': 'Nueva Cuenta',
      'ar': '',
      'de': '',
      'en': 'Nueva Cuenta',
    },
    'c805m53i': {
      'es': 'Agregar',
      'ar': '',
      'de': '',
      'en': 'Agregar',
    },
  },
  // paginaTargetas
  {
    'jsbctd7o': {
      'es': 'Mis Targetas',
      'ar': '',
      'de': '',
      'en': 'Mis Targetas',
    },
    'h421y5mi': {
      'es': 'Targetas',
      'ar': '',
      'de': '',
      'en': 'Targetas',
    },
  },
  // paginaCuenta
  {
    'xru8vjsa': {
      'es': 'Agregar',
      'ar': '',
      'de': '',
      'en': 'Agregar',
    },
    '6qawx1fi': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // newAccount
  {
    '4yxxienz': {
      'es': 'Seleccionar una cuenta',
      'ar': '',
      'de': '',
      'en': 'Seleccionar una cuenta',
    },
    'y09r2w55': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // paginaDestinatario
  {
    '2xxyt28g': {
      'es': 'Datos Bancarios Destinatario',
      'ar': '',
      'de': '',
      'en': 'Datos Bancarios Destinatario',
    },
    '62ap97mr': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // paginaTransacciones
  {
    'snhexwkk': {
      'es': 'Mis Transacciones',
      'ar': '',
      'de': '',
      'en': 'Mis Transacciones',
    },
    '1ivxf568': {
      'es': 'Historial',
      'ar': '',
      'de': '',
      'en': 'Historial',
    },
  },
  // paginaEditarCuenta
  {
    '09oj5xdt': {
      'es': 'Administrar cuenta',
      'ar': '',
      'de': '',
      'en': 'Administrar cuenta',
    },
    '02skes9q': {
      'es': 'Administrar cuenta',
      'ar': '',
      'de': '',
      'en': 'Administrar cuenta',
    },
    'nm3dlu28': {
      'es': 'Compartir',
      'ar': '',
      'de': '',
      'en': 'Compartir',
    },
    'cecuexjh': {
      'es': 'Click para modificar datos de cuenta',
      'ar': '',
      'de': '',
      'en': 'Click para modificar datos de cuenta',
    },
    '36i7wg4l': {
      'es': 'Compartir',
      'ar': '',
      'de': '',
      'en': 'Compartir',
    },
    'rd5mdona': {
      'es': 'Click para modificar detalles del pago',
      'ar': '',
      'de': '',
      'en': 'Click para modificar detalles del pago',
    },
    'c3y5zfwn': {
      'es': 'Eliminar Cuenta',
      'ar': '',
      'de': '',
      'en': 'Eliminar Cuenta',
    },
    'qvyl6015': {
      'es': 'Home',
      'ar': '',
      'de': '',
      'en': 'Home',
    },
  },
  // componenteMenu
  {
    'ar1prl5e': {
      'es': 'Principal',
      'ar': '',
      'de': '',
      'en': 'Principal',
    },
    'q38my9g6': {
      'es': 'Inicio',
      'ar': '',
      'de': '',
      'en': 'Inicio',
    },
    'g8rx00ry': {
      'es': 'Agregar',
      'ar': '',
      'de': '',
      'en': 'Agregar',
    },
    'tsav548i': {
      'es': 'Historial',
      'ar': '',
      'de': '',
      'en': 'Historial',
    },
    '6sdfv6yx': {
      'es': 'Métodos de Pago',
      'ar': '',
      'de': '',
      'en': 'Métodos de Pago',
    },
    'y4xnncnr': {
      'es': 'Tu Cuenta',
      'ar': '',
      'de': '',
      'en': 'Tu Cuenta',
    },
    '236tgx6u': {
      'es': 'Ajustes',
      'ar': '',
      'de': '',
      'en': 'Ajustes',
    },
    'npe64ggo': {
      'es': 'Cerrar Sesión',
      'ar': '',
      'de': '',
      'en': 'Cerrar Sesión',
    },
  },
  // newAccountComponent
  {
    '20fd5baa': {
      'es': '¿Listo para saldar cuentas? ¿Cuál eliges primero?',
      'ar': '',
      'de': '',
      'en': '¿Listo para saldar cuentas? ¿Cuál eliges primero?',
    },
    '0vflie9s': {
      'es': '¿Qué cuenta quieres pagar?',
      'ar': '',
      'de': '',
      'en': '¿Qué cuenta quieres pagar?',
    },
    'pylya0zb': {
      'es': 'Ingresa aquí el tipo de cuenta, o nombre de la empresa',
      'ar': '',
      'de': '',
      'en': 'Ingresa aquí el tipo de cuenta, o nombre de la empresa',
    },
    '7uxhs99s': {
      'es': 'Opcion 1',
      'ar': '',
      'de': '',
      'en': 'Opcion 1',
    },
  },
  // componenteLogin
  {
    'bywopltk': {
      'es': 'Para Comenzar',
      'ar': '',
      'de': '',
      'en': 'Para Comenzar',
    },
    'wwryhvil': {
      'es': 'Crea tu cuenta a continuación',
      'ar': '',
      'de': '',
      'en': 'Crea tu cuenta a continuación',
    },
    '5nfkjdb7': {
      'es': 'Email ',
      'ar': '',
      'de': '',
      'en': 'Email ',
    },
    'lyqyfhl7': {
      'es': 'Ingresa tu email',
      'ar': '',
      'de': '',
      'en': 'Ingresa tu email',
    },
    'rxhxitqt': {
      'es': 'Primer nombre',
      'ar': '',
      'de': '',
      'en': 'Primer nombre',
    },
    'layn4cui': {
      'es': 'Ingresa tu primer nombre',
      'ar': '',
      'de': '',
      'en': 'Ingresa tu primer nombre',
    },
    'kszu8ttq': {
      'es': 'Segundo nombre',
      'ar': '',
      'de': '',
      'en': 'Segundo nombre',
    },
    '20gocco9': {
      'es': 'Ingresa tu segundo nombre',
      'ar': '',
      'de': '',
      'en': 'Ingresa tu segundo nombre',
    },
    'm616i0s4': {
      'es': 'RUT',
      'ar': '',
      'de': '',
      'en': 'RUT',
    },
    't4stvknv': {
      'es': 'Ingresa tu RUT',
      'ar': '',
      'de': '',
      'en': 'Ingresa tu RUT',
    },
    'lwcb0tqi': {
      'es': 'Contraseña',
      'ar': '',
      'de': '',
      'en': 'Contraseña',
    },
    'iqfccz4q': {
      'es': 'Ingresa tu contraseña',
      'ar': '',
      'de': '',
      'en': 'Ingresa tu contraseña',
    },
    'fd63p9br': {
      'es': 'Confirmar contraseña',
      'ar': '',
      'de': '',
      'en': 'Confirmar contraseña',
    },
    'hl67vl5a': {
      'es': 'Ingresa nuevamente tu contraseña',
      'ar': '',
      'de': '',
      'en': 'Ingresa nuevamente tu contraseña',
    },
    '0xmb18gs': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'yyn7jb5j': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'ar': '',
      'de': '',
      'en': 'Introduzca una dirección de correo electrónico válida',
    },
    'frzpcsq1': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'bush02dk': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'oe5x88ug': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'jspunpnk': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'w5odysg0': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'pow36zki': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'ughsh6e1': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '0zabdl74': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'hpm0epix': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'rqvwcrly': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'fvdravf7': {
      'es': 'Crear cuenta',
      'ar': '',
      'de': '',
      'en': 'Crear cuenta',
    },
    'qnwsy7ky': {
      'es': 'Registrarse con Google',
      'ar': '',
      'de': '',
      'en': 'Registrarse con Google',
    },
    'm7vlx2xw': {
      'es': '¿Ya tienes una cuenta?',
      'ar': '',
      'de': '',
      'en': '¿Ya tienes una cuenta?',
    },
    'dgx07x2s': {
      'es': 'Iniciar sesión',
      'ar': '',
      'de': '',
      'en': 'Iniciar sesión',
    },
  },
  // componenteTutorial
  {
    '4gwjtiby': {
      'es': 'Tutorial 1',
      'ar': '',
      'de': '',
      'en': 'Tutorial 1',
    },
    '4zrtccdl': {
      'es':
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
      'ar': '',
      'de': '',
      'en':
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
    },
    'wvifjzo0': {
      'es': 'Tutorial 2',
      'ar': '',
      'de': '',
      'en': 'Tutorial 2',
    },
    'y3wjuudj': {
      'es':
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
      'ar': '',
      'de': '',
      'en':
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
    },
    'sgfh3am7': {
      'es': 'Tutorial 3',
      'ar': '',
      'de': '',
      'en': 'Tutorial 3',
    },
    '872xxjme': {
      'es':
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
      'ar': '',
      'de': '',
      'en':
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.',
    },
    'a8kfn3cc': {
      'es': 'Comenzar',
      'ar': '',
      'de': '',
      'en': 'Comenzar',
    },
  },
  // componenteRegistro
  {
    'fchumcpy': {
      'es': 'Bienvenido',
      'ar': '',
      'de': '',
      'en': 'Bienvenido!',
    },
    'msqo3krk': {
      'es': 'Inicie sesión para acceder a su cuenta a continuación.',
      'ar': '',
      'de': '',
      'en': 'Inicie sesión para acceder a su cuenta a continuación.',
    },
    'qurwj3og': {
      'es': 'Email',
      'ar': '',
      'de': '',
      'en': 'Email',
    },
    'vplzr91x': {
      'es': 'Ingresa tu email',
      'ar': '',
      'de': '',
      'en': 'Ingresa tu email',
    },
    'czch8pij': {
      'es': 'Contraseña',
      'ar': '',
      'de': '',
      'en': 'Contraseña',
    },
    '7vmeqab8': {
      'es': 'Ingresa tu contraseña',
      'ar': '',
      'de': '',
      'en': 'Ingresa tu contraseña',
    },
    'kpyiyug7': {
      'es': 'Iniciar Sesíon',
      'ar': '',
      'de': '',
      'en': 'Iniciar Sesíon',
    },
    'dmdfj3gc': {
      'es': 'Iniciar Sesíon con Google',
      'ar': '',
      'de': '',
      'en': 'Iniciar Sesíon con Google',
    },
    '1wpnhj25': {
      'es': 'Olvido su contraseña?',
      'ar': '',
      'de': '',
      'en': 'Olvido su contraseña?',
    },
    '0jpjmen0': {
      'es': 'No tiienes una cuenta?',
      'ar': '',
      'de': '',
      'en': 'No tiienes una cuenta?',
    },
    '9sc5jqdj': {
      'es': 'Crear cuenta',
      'ar': '',
      'de': '',
      'en': 'Crear',
    },
    'deifasn4': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    '97re45i0': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'ar': '',
      'de': '',
      'en': 'Introduzca una dirección de correo electrónico válida',
    },
    'fpvi8im4': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'kx4bjlep': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'lnoir7h0': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
  },
  // componenteHome
  {
    'vfyqjx4f': {
      'es': 'Bienvenido,',
      'ar': '',
      'de': '',
      'en': 'Bienvenido,',
    },
    '8480rtdf': {
      'es': 'Tus actualizaciones más recientes.',
      'ar': '',
      'de': '',
      'en': 'Tus actualizaciones más recientes.',
    },
    'lq1z3iql': {
      'es': 'Cuentas que Transfiero',
      'ar': '',
      'de': '',
      'en': 'Cuentas que Transfiero',
    },
    '9tuqiqo6': {
      'es': 'Servicios que pago',
      'ar': '',
      'de': '',
      'en': 'Servicios que pago',
    },
    '4bhdvzga': {
      'es': 'Seleccionar todas las cuentas',
      'ar': '',
      'de': '',
      'en': 'Seleccionar todas las cuentas',
    },
    'arv5o1f6': {
      'es': 'Ver Más',
      'ar': '',
      'de': '',
      'en': 'Ver Más',
    },
    'x3gdd5uj': {
      'es': 'Pagar',
      'ar': '',
      'de': '',
      'en': 'Pagar',
    },
    '1au3u7xo': {
      'es': 'Advertising Budget',
      'ar': '',
      'de': '',
      'en': '',
    },
    '97fh280n': {
      'es': '\$3,000',
      'ar': '',
      'de': '',
      'en': '',
    },
    'xei28wjo': {
      'es': '4 Days Left',
      'ar': '',
      'de': '',
      'en': '',
    },
    '1mvxo4ra': {
      'es': 'Total Spent',
      'ar': '',
      'de': '',
      'en': '',
    },
    '4j4izofs': {
      'es': '\$2,502',
      'ar': '',
      'de': '',
      'en': '',
    },
    'a20cg1ag': {
      'es': 'Advertising Budget',
      'ar': '',
      'de': '',
      'en': '',
    },
    'qsd0q2q9': {
      'es': '\$3,000',
      'ar': '',
      'de': '',
      'en': '',
    },
    '3mmt67ao': {
      'es': '4 Days Left',
      'ar': '',
      'de': '',
      'en': '',
    },
    'jtp3pmbh': {
      'es': 'Total Spent',
      'ar': '',
      'de': '',
      'en': '',
    },
    'ycmn8ua4': {
      'es': '\$2,502',
      'ar': '',
      'de': '',
      'en': '',
    },
    '9s50t61n': {
      'es': 'Ver Mas',
      'ar': '',
      'de': '',
      'en': 'Ver Mas',
    },
    '7jqjpuxh': {
      'es': 'Actualizar',
      'ar': '',
      'de': '',
      'en': 'Actualizar',
    },
    'dkkq3ocw': {
      'es': 'Sin deuda',
      'ar': '',
      'de': '',
      'en': 'Sin deuda',
    },
    'tx5qy83m': {
      'es': 'Seleccionar para pagar',
      'ar': '',
      'de': '',
      'en': 'Seleccionar para pagar',
    },
  },
  // componenteDestinatario
  {
    '4ndkun6a': {
      'es': '¿Cuáles son los datos bancarios del destinatario?',
      'ar': '',
      'de': '',
      'en': '¿Cuáles son los datos bancarios del destinatario?',
    },
    's789fo0f': {
      'es': 'RUT Destinatario',
      'ar': '',
      'de': '',
      'en': 'RUT Destinatario',
    },
    'ljboi5nr': {
      'es': 'Ej: 9.999.999-9',
      'ar': '',
      'de': '',
      'en': 'Ej: 9.999.999-9',
    },
    'og89hzvy': {
      'es': 'Nombre',
      'ar': '',
      'de': '',
      'en': 'Nombre',
    },
    'euxg5eno': {
      'es': 'Ej: Juan Mansilla',
      'ar': '',
      'de': '',
      'en': 'Ej: Juan Mansilla',
    },
    '8kbk6jpj': {
      'es': 'Seleccione un banco',
      'ar': '',
      'de': '',
      'en': 'Seleccione un banco',
    },
    'm8p6l8pr': {
      'es': 'Buscar un banco',
      'ar': '',
      'de': '',
      'en': 'Buscar un banco',
    },
    'bjv6b07y': {
      'es': 'Cuenta Corriente',
      'ar': '',
      'de': '',
      'en': 'Cuenta Corriente',
    },
    '04n6ol8m': {
      'es': 'Cuenta Corriente',
      'ar': '',
      'de': '',
      'en': 'Cuenta Corriente',
    },
    'dl3g2jjn': {
      'es': 'Cuenta Vista',
      'ar': '',
      'de': '',
      'en': 'Cuenta Vista',
    },
    '641uypkf': {
      'es': 'Número de Cuenta',
      'ar': '',
      'de': '',
      'en': 'Número de Cuenta',
    },
    'igwfl4vy': {
      'es': 'Ej: 099999999',
      'ar': '',
      'de': '',
      'en': 'Ej: 099999999',
    },
    'a9qm1ujr': {
      'es': 'Email',
      'ar': '',
      'de': '',
      'en': 'Email',
    },
    'hmjea2s1': {
      'es': 'Ej: juan@zippypay.com',
      'ar': '',
      'de': '',
      'en': 'Ej: juan@zippypay.com',
    },
    '8b064d7v': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'fwqdp0qr': {
      'es': 'Rut invalido',
      'ar': '',
      'de': '',
      'en': 'Rut invalido',
    },
    '4sbmkfo6': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    '7qswbt5f': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'd0d715xz': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'd4y09a5n': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'rwphdgj6': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'ef5d6svt': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'ab2afnki': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'ar': '',
      'de': '',
      'en': 'Introduzca una dirección de correo electrónico válida',
    },
    '3mzyz1v0': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'e3y6o7dr': {
      'es': 'Continuar',
      'ar': '',
      'de': '',
      'en': 'Continuar',
    },
  },
  // componentePerfil
  {
    'xrwhwkon': {
      'es': 'Configuraciones',
      'ar': '',
      'de': '',
      'en': 'Configuraciones',
    },
    'm77vcu28': {
      'es': 'Editar Perfil',
      'ar': '',
      'de': '',
      'en': 'Editar Perfil',
    },
    '16rcxlq0': {
      'es': 'Cambiar Contraseña',
      'ar': '',
      'de': '',
      'en': 'Cambiar Contraseña',
    },
    'i6lxbjlm': {
      'es': 'Mis Tarjetas',
      'ar': '',
      'de': '',
      'en': 'Mis Tarjetas',
    },
    'wm89hdgq': {
      'es': 'Mis Transacciones',
      'ar': '',
      'de': '',
      'en': 'Mis Transacciones',
    },
    'ml9tkqd3': {
      'es': 'Configuración de notificaciones',
      'ar': '',
      'de': '',
      'en': 'Configuración de notificaciones',
    },
    'h7rz8hh7': {
      'es': 'Tutorial',
      'ar': '',
      'de': '',
      'en': 'Tutorial',
    },
    'q1auewo2': {
      'es': 'Política de privacidad',
      'ar': '',
      'de': '',
      'en': 'Política de privacidad',
    },
    'cumbx0gj': {
      'es': 'Modo Oscuro',
      'ar': '',
      'de': '',
      'en': 'Modo Oscuro',
    },
    '2rcpvfwc': {
      'es': 'Modo Normal',
      'ar': '',
      'de': '',
      'en': 'Modo Normal',
    },
  },
  // componentePago
  {
    'sobj1s3z': {
      'es': 'Detalles del pago y destinatario',
      'ar': '',
      'de': '',
      'en': 'Detalles del pago y destinatario',
    },
    'gaj4tsyd': {
      'es': 'Selecciona una cuenta',
      'ar': '',
      'de': '',
      'en': 'Selecciona una cuenta',
    },
    '53cqt3ce': {
      'es': 'CLP',
      'ar': '',
      'de': '',
      'en': 'CLP',
    },
    'guq0qsxj': {
      'es': 'CLP',
      'ar': '',
      'de': '',
      'en': 'CLP',
    },
    'illc8mw9': {
      'es': 'UF',
      'ar': '',
      'de': '',
      'en': 'UF',
    },
    'e3cqmr5k': {
      'es': 'Tipo de Moneda',
      'ar': '',
      'de': '',
      'en': 'Tipo de Moneda',
    },
    '8hybnvxf': {
      'es': 'Monto a pagar',
      'ar': '',
      'de': '',
      'en': 'Monto a pagar',
    },
    'vumkk8b8': {
      'es': 'Ej: 200000',
      'ar': '',
      'de': '',
      'en': 'Ej: 200000',
    },
    '8jedhw5d': {
      'es': '2023',
      'ar': '',
      'de': '',
      'en': '2023',
    },
    'xlwtzwdr': {
      'es': '2024',
      'ar': '',
      'de': '',
      'en': '2024',
    },
    'h6uad5by': {
      'es': '2025',
      'ar': '',
      'de': '',
      'en': '2025',
    },
    'gymiitia': {
      'es': '2026',
      'ar': '',
      'de': '',
      'en': '2026',
    },
    'eibuflb9': {
      'es': 'Seleccionar Año',
      'ar': '',
      'de': '',
      'en': 'Seleccionar Año',
    },
    'ap5epi6t': {
      'es': 'Buscar Año',
      'ar': '',
      'de': '',
      'en': 'Buscar Año',
    },
    '7sbgkwr8': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '8uhs48l9': {
      'es': 'Enero',
      'ar': '',
      'de': '',
      'en': 'Enero',
    },
    '0le40g9z': {
      'es': 'Febrero',
      'ar': '',
      'de': '',
      'en': 'Febrero',
    },
    '6alr0y4m': {
      'es': 'Marzo',
      'ar': '',
      'de': '',
      'en': 'Marzo',
    },
    'miypsi7z': {
      'es': 'Abril',
      'ar': '',
      'de': '',
      'en': 'Abril',
    },
    'l11ctk13': {
      'es': 'Mayo',
      'ar': '',
      'de': '',
      'en': 'Mayo',
    },
    '7d1ftgqe': {
      'es': 'Junio',
      'ar': '',
      'de': '',
      'en': 'Junio',
    },
    'mxvhujau': {
      'es': 'Julio',
      'ar': '',
      'de': '',
      'en': 'Julio',
    },
    'yrq32gl1': {
      'es': 'Agosto',
      'ar': '',
      'de': '',
      'en': 'Agosto',
    },
    'yiu4ml2v': {
      'es': 'Septiembre',
      'ar': '',
      'de': '',
      'en': 'Septiembre',
    },
    '5a9mgyac': {
      'es': 'Octubre',
      'ar': '',
      'de': '',
      'en': 'Octubre',
    },
    'qpwis29s': {
      'es': 'Noviembre',
      'ar': '',
      'de': '',
      'en': 'Noviembre',
    },
    '3herpr7b': {
      'es': 'Diciembre',
      'ar': '',
      'de': '',
      'en': 'Diciembre',
    },
    'b1c5uqv0': {
      'es': 'Buscar Mes',
      'ar': '',
      'de': '',
      'en': 'Buscar Mes',
    },
    'eaennovt': {
      'es': 'Agregar un comentario',
      'ar': '',
      'de': '',
      'en': 'Agregar un comentario',
    },
    '8p1gdbh4': {
      'es': 'Ejemplo: residencia de mayores - Septiembre 2023',
      'ar': '',
      'de': '',
      'en': 'Ejemplo: residencia de mayores - Septiembre 2023',
    },
    '4sjf00xh': {
      'es': 'Avisar al destinatario ',
      'ar': '',
      'de': '',
      'en': 'Avisar al destinatario ',
    },
    'rbth2l35': {
      'es': 'Cuando el pago esté en proceso',
      'ar': '',
      'de': '',
      'en': 'Cuando el pago esté en proceso',
    },
    'lo9cshdc': {
      'es': 'Pagar',
      'ar': '',
      'de': '',
      'en': 'Pagar',
    },
    'c523py1d': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'k1vh2f5b': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'mwkxbsil': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'f646ebt4': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
  },
  // dynamicComponent
  {
    '0slcaof7': {
      'es': 'Rellena el siguiente formulario con los datos requeridos ',
      'ar': '',
      'de': '',
      'en': 'Rellena el siguiente formulario con los datos requeridos',
    },
    'dpevv92w': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '73pjqr4l': {
      'es': 'Actualizar Datos',
      'ar': '',
      'de': '',
      'en': 'Actualizar Datos',
    },
    '6qq92jht': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'rzpwbjvg': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'sm443upz': {
      'es': 'Debe ingresar al menos 4 caracteres',
      'ar': '',
      'de': '',
      'en': 'Debe ingresar al menos 4 caracteres',
    },
    'ju8j39wo': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
  },
  // componenteFAQ
  {
    'z0z5667w': {
      'es': 'Cómo utilizamos tus datos ',
      'ar': '',
      'de': '',
      'en': 'Cómo utilizamos tus datos ',
    },
    'ag5xf5xs': {
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'ar': '',
      'de': '',
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
    },
  },
  // componenteEditarPerfil
  {
    'b7t2rcd4': {
      'es': 'Administra tus datos personales.',
      'ar': '',
      'de': '',
      'en': 'Administra tus datos personales.',
    },
    '55ncaw18': {
      'es': 'Primer Nombre',
      'ar': '',
      'de': '',
      'en': 'Primer Nombre',
    },
    'm4xj14ly': {
      'es': 'Por favor ingrese un número valido',
      'ar': '',
      'de': '',
      'en': 'Por favor ingrese un número valido',
    },
    'hy7fknxu': {
      'es': 'Segundo Nombre',
      'ar': '',
      'de': '',
      'en': 'Segundo Nombre',
    },
    'h4thihkr': {
      'es': 'Por favor ingrese un número valido',
      'ar': '',
      'de': '',
      'en': 'Por favor ingrese un número valido',
    },
    'o7ccwtqf': {
      'es': 'RUT',
      'ar': '',
      'de': '',
      'en': 'RUT',
    },
    'hrlsflwt': {
      'es': 'Por favor ingrese un número valido',
      'ar': '',
      'de': '',
      'en': 'Por favor ingrese un número valido',
    },
    '4de3rn2q': {
      'es': 'Email',
      'ar': '',
      'de': '',
      'en': 'Email',
    },
    'elk1qgvh': {
      'es': 'Email',
      'ar': '',
      'de': '',
      'en': 'Email',
    },
    'fwotfu86': {
      'es': 'Actualizar Datos',
      'ar': '',
      'de': '',
      'en': 'Actualizar Datos',
    },
    '3nf27gv7': {
      'es': 'Otras acciones',
      'ar': '',
      'de': '',
      'en': 'Otras acciones',
    },
    'iycgzwq5': {
      'es': 'Eliminar Cuenta',
      'ar': '',
      'de': '',
      'en': 'Eliminar Cuenta',
    },
    '9em3rfaw': {
      'es': 'Validar Cuenta',
      'ar': '',
      'de': '',
      'en': 'Validar Cuenta',
    },
    '28j7behd': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'veq5wox4': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'd6x72ss8': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'vtasq5d9': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'fp0kx1i1': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    '97z1bqb1': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'kt3b0rff': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    '22u7tbnl': {
      'es': 'Introduzca una dirección de correo electrónico válida',
      'ar': '',
      'de': '',
      'en': 'Introduzca una dirección de correo electrónico válida',
    },
    'es1vu7km': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
  },
  // componenteBilletera
  {
    '2dve2x0c': {
      'es':
          'Personaliza tu cartera de tarjetas: elimina, agrega y destaca tu favorita.',
      'ar': '',
      'de': '',
      'en':
          'Personaliza tu cartera de tarjetas: elimina, agrega y destaca tu favorita.',
    },
  },
  // componenteCategorias
  {
    '4nhwqjis': {
      'es': '¿Listo para saldar cuentas? ¿Cuál eliges primero?',
      'ar': '',
      'de': '',
      'en': '¿Listo para saldar cuentas? ¿Cuál eliges primero?',
    },
    'l9uiwndn': {
      'es': '¿Qué cuenta quieres pagar?',
      'ar': '',
      'de': '',
      'en': '¿Qué cuenta quieres pagar?',
    },
    'ob7ynz4c': {
      'es': 'Ingresa aquí el tipo de cuenta, o nombre de la empresa',
      'ar': '',
      'de': '',
      'en': 'Ingresa aquí el tipo de cuenta, o nombre de la empresa',
    },
  },
  // componenteTransacciones
  {
    '09xeljiv': {
      'es':
          'Aquí tienes un informe detallado que enumera todas las transacciones que has realizado.',
      'ar': '',
      'de': '',
      'en':
          'Aquí tienes un informe detallado que enumera todas las transacciones que has realizado.',
    },
    'pvqw94u0': {
      'es': 'Tipo de cuenta',
      'ar': '',
      'de': '',
      'en': 'Edit Header 1',
    },
    'tycyk4px': {
      'es': 'Detalle del pago',
      'ar': '',
      'de': '',
      'en': 'Edit Header 2',
    },
    '23g8ffx4': {
      'es': 'Monto',
      'ar': '',
      'de': '',
      'en': '',
    },
    'fj171d1u': {
      'es': 'Fecha de depósito',
      'ar': '',
      'de': '',
      'en': '',
    },
    '6so8ii1q': {
      'es': 'Estado',
      'ar': '',
      'de': '',
      'en': '',
    },
    'kz22nlov': {
      'es': 'Acciones',
      'ar': '',
      'de': '',
      'en': '',
    },
    '60fuwjg6': {
      'es': 'Ver Mas',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
  // inputComponent
  {
    'yhhlg8fv': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    '4e0i84fe': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'txhsirrm': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
    'vmb0axs8': {
      'es': 'El campo es requerido',
      'ar': '',
      'de': '',
      'en': 'El campo es requerido',
    },
    'mxkhnjq2': {
      'es': 'Por favor elija una opción del menú desplegable',
      'ar': '',
      'de': '',
      'en': 'Por favor elija una opción del menú desplegable',
    },
  },
  // inputMultipleComponent
  {
    'flah2m29': {
      'es': 'Agregar Nuevo',
      'ar': '',
      'de': '',
      'en': 'Agregar Nuevo',
    },
  },
  // Miscellaneous
  {
    'h89om9ca': {
      'es': 'Label here...',
      'ar': '',
      'de': '',
      'en': '',
    },
    '2zjs6sbx': {
      'es': 'Alias',
      'ar': '',
      'de': '',
      'en': '',
    },
    '7dvjkj90': {
      'es': 'Ingresa un alias...',
      'ar': '',
      'de': '',
      'en': '',
    },
    'lzyb73wy': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'kx9cdks4': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'efvtwj7k': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'ec5hfa1e': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'q5ljwvfo': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'j4rmwb3h': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '6ah1b18f': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '2kos1hen': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'e44ib4ft': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'cakqvsfi': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'pop2flz3': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'aox3s4fb': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'l8hv5a7z': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '4pjwb70a': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '0xlokf4y': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '8twlwiwt': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'pcwc6o66': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'qlgl5ubs': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'h4hobj5z': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'xum6tx2v': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '6nf6vc3p': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'fm1ustob': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    't4xzlq9q': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    '513nj4m0': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
    'a1jxfgju': {
      'es': '',
      'ar': '',
      'de': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
