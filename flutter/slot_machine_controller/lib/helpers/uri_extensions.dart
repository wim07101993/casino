extension UriExtensions on Uri {
  Uri addPathSegments(List<String> segments) {
    return replace(pathSegments: [...pathSegments, ...segments]);
  }
}
