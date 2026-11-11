/// Static currency metadata: which codes we list, English names for the most
/// used ones, flag emoji, and the default currency for a device country.
library;

/// Active ISO 4217 fiat currencies we show (the rate API also returns crypto
/// and metals, which are skipped).
const fiatCurrencyCodes = <String>[
  'AED', 'AFN', 'ALL', 'AMD', 'ANG', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', //
  'BAM', 'BBD', 'BDT', 'BGN', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BRL',
  'BSD', 'BTN', 'BWP', 'BYN', 'BZD', 'CAD', 'CDF', 'CHF', 'CLP', 'CNY',
  'COP', 'CRC', 'CUP', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP',
  'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD',
  'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HTG', 'HUF', 'IDR', 'ILS', 'INR',
  'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF',
  'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL',
  'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRU', 'MUR',
  'MVR', 'MWK', 'MXN', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR',
  'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR',
  'RON', 'RSD', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD',
  'SHP', 'SLE', 'SOS', 'SRD', 'SSP', 'STN', 'SVC', 'SYP', 'SZL', 'THB',
  'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX',
  'USD', 'UYU', 'UZS', 'VES', 'VND', 'VUV', 'WST', 'XAF', 'XCD', 'XCG',
  'XOF', 'XPF', 'YER', 'ZAR', 'ZMW', 'ZWL',
];

/// English names for the most used currencies (others show the code only).
const currencyNames = <String, String>{
  'USD': 'US Dollar',
  'EUR': 'Euro',
  'GBP': 'British Pound',
  'JPY': 'Japanese Yen',
  'CNY': 'Chinese Yuan',
  'INR': 'Indian Rupee',
  'PKR': 'Pakistani Rupee',
  'BDT': 'Bangladeshi Taka',
  'IDR': 'Indonesian Rupiah',
  'SAR': 'Saudi Riyal',
  'AED': 'UAE Dirham',
  'KWD': 'Kuwaiti Dinar',
  'QAR': 'Qatari Riyal',
  'OMR': 'Omani Rial',
  'BHD': 'Bahraini Dinar',
  'JOD': 'Jordanian Dinar',
  'EGP': 'Egyptian Pound',
  'MAD': 'Moroccan Dirham',
  'DZD': 'Algerian Dinar',
  'TND': 'Tunisian Dinar',
  'IQD': 'Iraqi Dinar',
  'LBP': 'Lebanese Pound',
  'TRY': 'Turkish Lira',
  'RUB': 'Russian Ruble',
  'UAH': 'Ukrainian Hryvnia',
  'KZT': 'Kazakhstani Tenge',
  'UZS': 'Uzbekistani Som',
  'AFN': 'Afghan Afghani',
  'IRR': 'Iranian Rial',
  'NPR': 'Nepalese Rupee',
  'LKR': 'Sri Lankan Rupee',
  'MYR': 'Malaysian Ringgit',
  'SGD': 'Singapore Dollar',
  'THB': 'Thai Baht',
  'PHP': 'Philippine Peso',
  'VND': 'Vietnamese Dong',
  'KRW': 'South Korean Won',
  'HKD': 'Hong Kong Dollar',
  'TWD': 'New Taiwan Dollar',
  'AUD': 'Australian Dollar',
  'NZD': 'New Zealand Dollar',
  'CAD': 'Canadian Dollar',
  'CHF': 'Swiss Franc',
  'SEK': 'Swedish Krona',
  'NOK': 'Norwegian Krone',
  'DKK': 'Danish Krone',
  'PLN': 'Polish Zloty',
  'CZK': 'Czech Koruna',
  'HUF': 'Hungarian Forint',
  'RON': 'Romanian Leu',
  'BGN': 'Bulgarian Lev',
  'ILS': 'Israeli Shekel',
  'ZAR': 'South African Rand',
  'NGN': 'Nigerian Naira',
  'KES': 'Kenyan Shilling',
  'GHS': 'Ghanaian Cedi',
  'BRL': 'Brazilian Real',
  'MXN': 'Mexican Peso',
  'ARS': 'Argentine Peso',
  'COP': 'Colombian Peso',
  'CLP': 'Chilean Peso',
  'PEN': 'Peruvian Sol',
  'UYU': 'Uruguayan Peso',
  'BOB': 'Bolivian Boliviano',
  'PYG': 'Paraguayan Guarani',
  'VES': 'Venezuelan Bolivar',
  'DOP': 'Dominican Peso',
  'GTQ': 'Guatemalan Quetzal',
  'CRC': 'Costa Rican Colon',
  'XOF': 'West African CFA Franc',
  'XAF': 'Central African CFA Franc',
};

