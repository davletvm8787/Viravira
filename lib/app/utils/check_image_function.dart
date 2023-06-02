bool checkImage(String? imageUrl) {
  if (imageUrl?.isNotEmpty ?? false) {
    try {
      Uri? uri = Uri.tryParse(imageUrl!);
      if (uri != null && (uri.scheme == 'http' || uri.scheme == 'https')) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  } else {
    return false;
  }
}
