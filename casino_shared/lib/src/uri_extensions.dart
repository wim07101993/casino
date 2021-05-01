extension UriExtensions on Uri {
  Uri addPathSegments(Iterable<String> pathSegments) {
    return replace(pathSegments: [...this.pathSegments, ...pathSegments]);
  }
}
