import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

const String _sharedPreferencesKey = "isDark";

typedef Widget ThemedWidgetBuilder(BuildContext context, ThemeData data);

typedef ThemeData ThemeDataWithBrightnessBuilder(Brightness brightness);

class SkinManager {
  static SkinManager _instance;
  Brightness _brightness = Brightness.light;

  SkinManager._internal();

  factory SkinManager() {
    if (_instance == null) {
      _instance = SkinManager._internal();
    }
    return _instance;
  }

  setBrightness(BuildContext context, Brightness brightness) {
    if (brightness != _brightness) {
      _brightness = brightness;
      _DynamicThemeState state;
      if (context is StatefulElement) {
        StatefulElement element = context;
        if (element.state is _DynamicThemeState) {
          state = context.state;
        }
      }
      if (state == null) {
        state = context.ancestorStateOfType(
            const TypeMatcher<_DynamicThemeState>());
      }
      if (state != null) {
        state.setBrightness(_brightness);
      }
      _saveConfig(_brightness);
    }
  }

  get brightness {
    return _brightness;
  }

  Widget wrap(
      {Key key, ThemeDataWithBrightnessBuilder themeBuilder, ThemedWidgetBuilder themedWidgetBuilder}) {
    return _DynamicTheme(
        key: key,
        data: themeBuilder,
        themedWidgetBuilder: (context, data) {
          _loadConfig(context);
          return themedWidgetBuilder(context, data);
        },
        defaultBrightness: _brightness);
  }

  _loadConfig(BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Brightness localBrightness = sp.getBool(_sharedPreferencesKey)
        ? Brightness.dark
        : Brightness.light;
    setBrightness(context, localBrightness);
  }

  _saveConfig(Brightness brightness) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(
        _sharedPreferencesKey, brightness == Brightness.dark ? true : false);
  }
}

class _DynamicTheme extends StatefulWidget {

  final ThemedWidgetBuilder themedWidgetBuilder;

  final ThemeDataWithBrightnessBuilder data;

  final Brightness defaultBrightness;

  const _DynamicTheme(
      {Key key, this.data, this.themedWidgetBuilder, this.defaultBrightness})
      : super(key: key);

  @override
  _DynamicThemeState createState() => new _DynamicThemeState();
}

class _DynamicThemeState extends State<_DynamicTheme> {

  ThemeData _data;

  Brightness _brightness;

  @override
  void initState() {
    super.initState();
    _brightness = widget.defaultBrightness;
    _data = widget.data(_brightness);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _data = widget.data(_brightness);
  }

  @override
  void didUpdateWidget(_DynamicTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    _data = widget.data(_brightness);
  }

  @override
  Widget build(BuildContext context) {
    return widget.themedWidgetBuilder(context, _data);
  }

  void setBrightness(Brightness brightness) async {
    setState(() {
      this._data = widget.data(brightness);
      this._brightness = brightness;
    });
  }

  void setThemeData(ThemeData data) {
    setState(() {
      this._data = data;
    });
  }
}

