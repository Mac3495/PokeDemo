import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'get_data_state.freezed.dart';

@freezed
class GetDataState with _$GetDataState {
  const factory GetDataState.data(dynamic data) = _Data;
  const factory GetDataState.error(String error)= _Error;
  const factory GetDataState.loading() = _Loading; 
}

// dart run build_runner build --delete-conflicting-outputs