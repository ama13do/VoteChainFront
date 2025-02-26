import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'id', 'ms'];

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
    String? idText = '',
    String? msText = '',
  }) =>
      [enText, idText, msText][languageIndex] ?? '';

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
  // Login
  {
    '3p97u62u': {
      'en': 'Welcome Back!',
      'id': 'Selamat Datang kembali!',
      'ms': 'Selamat kembali!',
    },
    'xkz4xjo6': {
      'en': 'Use the form below to access your account.',
      'id': 'Gunakan formulir di bawah ini untuk mengakses akun Anda.',
      'ms': 'Gunakan borang di bawah untuk mengakses akaun anda.',
    },
    'k9u5spqi': {
      'en': 'Email Address',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'f4xxyrqv': {
      'en': 'Enter your email here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'lfzvgi5q': {
      'en': 'Password',
      'id': 'Kata sandi',
      'ms': 'Kata laluan',
    },
    'wt8sx5du': {
      'en': 'Enter your password here...',
      'id': 'Masukkan kata sandi Anda di sini...',
      'ms': 'Masukkan kata laluan anda di sini...',
    },
    's8bicxzh': {
      'en': 'Forgot Password?',
      'id': 'Tidak ingat kata sandi?',
      'ms': 'Lupa kata laluan?',
    },
    'm9klj9ah': {
      'en': 'Login',
      'id': 'Gabung',
      'ms': 'Log masuk',
    },
    'zy328lg7': {
      'en': 'Use a social platform to continue',
      'id': 'Gunakan platform sosial untuk melanjutkan',
      'ms': 'Gunakan platform sosial untuk meneruskan',
    },
    'tcu0c8bu': {
      'en': 'Don\'t have an account?',
      'id': 'Tidak punya akun?',
      'ms': 'Tiada akaun?',
    },
    'kk2rdqi2': {
      'en': 'Create Account',
      'id': 'Buat Akun',
      'ms': 'Buat akaun',
    },
    'iha5socs': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // Home
  {
    '3bi54x5g': {
      'en': 'Votaciones',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'nnv46x35': {
      'en': 'Votaciones Pendientes',
      'id': 'Di bawah ini adalah ringkasan aktivitas tim Anda.',
      'ms': 'Di bawah ialah ringkasan aktiviti pasukan anda.',
    },
    'jqevo63s': {
      'en': 'Diputados',
      'id': 'pelanggan baru',
      'ms': 'pelanggan baru',
    },
    'd0r4w3cc': {
      'en': '24',
      'id': '24',
      'ms': '24',
    },
    '8vot9bzj': {
      'en': 'Colonia',
      'id': 'Kontrak Baru',
      'ms': 'Kontrak Baru',
    },
    '463rfkem': {
      'en': '3,200',
      'id': '3.200',
      'ms': '3,200',
    },
    'saxskj92': {
      'en': 'Comite Escolar',
      'id': 'Kontrak Kedaluwarsa',
      'ms': 'Kontrak Tamat',
    },
    '2wlrr5lg': {
      'en': '4300',
      'id': '4300',
      'ms': '4300',
    },
    'kphqz3hi': {
      'en': 'Votaciones realizadas',
      'id': 'Proyek',
      'ms': 'Projek',
    },
    'xlzf8qqx': {
      'en': 'Último Mes',
      'id': 'Tim Desain UI',
      'ms': 'Pasukan Reka Bentuk UI',
    },
    'zt3s5l2s': {
      'en': '4 Votaciones',
      'id': '4 Anggota',
      'ms': '4 Ahli',
    },
    'puy8obok': {
      'en': 'Contract Activity',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'zlovh0zt': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'g1uaaovn': {
      'en': 'Customer Activity',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
    },
    'e5q3ows1': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'uj7jsxmo': {
      'en': 'Informacion de las votaciones',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'hkk2zmjw': {
      'en': 'Lineamientos de las votaciones',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'jkgae0vc': {
      'en': 'Avance de votacion',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
    },
    'g4os7kcp': {
      'en': 'Verifica tu faltante en votaciones',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'y24lcr13': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'xdxbdj20': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Main_customerList
  {
    'n99lg1qh': {
      'en': 'Candidat@s',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    'lvnskphp': {
      'en': 'Diputados',
      'id': 'Semua',
      'ms': 'Semua',
    },
    'a258xeav': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'wduyui67': {
      'en': 'Head of Procurement',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    'riw99ssl': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'u0su8kte': {
      'en': 'James Wiseman',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'nyfsg4hw': {
      'en': 'Account Manager',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
    },
    'gzwu4cjr': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'v1ffzm93': {
      'en': 'Ignacious Rodriguez',
      'id': 'Rodriguez yang kejam',
      'ms': 'Ignacious Rodriguez',
    },
    '8jo402mn': {
      'en': 'Sales Manager',
      'id': 'Manajer penjualan',
      'ms': 'Pengurus jualan',
    },
    'r658c9dm': {
      'en': 'Robin HQ',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'l5cpbw6i': {
      'en': 'Elena Williams',
      'id': 'Elena Williams',
      'ms': 'Elena Williams',
    },
    '9ico69uv': {
      'en': 'Head of Product & Innovation',
      'id': 'Kepala Produk &amp; Inovasi',
      'ms': 'Ketua Produk &amp; Inovasi',
    },
    'i1898004': {
      'en': 'Robin HQ',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    's8kuamom': {
      'en': 'Greg Brown',
      'id': 'Greg Brown',
      'ms': 'Greg Brown',
    },
    'uu60i528': {
      'en': 'Account Manager',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
    },
    '6nuzim8s': {
      'en': 'Robin HQ',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'lwflemu4': {
      'en': 'June Williamson',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    'rxejb1ds': {
      'en': 'Sr. Account Manager',
      'id': 'Manajer Akun Senior',
      'ms': 'Tuan Pengurus Akaun',
    },
    'k5yutyp7': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'z6bqikmn': {
      'en': 'June Williamson',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    'rm4hba82': {
      'en': 'Sr. Account Manager',
      'id': 'Manajer Akun Senior',
      'ms': 'Tuan Pengurus Akaun',
    },
    'id05iiyh': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'qh2ock0d': {
      'en': 'Colonia',
      'id': 'Aktif',
      'ms': 'Aktif',
    },
    'evmi1fjb': {
      'en': 'June Williamson',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    '7t7dfs7b': {
      'en': 'Sr. Account Manager',
      'id': 'Manajer Akun Senior',
      'ms': 'Tuan Pengurus Akaun',
    },
    'rv0grt5f': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    '1c1n7s8k': {
      'en': 'James Wiseman',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    '13p4ybb4': {
      'en': 'Account Manager',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
    },
    'y7tux8cs': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    's7xebw09': {
      'en': 'Comite E',
      'id': 'Panggilan Dingin',
      'ms': 'Panggilan Dingin',
    },
    'xaq75cfo': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    '3hsvv2b4': {
      'en': 'Head of Procurement',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    '8df6l0nu': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    '1azw03n0': {
      'en': 'Elena Williams',
      'id': 'Elena Williams',
      'ms': 'Elena Williams',
    },
    '4i0nlpng': {
      'en': 'Head of Product & Innovation',
      'id': 'Kepala Produk &amp; Inovasi',
      'ms': 'Ketua Produk &amp; Inovasi',
    },
    'k60lznjm': {
      'en': 'Robin HQ',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'fcyoodds': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '3ourv2w9': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Main_Contracts
  {
    '4h88trkp': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'smh1o93d': {
      'en': 'Crear votacion',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    't967eizl': {
      'en': 'Projects',
      'id': 'Proyek',
      'ms': 'Projek',
    },
    'dpt94d56': {
      'en': 'Evento',
      'id': 'Desain Platform Tanpa Kode',
      'ms': 'Reka Bentuk Platform Tanpa Kod',
    },
    '2a7y5e2w': {
      'en': 'Elección',
      'id': 'Dokumen Tim Desain',
      'ms': 'Dokumen Pasukan Reka Bentuk',
    },
    'dlt46loo': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'sqmgdsam': {
      'en': 'Artistas',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'h9kiq8rj': {
      'en': 'Proximamente',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    '7mjz03wi': {
      'en': 'L, 11:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    '8e820p1r': {
      'en': 'Continuar',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    '7wcrhzda': {
      'en': 'Empleado del Mes',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'fp6xlmv9': {
      'en': 'Proximamente',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    'k0rirjak': {
      'en': 'D, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'nanoxp6w': {
      'en': 'Continuar',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    'j08eiorc': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // myTeam
  {
    '8jlklje5': {
      'en': 'Agregar votantes',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    '9iuss6gl': {
      'en': 'Search for your customers...',
      'id': 'Cari pelanggan Anda...',
      'ms': 'Cari pelanggan anda...',
    },
    '5mtplc2u': {
      'en': 'Nombre',
      'id': 'Nama anggota',
      'ms': 'Nama ahli',
    },
    'xsqhz5g4': {
      'en': 'Email',
      'id': 'Surel',
      'ms': 'E-mel',
    },
    'xkijgi68': {
      'en': 'Last Active',
      'id': 'Aktif Terakhir',
      'ms': 'Aktif Terakhir',
    },
    'dtsi2m5j': {
      'en': 'Date Created',
      'id': 'Tanggal Diciptakan',
      'ms': 'Tarikh Dibuat',
    },
    'yxvgnrrg': {
      'en': 'Alex Smith',
      'id': 'Alex Smith',
      'ms': 'Alex Smith',
    },
    'hbvgee7f': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'cxqbcilh': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    'mv4x7wmh': {
      'en': 'Elegir',
      'id': 'Status',
      'ms': 'Status',
    },
    'w2zw9cr7': {
      'en': 'Andrea Rudolph',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    '975lfxpw': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'cr4tpu01': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    '65466g2l': {
      'en': 'Elegir',
      'id': 'Status',
      'ms': 'Status',
    },
    '6wt4aamp': {
      'en': 'Andrea Rudolph',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    'l96eacgw': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'l2l3xguz': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    'j5fz217z': {
      'en': 'Elegir',
      'id': 'Status',
      'ms': 'Status',
    },
    'aa3kj1vf': {
      'en': 'Andrea Rudolph',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    'a34fke7r': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'anzvwh88': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    'pmybqcyj': {
      'en': 'Elegir',
      'id': 'Status',
      'ms': 'Status',
    },
    'ejpiipnj': {
      'en': 'Andrea Rudolph',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    'xhwmudov': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    '55rj4ws9': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    '7fin6z7v': {
      'en': 'Elegir',
      'id': 'Status',
      'ms': 'Status',
    },
    '54fbheio': {
      'en': 'Andrea Rudolph',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    '5zdg3l5v': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'pfrreymz': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    'r47lqzrc': {
      'en': 'Elegir',
      'id': 'Status',
      'ms': 'Status',
    },
    'ym579y79': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'smtxdnbn': {
      'en': '',
      'id': '__',
      'ms': '__',
    },
  },
  // Main_profilePage
  {
    'qrxn5crt': {
      'en': 'Mi perfil',
      'id': 'Profil saya',
      'ms': 'Profil saya',
    },
    'yj2g6q7m': {
      'en': 'Carlos',
      'id': '',
      'ms': '',
    },
    'cc8b50rr': {
      'en': 'carlos@companyname.com',
      'id': 'andrew@namaperusahaan.com',
      'ms': 'andrew@companyname.com',
    },
    'v1hh7jlp': {
      'en': 'Modo Oscuro',
      'id': 'Beralih ke Mode Gelap',
      'ms': 'Tukar kepada Mod Gelap',
    },
    'sh7q15l6': {
      'en': 'Switch to Light Mode',
      'id': 'Beralih ke Mode Cahaya',
      'ms': 'Tukar kepada Mod Cahaya',
    },
    'fyxsf6vn': {
      'en': 'Configuracion',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    'h43llaan': {
      'en': 'Cambiar Contraseña',
      'id': 'Ganti kata sandi',
      'ms': 'Tukar kata laluan',
    },
    'b1lw0hfu': {
      'en': 'Editar Perfil',
      'id': 'Sunting profil',
      'ms': 'Sunting profil',
    },
    'abqf147c': {
      'en': 'Salir',
      'id': 'Keluar',
      'ms': 'Log keluar',
    },
    'o3dp9tss': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // userDetails
  {
    'obyrn1rb': {
      'en': 'Nombre',
      'id': 'Nama Pelanggan',
      'ms': 'Nama Pelanggan',
    },
    '00sam6zz': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'nxuoeukv': {
      'en': 'High Profile',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'ecbeopja': {
      'en': 'Title',
      'id': 'Judul',
      'ms': 'Tajuk',
    },
    'xf6clrz6': {
      'en': 'Licenciado',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    'kl55bl1c': {
      'en': 'Company',
      'id': 'Perusahaan',
      'ms': 'Syarikat',
    },
    'nh9bkr5i': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'dkyygm1d': {
      'en': 'Notes',
      'id': 'Catatan',
      'ms': 'Nota',
    },
    'p82rjlf3': {
      'en': 'Alexandria Smith',
      'id': 'Alexandria Smith',
      'ms': 'Alexandria Smith',
    },
    '2s53b50t': {
      'en': '1m ago',
      'id': '1 menit yang lalu',
      'ms': '1m lalu',
    },
    'rnaiavvh': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'id':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'ms':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laboure et dolore magna aliqua. Untuk meminimumkan veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    'bujmmf46': {
      'en': '8',
      'id': '8',
      'ms': '8',
    },
    'ntlrz0gk': {
      'en': 'Notes',
      'id': 'Catatan',
      'ms': 'Nota',
    },
    'rw21s3dk': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'mj096u71': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'id':
          'Saya tidak begitu yakin tentang bagian ini di sini saya pikir Anda harus melakukan sesuatu yang keren!',
      'ms':
          'Saya tidak begitu pasti tentang bahagian ini di sini kerana saya fikir anda perlu melakukan sesuatu yang menarik!',
    },
    '1n2y2xin': {
      'en': 'a min ago',
      'id': 'beberapa menit yang lalu',
      'ms': 'min yang lalu',
    },
    'ojneuoau': {
      'en': 'Votar',
      'id': 'Hasilkan Penawaran',
      'ms': 'Hasilkan Petikan',
    },
    'suvzdvvk': {
      'en': 'Regresar',
      'id': 'Lihat Perusahaan',
      'ms': 'Lihat Syarikat',
    },
    '9t913b44': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // editProfile
  {
    'mk8nnw94': {
      'en': 'Change Photo',
      'id': '',
      'ms': '',
    },
    '2rqce1pj': {
      'en': 'The email associated with this account is:',
      'id': '',
      'ms': '',
    },
    'rr8ksatz': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
    },
    '20uycztj': {
      'en': 'Edit Profile',
      'id': '',
      'ms': '',
    },
  },
  // BlockChain
  {
    '6i129wbm': {
      'en': 'check.io',
      'id': '',
      'ms': '',
    },
    'q69uy8jo': {
      'en': 'Platform Navigation',
      'id': '',
      'ms': '',
    },
    'mhlr515t': {
      'en': 'Dashboard',
      'id': '',
      'ms': '',
    },
    'dtlozbnw': {
      'en': 'Chats',
      'id': '',
      'ms': '',
    },
    'pedweqtb': {
      'en': 'All Tasks',
      'id': '',
      'ms': '',
    },
    'bsyy35du': {
      'en': '12',
      'id': '',
      'ms': '',
    },
    'yi12se25': {
      'en': 'Projects',
      'id': '',
      'ms': '',
    },
    'kqilnfs1': {
      'en': 'Settings',
      'id': '',
      'ms': '',
    },
    'gyuahwte': {
      'en': 'Billing',
      'id': '',
      'ms': '',
    },
    'ufyaedh6': {
      'en': 'Explore',
      'id': '',
      'ms': '',
    },
    'cpim1kly': {
      'en': 'Light Mode',
      'id': '',
      'ms': '',
    },
    'nyx3bvrk': {
      'en': 'Dark Mode',
      'id': '',
      'ms': '',
    },
    'l5a73lzk': {
      'en': 'Andrew D.',
      'id': '',
      'ms': '',
    },
    'pu4029g4': {
      'en': 'admin@gmail.com',
      'id': '',
      'ms': '',
    },
    'nnn45szy': {
      'en': 'Team Activity',
      'id': '',
      'ms': '',
    },
    'kyti840p': {
      'en': 'Votos realizados',
      'id': '',
      'ms': '',
    },
    'b245vn87': {
      'en': 'Todas',
      'id': '',
      'ms': '',
    },
    'k3qwlvrs': {
      'en': 'En  progerso',
      'id': '',
      'ms': '',
    },
    '3ojd4igr': {
      'en': 'Completadas',
      'id': '',
      'ms': '',
    },
    '83992jre': {
      'en': 'Todas',
      'id': '',
      'ms': '',
    },
    'f7djbbaf': {
      'en': 'All',
      'id': '',
      'ms': '',
    },
    'ov6w9qkd': {
      'en': 'Search all tasks...',
      'id': '',
      'ms': '',
    },
    'bn5m724v': {
      'en': 'a2c7b9e1-f8b6-4a2d-b9c6',
      'id': '',
      'ms': '',
    },
    'qjp7c12i': {
      'en': '10m ago',
      'id': '',
      'ms': '',
    },
    '0hn3btxn': {
      'en': 'Votacion',
      'id': '',
      'ms': '',
    },
    'g72p5qtv': {
      'en': ' Comite Escolar',
      'id': '',
      'ms': '',
    },
    'v1ce8h1v': {
      'en': '4ca3f183-04b7-4c33-94ca',
      'id': '',
      'ms': '',
    },
    'ucispuwg': {
      'en': '7m ago',
      'id': '',
      'ms': '',
    },
    'ojsobwm1': {
      'en': 'Votacion ',
      'id': '',
      'ms': '',
    },
    'kq37u97a': {
      'en': 'Colonia',
      'id': '',
      'ms': '',
    },
    '0t37vxuq': {
      'en': 'da70ec7a-326c-43f7-91eb',
      'id': '',
      'ms': '',
    },
    '4eoq8p3n': {
      'en': '5m ago',
      'id': '',
      'ms': '',
    },
    'ikw3evfb': {
      'en': 'Votacion ',
      'id': '',
      'ms': '',
    },
    '10vuq82v': {
      'en': 'Rudy Fernandez ',
      'id': '',
      'ms': '',
    },
    '9tychejh': {
      'en': ' en ',
      'id': '',
      'ms': '',
    },
    'a98pns2f': {
      'en': 'Diputados',
      'id': '',
      'ms': '',
    },
    'p5cbovtu': {
      'en': 'c96c769a-ebe5-4657-a8d8',
      'id': '',
      'ms': '',
    },
    'lurt3u7x': {
      'en': '3m ago',
      'id': '',
      'ms': '',
    },
    'kr80xln3': {
      'en': 'Votacion ',
      'id': '',
      'ms': '',
    },
    'y23u6fdq': {
      'en': 'Colonia',
      'id': '',
      'ms': '',
    },
    'aguove77': {
      'en': 'fe4c9a2b-1d8e-4c7f-9e6d',
      'id': '',
      'ms': '',
    },
    'xo3zvsa0': {
      'en': '2m ago',
      'id': '',
      'ms': '',
    },
    '5oz2730e': {
      'en': 'Votacion',
      'id': '',
      'ms': '',
    },
    'wxyop9xf': {
      'en': ' Comite Escolar',
      'id': '',
      'ms': '',
    },
    'tody2y5s': {
      'en': 'Actividad de Votos',
      'id': '',
      'ms': '',
    },
  },
  // modal_success
  {
    'kred63vb': {
      'en': 'Send Contract Confirmation',
      'id': 'Kirim Konfirmasi Kontrak',
      'ms': 'Hantar Pengesahan Kontrak',
    },
    'hywgg8eu': {
      'en': 'A new contract has been generated for:',
      'id': 'Kontrak baru telah dibuat untuk:',
      'ms': 'Kontrak baru telah dijana untuk:',
    },
    'kmp2gbpy': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'a7nc1dt4': {
      'en': 'Head of Procurement',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    '2f2nxucv': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'vcm4fijj': {
      'en': 'Next Steps',
      'id': 'Langkah selanjutnya',
      'ms': 'Langkah seterusnya',
    },
    '60n0fqw5': {
      'en':
          'Send the information below. And we will send an email with details to the customer and allow you to manage it in your dashboard.',
      'id':
          'Kirim informasi di bawah ini. Dan kami akan mengirimkan email dengan detail kepada pelanggan dan memungkinkan Anda untuk mengelolanya di dasbor Anda.',
      'ms':
          'Hantar maklumat di bawah. Dan kami akan menghantar e-mel dengan butiran kepada pelanggan dan membenarkan anda mengurusnya dalam papan pemuka anda.',
    },
    'e408bhw6': {
      'en': 'Send Information',
      'id': 'Kirim Informasi',
      'ms': 'Hantar Maklumat',
    },
    'wo1onxhi': {
      'en': 'Never Mind',
      'id': 'Sudahlah',
      'ms': 'Tidak mengapa',
    },
  },
  // modal_Message
  {
    'wa4vkne2': {
      'en': 'Congratulations!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    '3hf2ocig': {
      'en':
          'Now that a contract has been generated for this customer please contact them with the date you will send the signed agreement.',
      'id':
          'Sekarang kontrak telah dibuat untuk pelanggan ini, silakan hubungi mereka dengan tanggal Anda akan mengirim perjanjian yang ditandatangani.',
      'ms':
          'Memandangkan kontrak telah dijana untuk pelanggan ini, sila hubungi mereka dengan tarikh anda akan menghantar perjanjian yang ditandatangani.',
    },
    'q0jvi1lp': {
      'en': 'Okay',
      'id': 'Oke',
      'ms': 'baik',
    },
    'oo4y13nf': {
      'en': 'Continue',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // modal_Welcome
  {
    '00flvi93': {
      'en': 'Congratulations!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    'fmzceh74': {
      'en': 'A new contract has been generated for:',
      'id': 'Kontrak baru telah dibuat untuk:',
      'ms': 'Kontrak baru telah dijana untuk:',
    },
    'g8q2u55w': {
      'en': 'Continue',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // mobileNav
  {
    'sy0pxvma': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    't5c3aiuy': {
      'en': 'My Team',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    'nkz3c58a': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '1mkyyjwj': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'eg79coc6': {
      'en': 'Profile',
      'id': 'Profil',
      'ms': 'Profil',
    },
  },
  // webNav
  {
    'xai8ocja': {
      'en': 'Search',
      'id': 'Mencari',
      'ms': 'Cari',
    },
    'yg07zi4c': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    '5s0d776i': {
      'en': 'My Team',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    'lbojdpxg': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '9pjba90p': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    '01nu9cy0': {
      'en': 'BlockChain',
      'id': 'Profil',
      'ms': 'Profil',
    },
    '3m1s7exi': {
      'en': 'Profile',
      'id': 'Profil',
      'ms': 'Profil',
    },
  },
  // Miscellaneous
  {
    '65e2tfs2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ddazihx4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'db03cpjj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fdb9078p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '80ouzj9q': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '6rzhptp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ce8c4ty0': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ckozhz6x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'z50y78ap': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '67nfs4jv': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'rht373m9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'kcvqa08x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dqrzd6sq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dpqtohyf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'v01vf71s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'gcv6def1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'um9es99m': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'o4enbz4j': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8z4tvfh7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2ybzla8x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'd1wdf5i1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8dacq27u': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2py80kgi': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'p6lsrh2a': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ne8cclp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
  },
].reduce((a, b) => a..addAll(b));
