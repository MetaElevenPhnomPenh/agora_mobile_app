import 'package:agora/export.dart';


abstract class BaseBlocBuilder<T> {
// Request data from the server
  @required
  void requestData();

// Widget for displaying an error message at the bottom
  Widget errorBottomWidget(BaseBlocState<T> state) {
    return AppErrorBottomWidget(
      status: state.stateStatus,
      message: state.message,
      onTap: () {
        requestData();
      },
    );
  }

// Widget for displaying an error message
  Widget errorWidget(BaseBlocState<T> state) {
    return AppErrorWidget(
      status: state.stateStatus,
      title: state.message,
      onTap: () {
        requestData();
      },
    );
  }

// Widget for displaying a loading indicator
  Widget loadingWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: const AppLoadingWidget(),
    );
  }

// Widget for displaying a loading indicator at the bottom
  Widget loadingBottomWidget() {
    return const AppLoadingWidget();
  }

// Widget builder for handling different states of the bloc
  Widget buildWidget(
    BuildContext context,
    BaseBlocCubit<T> cubit,
    BaseBlocState<T> state, {
    required Widget Function(BuildContext context, T data) builder,
    Widget Function(BuildContext context)? emptyBuilder,
    bool isPage = true,
    bool isWithScaffold = false,
  }) {
    final _builder = Builder(builder: (context) {
      if (cubit.isLoading) {
        // If loading, show either the loading widget or a column with a loading bottom widget.
        return isPage
            ? loadingWidget()
            : Column(
                children: [
                  const SizedBox(height: 15),
                  loadingBottomWidget(),
                ],
              );
      }

      if (cubit.isSuccess) {
        // If successful, show the data using the builder or an Offstage widget if data is null.
        return state.data != null ? builder(context, state.data as T) : const Offstage();
      }

    // Handle the empty state with a custom empty builder if available.
      if (emptyBuilder != null && state.stateStatus == AppStateStatus.empty) {
        return emptyBuilder(context);
      }

    // If not loading or successful, and is a page, show the error widget.
      if (isPage) {
        return errorWidget(state);
      }

    // For other cases, show a column with optional maintenance bar and error bottom widget.
      return Column(
        children: [
          const SizedBox(height: 7),
          if (cubit.isShowBarUnderMaintenance) const SizedBox(height: 100),
          errorBottomWidget(state),
        ],
      );
    });
    return isWithScaffold && !cubit.isSuccess
        ? Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              leading: const BackArrowWidget(),
            ),
            body: _builder,
          )
        : _builder;
  }

// Form builder for handling form states
  Widget buildForm(
    BuildContext context,
    BaseBlocCubit<T> cubit,
    BaseBlocState<T> state, {
    required WidgetBuilder builder,
    bool isPage = true,
  }) {
    return Builder(builder: (context) {
      if (state.stateStatus == AppStateStatus.loading) {
        if (isPage) {
          return const AppLoadingWidget();
        } else {
          return const Column(
            children: [
              SizedBox(height: 15),
              AppLoadingWidget(),
            ],
          );
        }
      }
      return builder(context);
    });
  }

// Listener for form states
  void formListener(
    BuildContext context,
    BaseBlocCubit<T> cubit,
    BaseBlocState<T> state, {
    ValueChanged<T>? onSuccess,
    GestureTapCallback? onError,
    bool isHasMessage = true,
  }) {
    if (cubit.isError) {
      if (isHasMessage) {
        messageListener(context, state);
      }
      onError?.call();
    } else if (cubit.isSuccess) {
      onSuccess?.call(state.data as T);
    }
  }

// Listener for displaying a message
  void messageListener(
    BuildContext context,
    BaseBlocState<T> state,
  ) {
//AppWidgetHelper.messageListener(context, state);
  }
}
