import 'package:Prism/ui/widgets/home/wallpapers/loading.dart';
import 'package:Prism/ui/widgets/profile/uploadedSetupsGrid.dart';
import 'package:flutter/material.dart';

class UploadedSetupsLoader extends StatefulWidget {
  final Future future;
  const UploadedSetupsLoader({@required this.future});
  @override
  _UploadedSetupsLoaderState createState() => _UploadedSetupsLoaderState();
}

class _UploadedSetupsLoaderState extends State<UploadedSetupsLoader> {
  Future _future;

  @override
  void initState() {
    _future = widget.future;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: FutureBuilder(
        future: _future,
        builder: (ctx, snapshot) {
          if (snapshot == null) {
            debugPrint("snapshot null");
            return const LoadingCards();
          }
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            debugPrint("snapshot none, waiting");
            debugPrint(snapshot.data.toString());
            return const LoadingCards();
          } else {
            return const UploadedSetupsGrid();
          }
        },
      ),
    );
  }
}
