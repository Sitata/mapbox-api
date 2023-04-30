class MapBoxApiError extends Error {
  MapBoxApiError({
    this.message,
  });

  @override
  String toString() {
    return 'MapBoxApiError{'
        'message: $message, '
        '}';
  }

  String? message;
}
