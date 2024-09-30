import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:alkhatouna/Locale/language_cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleState(Locale('en')));
  Future<void> getSavedLAnguage() async {
    final String chachedLangugeCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(LocaleState(Locale(chachedLangugeCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cachelanguageCode(languageCode);
    emit(LocaleState(Locale(languageCode)));
  }
}
