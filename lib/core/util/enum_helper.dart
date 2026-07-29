
T? getEnumFromString<T extends Enum>(String enumString, List<T> values) {
  for (T enumEntry in values) {
    if (enumEntry.name == enumString) {
      return enumEntry;
    }
  }
  return null;
}

String enumToString(Enum enumEntry) {
  return enumEntry.name;
}

int getEnumIndex<T>(T enumEntry, List<T> values) {
  for (var i=0; i < values.length; i++) {
    if (values[i] == enumEntry) {
      return i;
    }
  }
  return -1;
}

T getEnumByIndex<T>(int index, List<T> values) {
  return values[index];
}

List<T> getEnumsFromStringList<T extends Enum>(List<String> enumStringList, List<T> values) {
  List<T> result = [];
  for (String eString in enumStringList) {
    T? entitlement = getEnumFromString<T>(eString, values);
    if (entitlement != null) {
      result.add(entitlement);
    }
  }
  return result;
}



