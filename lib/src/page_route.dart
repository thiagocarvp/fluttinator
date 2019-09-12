import 'package:flutter/material.dart';

class FluttinatorPageRoute extends MaterialPageRoute {
  FluttinatorPageRoute({
    @required builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  })  : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        assert(opaque),
        super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  bool get canPop => this.navigator.canPop() || this.willHandlePopInternally;
}
