import 'package:image_picker/image_picker.dart';

class ImageLocalRepository {
  final ImagePicker picker = ImagePicker();
  Future<String?> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source, imageQuality: 80);
    if (pickedFile != null) {
      return pickedFile.path;
    }
    return null;
  }
}
