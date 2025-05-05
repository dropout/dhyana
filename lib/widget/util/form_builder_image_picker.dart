import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/util/assets.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class FormBuilderImagePicker extends FormBuilderField<Uint8List> {

  final String? initialImageUrl;
  final String labelText;
  final String buttonText;

  FormBuilderImagePicker({
    super.key,

    this.initialImageUrl,
    this.labelText = 'Photo',
    this.buttonText = 'Select Photo',
    // From Super
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
    super.enabled,
    super.initialValue,
    super.focusNode,
    super.onSaved,
    super.validator,
    InputDecoration decoration = const InputDecoration(),
    required super.name,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
  }) : super(
    builder: (FormFieldState<Uint8List?> field) {
      final state = field as FormBuilderImagePickerState;
      final widget = state.widget;

      return InputDecorator(
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        child: ImagePickerWidget(
          initialImageUrl: widget.initialImageUrl,
          labelText: widget.labelText,
          buttonText: widget.buttonText,
          onImageSelected: (value) {
            field.didChange(value);
          }
        ),
      );
    },
  );

  @override
  FormBuilderImagePickerState createState() => FormBuilderImagePickerState();
}

class FormBuilderImagePickerState
    extends FormBuilderFieldState<FormBuilderImagePicker, Uint8List> {



  @override
  void initState() {

    if (widget.initialImageUrl != null) {

    }

    super.initState();
  }
}


class ImagePickerWidget extends StatefulWidget {

  final String labelText;
  final String buttonText;
  final String? initialImageUrl;
  final FormFieldValidator<String?>? validator;
  final void Function(Uint8List)? onImageSelected;

  const ImagePickerWidget({
    super.key,
    this.validator,
    this.initialImageUrl,
    this.onImageSelected,
    this.labelText = 'Photo',
    this.buttonText = 'Select Photo'
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {

  ImagePicker picker = ImagePicker();
  Uint8List? selectedImageData;

  bool hasInitialValue = false;
  bool hasSelectedImage = false;

  final TextEditingController textEditingController =
    TextEditingController();

  @override
  void initState() {

    String? initUrl = widget.initialImageUrl;
    if (initUrl != null) {
      hasInitialValue = true;
      textEditingController.text = initUrl;
    } else {
      hasInitialValue = false;
    }

    super.initState();
  }

  void _onWidgetTapped(BuildContext context) {
    _selectFile(context);
    context.hapticsTap();
  }

  void _selectFile(BuildContext context) async {
    try {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      Uint8List data = await pickedFile.readAsBytes();
      img.Command imageCommand = img.Command();
      imageCommand.decodeImage(data);
      imageCommand.copyResizeCropSquare(
        size: 128,
      );
      imageCommand.encodeJpg(quality: 90);

      Uint8List? imageData = await imageCommand.getBytes();
      setState(() {
        hasSelectedImage = true;
        selectedImageData = imageData;
        textEditingController.text = pickedFile.name;
      });
      widget.onImageSelected?.call(selectedImageData!);
    } on PlatformException catch (e) {
      if (context.mounted) {
        context.push('location');
        if (e.code == 'photo_access_denied') {
          showDialog(context: context, builder: (BuildContext ctx) {
            return buildPhotoAccessDialog(ctx);
          });
        }
      }
      _logException('Unsupported operation: $e');
    } catch (e) {
      _logException(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCurrentImageDisplay(context),
      ],
    );
  }

  Widget buildPhotoAccessDialog(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).photoAccessDialogTitle),
      content: Text(AppLocalizations.of(context).photoAccessDialogText
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(AppLocalizations.of(context).photoAccessDialogButtonText.toUpperCase()),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget buildCurrentImageDisplay(BuildContext context) {
    ImageProvider imageProvider;
    if (hasInitialValue && hasSelectedImage == false) {
      imageProvider = NetworkImage(widget.initialImageUrl!);
    } else if (hasSelectedImage) {
      Uint8List bytes = selectedImageData!;
      imageProvider = MemoryImage(bytes);
    } else {
      imageProvider = const AssetImage(Assets.avatarPlaceholder);
    }

    return GestureDetector(
      onTap: () => _onWidgetTapped(context),
      child: Container(
        width: AppThemeData.circleLg,
        height: AppThemeData.circleLg,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          border: Border.all(
            color: Colors.black,
            width: 4.0,
          ),
          color: Colors.grey.shade400,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _logException(String message) {
    debugPrint(message);
  }
}