/// Flag emoji for a currency, from the issuing country's ISO code.
String currencyFlag(String code) {
  const overrides = {'EUR': 'EU', 'ANG': 'CW', 'XCG': 'CW'};
  final region = overrides[code] ?? code.substring(0, 2);
  if (code.startsWith('X') && !overrides.containsKey(code)) return '🌐';
  return flagEmoji(region);
}

/// Regional-indicator emoji for a two-letter ISO country code.
String flagEmoji(String countryCode) {
  final cc = countryCode.toUpperCase();
  if (cc.length != 2 || !RegExp(r'^[A-Z]{2}$').hasMatch(cc)) return '🌐';
  return String.fromCharCodes(cc.codeUnits.map((c) => 0x1F1E6 + c - 0x41));
}

const _countryOverrides = <String, String>{
  // Euro area and euro users.
  'AT': 'EUR', 'BE': 'EUR', 'CY': 'EUR', 'DE': 'EUR', 'EE': 'EUR',
  'ES': 'EUR', 'FI': 'EUR', 'FR': 'EUR', 'GR': 'EUR', 'HR': 'EUR',
  'IE': 'EUR', 'IT': 'EUR', 'LT': 'EUR', 'LU': 'EUR', 'LV': 'EUR',
  'MT': 'EUR', 'NL': 'EUR', 'PT': 'EUR', 'SI': 'EUR', 'SK': 'EUR',
  'AD': 'EUR', 'MC': 'EUR', 'SM': 'EUR', 'VA': 'EUR', 'ME': 'EUR',
  'XK': 'EUR', 'GF': 'EUR', 'GP': 'EUR', 'MQ': 'EUR', 'RE': 'EUR',
  'YT': 'EUR', 'PM': 'EUR', 'BL': 'EUR', 'MF': 'EUR', 'AX': 'EUR',
  // US dollar users.
  'EC': 'USD', 'SV': 'USD', 'PR': 'USD', 'TL': 'USD', 'ZW': 'USD',
  'MH': 'USD', 'FM': 'USD', 'PW': 'USD', 'BQ': 'USD', 'VG': 'USD',
  'TC': 'USD', 'GU': 'USD', 'AS': 'USD', 'MP': 'USD', 'VI': 'USD',
  'UM': 'USD', 'IO': 'USD',
  // CFA francs, East Caribbean dollar, CFP franc.
  'BJ': 'XOF', 'BF': 'XOF', 'CI': 'XOF', 'GW': 'XOF', 'ML': 'XOF',
  'NE': 'XOF', 'SN': 'XOF', 'TG': 'XOF',
  'CM': 'XAF', 'CF': 'XAF', 'TD': 'XAF', 'CG': 'XAF', 'GQ': 'XAF',
  'GA': 'XAF',
  'AG': 'XCD', 'DM': 'XCD', 'GD': 'XCD', 'KN': 'XCD', 'LC': 'XCD',
  'VC': 'XCD', 'AI': 'XCD', 'MS': 'XCD',
  'PF': 'XPF', 'NC': 'XPF', 'WF': 'XPF',
  // Others that use a neighbour's currency.
  'LI': 'CHF', 'GL': 'DKK', 'FO': 'DKK', 'PS': 'ILS', 'EH': 'MAD',
  'KI': 'AUD', 'NR': 'AUD', 'TV': 'AUD', 'CC': 'AUD', 'CX': 'AUD',
  'NF': 'AUD', 'CK': 'NZD', 'NU': 'NZD', 'TK': 'NZD', 'PN': 'NZD',
  'CW': 'XCG', 'SX': 'XCG', 'GG': 'GBP', 'JE': 'GBP', 'IM': 'GBP',
  'SJ': 'NOK', 'BV': 'NOK',
};

/// Default currency for a device country (e.g. "PK" → "PKR"); null when
/// unknown.
String? currencyForCountry(String? countryCode) {
  if (countryCode == null || countryCode.length != 2) return null;
  final cc = countryCode.toUpperCase();
  final override = _countryOverrides[cc];
  if (override != null) return override;
  for (final code in fiatCurrencyCodes) {
    if (code.startsWith(cc) && !code.startsWith('X')) return code;
  }
  return null;
}
