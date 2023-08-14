import 'package:dhyana/util/assets.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class FormBuilderImagePicker extends FormBuilderField<Uint8List> {

  final String? initialImageUrl;
  final String labelText;
  final String buttonText;

  FormBuilderImagePicker({
    Key? key,

    this.initialImageUrl,
    this.labelText = 'Photo',
    this.buttonText = 'Select Photo',
    // From Super
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    bool enabled = true,
    Uint8List? initialValue,
    FocusNode? focusNode,
    FormFieldSetter<Uint8List>? onSaved,
    FormFieldValidator<Uint8List>? validator,
    InputDecoration decoration = const InputDecoration(),
    required String name,
    ValueChanged<Uint8List?>? onChanged,
    ValueTransformer<Uint8List?>? valueTransformer,
    VoidCallback? onReset,
  }) : super(
    key: key,
    initialValue: initialValue,
    name: name,
    validator: validator,
    valueTransformer: valueTransformer,
    onChanged: onChanged,
    autovalidateMode: autovalidateMode,
    onSaved: onSaved,
    enabled: enabled,
    onReset: onReset,
    focusNode: focusNode,
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
    Key? key,
    this.validator,
    this.initialImageUrl,
    this.onImageSelected,
    this.labelText = 'Photo',
    this.buttonText = 'Select Photo'
  }) : super(key: key);

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

  void _selectFile() async {
    try {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      Uint8List data = await pickedFile.readAsBytes();
      if (!mounted) return;

      img.Command cmd = img.Command();
      cmd.decodeImage(data);
      cmd.copyResizeCropSquare(
        size: 128,
      );
      cmd.encodeJpg(quality: 90);

      Uint8List? imageData = await cmd.getBytes();

      setState(() {
        hasSelectedImage = true;
        selectedImageData = imageData;
        textEditingController.text = pickedFile.name;
      });

      widget.onImageSelected?.call(selectedImageData!);

    } on PlatformException catch (e) {
      _logException('Unsupported operation: $e');
    } catch (e) {
      _logException(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCurrentImageDisplay(),
      ],
    );
  }

  Widget buildCurrentImageDisplay() {
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
      onTap: () => _selectFile(),
      child: Container(
        width: 160,
        height: 160,
        constraints: const BoxConstraints.tightFor(width: 200),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          border: Border.all(
            color: Colors.black,
            width: AppThemeData.spacingSm
          ),
          color: Colors.grey.shade400,
        ),
        child: Stack(
          children: [
            Positioned(
              right: AppThemeData.spacingSm,
              bottom: AppThemeData.spacingSm,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: AppThemeData.spacingXs),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(Icons.edit, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _logException(String message) {
    debugPrint(message);
    // _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    // _scaffoldMessengerKey.currentState?.showSnackBar(
    //   SnackBar(
    //     content: Text(message),
    //   ),
    // );
  }
}
