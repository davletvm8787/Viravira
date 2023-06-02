import 'package:flutter/cupertino.dart';

import '../../data/network/failure.dart';
import '../common_view/loading_widget.dart';

class DataModel<T> {
  DataStatusEnum statusEnum;
  Failure? failure;
  T? data;

  DataModel({
    required this.statusEnum,
    this.failure,
    this.data,
  });

  factory DataModel.ok({
    required T data,
  }) {
    return DataModel<T>(
      statusEnum: DataStatusEnum.ok,
      data: data,
    );
  }

  factory DataModel.error(Failure failure) {
    return DataModel<T>(
      statusEnum: DataStatusEnum.error,
      failure: failure,
    );
  }
}

enum DataStatusEnum {
  ok,
  error;
}

extension DataModelToStateModel<T> on DataModel<T> {
  StateModel<T> toStateModel() {
    return StateModel<T>(
      stateStatusEnum: () {
        switch (statusEnum) {
          case DataStatusEnum.ok:
            return StateStatusEnum.ok;
          case DataStatusEnum.error:
            return StateStatusEnum.error;
        }
      }(),
      data: data,
      failure: failure,
    );
  }

  void fold(Function(Failure failure) error, Function(T data) ok) {
    switch (statusEnum) {
      case DataStatusEnum.ok:
        ok.call(data as T);
        break;
      case DataStatusEnum.error:
        error.call(failure!);
        break;
    }
  }
}

class StateModel<T> {
  StateStatusEnum stateStatusEnum;
  T? data;
  Failure? failure;

  StateModel({
    required this.stateStatusEnum,
    this.data,
    this.failure,
  });

  factory StateModel.ok({
    required T data,
  }) {
    return StateModel<T>(
      stateStatusEnum: StateStatusEnum.ok,
      data: data,
    );
  }

  factory StateModel.error({
    required Failure failure,
  }) {
    return StateModel<T>(
      stateStatusEnum: StateStatusEnum.error,
      failure: failure,
    );
  }

  factory StateModel.loading() {
    return StateModel<T>(
      stateStatusEnum: StateStatusEnum.loading,
    );
  }
}

enum StateStatusEnum {
  ok,
  loading,
  error;
}

extension StateModelExtension<T> on StateModel<T> {
  Widget getScreenWidget({
    required Widget Function(Failure failure) errorWidget,
    required Widget Function(T data) okWidget,
    Widget? loadingWidget,
  }) {
    switch (stateStatusEnum) {
      case StateStatusEnum.ok:
        return okWidget(data as T);
      case StateStatusEnum.loading:
        return loadingWidget ?? const LoadingWidget();
      case StateStatusEnum.error:
        return errorWidget(failure!);
    }
  }
}
