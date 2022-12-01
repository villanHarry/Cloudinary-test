Future<String> generate(BuildContext context, File file, String cloudname, String uploadPreset) async {
  final cloudinary = CloudinaryPublic(
    cloudname, uploadPreset
  );

  late String url = "";

  try {
    CloudinaryResponse response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(file.path,
          resourceType: CloudinaryResourceType.Image, folder: "uploads"),
    );

    url = response.secureUrl;
    return url;
  } on CloudinaryException catch (e) {
    showSnackBar(context: context, content: e.message!);
    return url;
  }
}
