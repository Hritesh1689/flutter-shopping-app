enum MethodType{get, post}

enum ContentTypeLabel{json, multipart}
Map<ContentTypeLabel, String> contentTypeMap = {
  ContentTypeLabel.json      : "application/json",
  ContentTypeLabel.multipart : "multipart/form-data"
};