import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';

@Injectable()
abstract class LoadingDialog {
  void show();
  Future<void> hide();
}

class LoadingDialogImpl implements LoadingDialog {
  OverlayEntry _entry;

  LoadingDialogImpl() {
    _entry = OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.white.withOpacity(.3),
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Future<void> hide() async {
    _entry.remove();
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  void show() {
    FocusManager.instance.primaryFocus.unfocus();
    asuka.addOverlay(_entry);
  }
}
