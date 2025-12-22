import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_application/models/image_model.dart';
import 'package:simple_application/repo/image_repository.dart';

class NetworkImagePickerBottomSheet extends StatelessWidget {
  final void Function(String) onImageSelected;
  const NetworkImagePickerBottomSheet({
    super.key,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: FutureBuilder<List<ImageModel>>(
        future: ImageRepository.getNetworkImages(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ImageModel>> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return GridView.builder(
                  // this is fine cause we already made sure snapshor.data !- null
                  itemCount: snapshot.data!.length,
                  // a delegate controlls how the individual items inside
                  // the Grid view are laid out!
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                  ),
                  itemBuilder: (context, index) {
                    // get data here once
                    final data = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        // pass the image
                        onImageSelected(data.urlFullSize);
                        final String msg =
                            "Image with title ${data.title} was selected";
                        if (kDebugMode) {
                          print(msg);
                        }
                      },
                      child: Image.network(data.urlFullSize),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
      ),
    );
  }
}
