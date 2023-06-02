import 'package:assarickym/app/base/base_view_model.dart';
import 'package:assarickym/app/utils/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseView<T extends BaseViewModel> extends ConsumerStatefulWidget {
  final VoidCallback? initStateB;
  final Function(T watch, T read)? onViewModelReady;
  final Function(T watch, T read)? onViewAndViewModelReady;
  final VoidCallback? disposeB;
  final Widget Function(T watch, T read) onPageBuild;

  const BaseView(
      {this.initStateB,
      this.onViewModelReady,
      this.onViewAndViewModelReady,
      this.disposeB,
      required this.onPageBuild,
      super.key});

  @override
  BaseViewState<T> createState() => BaseViewState<T>();
}

class BaseViewState<T extends BaseViewModel>
    extends ConsumerState<BaseView<T>> {
  final ChangeNotifierProvider<T> viewModel =
      ChangeNotifierProvider<T>((ref) => getIt<T>());

  @override
  void initState() {
    widget.initStateB?.call();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void viewModelSetup() {
    final watch = ref.watch<T>(viewModel);
    final read = ref.read<T>(viewModel);
    widget.onViewModelReady?.call(watch, read);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.onViewAndViewModelReady?.call(watch, read);
    });
  }

  @override
  void dispose() {
    widget.disposeB?.call();
    final viewModelValue = ref.watch(viewModel);
    viewModelValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late T read;
    late T watch;
    watch = ref.watch<T>(viewModel);
    read = ref.read<T>(viewModel);
    return widget.onPageBuild.call(watch, read);
  }
}
