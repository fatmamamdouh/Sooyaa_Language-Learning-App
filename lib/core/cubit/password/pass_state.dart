class PasswordState {
  final bool isPassVisible;
  final bool isConPassVisible;

  const PasswordState({
    this.isPassVisible = false,
    this.isConPassVisible = false,
  });

  PasswordState copyWith({
    bool? isPassVisible,
    bool? isConPassVisible,
  }) {
    return PasswordState(
      isPassVisible: isPassVisible ?? this.isPassVisible,
      isConPassVisible: isConPassVisible ?? this.isConPassVisible,
    );
  }
}