import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:switchit/app/constants.dart';
import 'package:switchit/screens/home/profile/items_for_trade/view_model/items_for_trade_view_model.dart';
import 'package:switchit/util/status_view.dart';
import 'package:switchit/util/ui/components/button_default.dart';
import 'package:switchit/util/ui/components/default_dialog.dart';
import 'package:switchit/util/ui/components/textfield_default.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ItemsForTradeViewModel viewModel = context.watch<ItemsForTradeViewModel>();

    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                    child: Row(
                      children: [
                        const Text(
                          'Create Item',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 3.5)),
                        Image.asset(
                          'assets/images/user.png',
                          width: 25,
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 5, 0, 15),
                    child: Text(
                      'Insert details',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    ClipPath(
                      clipper: const ShapeBorderClipper(shape: CircleBorder()),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(viewModel.newItemImageUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return const CircularProgressIndicator();
                        }
                        return child;
                      }, errorBuilder: (context, error, stackTrace) {
                        return CircleAvatar(
                            child: SvgPicture.asset("assets/icons/no_image.svg",
                                width: 100, height: 100, fit: BoxFit.cover));
                      }),
                    ),
                    Positioned(
                      right: -16,
                      bottom: 0,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: const BorderSide(color: Colors.white),
                            ),
                            backgroundColor: const Color(0xFFF5F6F9),
                          ),
                          onPressed: () async {
                            _chooseAndUpload(context, viewModel);
                          },
                          child: const Icon(
                            CupertinoIcons.add,
                            color: colorPrimary,
                            size: 50,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              TextFieldDefault(
                keyboardType: TextInputType.text,
                controller: nameController,
                hintText: 'Name',
                onChanged: (currentValue) {
                  viewModel.newItemName = currentValue;
                },
                obscureText: false,
              ),
              const SizedBox(height: 10),
              TextFieldDefault(
                keyboardType: TextInputType.text,
                controller: descriptionController,
                hintText: 'Description',
                onChanged: (currentValue) {
                  viewModel.newItemDescription = currentValue;
                },
                obscureText: false,
              ),
              const SizedBox(height: 10),
              TextFieldDefault(
                keyboardType: TextInputType.streetAddress,
                controller: locationController,
                hintText: 'Location',
                onChanged: (currentValue) {
                  viewModel.newItemLocation = currentValue;
                },
                obscureText: false,
              ),
              const SizedBox(height: 25),
              ButtonDefault(
                name: "Create",
                onTap: () {
                  _submit(context, viewModel);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _chooseAndUpload(
      BuildContext context, ItemsForTradeViewModel viewModel) async {
    final loading = ProgressHUD.of(context);

    FilePickerResult? pickResult =
        await FilePicker.platform.pickFiles(type: FileType.image);
    loading?.show();

    await viewModel.onPhotoSelected(pickResult?.files.single.path!);

    switch (viewModel.status) {
      case StatusView.intial:
        loading?.dismiss();
        break;
      case StatusView.inProgress:
        loading?.show();
        break;
      case StatusView.messageToShow:
        loading?.dismiss();

        setState(() {
          showAlertDialog(
              context: context,
              title: "Alert",
              message: viewModel.message,
              cancelActionText: null,
              defaultActionText: "Ok",
              onDefaultActionPressed: () {});
        });
        break;
      case StatusView.done:
        loading?.dismiss();

        break;
    }
  }

  Future<void> _submit(
      BuildContext context, ItemsForTradeViewModel viewModel) async {
    final loading = ProgressHUD.of(context);
    loading?.show();

    await viewModel.createItem();

    switch (viewModel.status) {
      case StatusView.intial:
        loading?.dismiss();
        break;
      case StatusView.inProgress:
        loading?.show();
        break;
      case StatusView.messageToShow:
        loading?.dismiss();

        setState(() {
          showAlertDialog(
              context: context,
              title: "Alert",
              message: viewModel.message,
              cancelActionText: null,
              defaultActionText: "Ok",
              onDefaultActionPressed: () {});
        });
        break;
      case StatusView.done:
        loading?.dismiss();

        setState(() {
          showAlertDialog(
              context: context,
              title: "Alert",
              message: "New item was successfully added.",
              cancelActionText: null,
              defaultActionText: "Ok",
              onDefaultActionPressed: () async {
                await viewModel.getItemsCurrentUser();

                setState(() {
                  Navigator.pop(context);
                });
              });
        });

        break;
    }
  }
}
