extension StringExtensions on String? {
  /// Check both not null and not empty i.e. "".
  bool get isNotNullAndNotEmpty => this != null && this!.isNotEmpty;

  bool get isNullOREmpty => this == null || this!.isEmpty || this == "null";

  /// Check if not null and empty and also not equal to "null" in the String value else return empty String.
  String get checkNullCondition {
    if (isNotNullAndNotEmpty && this != "null") {
      return this!;
    } else {
      return "";
    }
  }

  /// Capitalize The First Letter Of Each Word
  String get capitalizeFirstOfAll {
    if (isNullOREmpty) return "";
    return this!.split(" ").map((word) => word.isNotEmpty && word.length >= 2 ? "${word[0].toUpperCase()}${word.substring(1)}" : "").join(" ");
  }

  /// Check both not null and not empty i.e. "" and also checks if equals to the parameter string in lower case
  bool isNotNullAndNotEmptyAndEquals(String? str) => this != null && this!.isNotEmpty && this?.toLowerCase() == str?.toLowerCase();

  bool isNotNullNotEmptyAndEqualTo(obj) => this != null && this!.isNotEmpty && this?.toLowerCase() == obj.toString().toLowerCase();

  bool isNotNullEmptyAndInList(List<String> list) => this != null && this!.isNotEmpty && isInList(list);

  bool isInList(List<String> list) {
    list = list.map((e) => e.toLowerCase()).toList();
    return list.contains(this?.toLowerCase());
  }

  String get getInitials => this != null && this!.isNotEmpty ? this!.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join().toUpperCase() : '';

  String get removeAllWhiteSpaces => isNotNullAndNotEmpty ? this!.replaceAll(RegExp(r"\s+"), "") : "";
}