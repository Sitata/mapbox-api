class SuggestionError extends Error {
  SuggestionError({
    this.message,
  });

  @override
  String toString() {
    return 'SuggestionError{'
        'message: $message, '
        '}';
  }

  String? message;
}
