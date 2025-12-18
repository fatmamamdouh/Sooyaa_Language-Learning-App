class SelectionState {
  final int? selectedLanguageIndex;
  final int? selectedLevelIndex;
  final int? selectedWhyIndex;
  final int? selectedZoneIndex;
  final int? selectedOldIndex;

  final String? selectedLanguage;
  final String? selectedLevel;
  final String? selectedWhy;
  final String? selectedZone;
  final String? selectedOld;

  SelectionState({
    this.selectedLanguageIndex,
    this.selectedLevelIndex,
    this.selectedWhyIndex,
    this.selectedZoneIndex,
    this.selectedOldIndex,
    this.selectedLanguage,
    this.selectedLevel,
    this.selectedWhy,
    this.selectedZone,
    this.selectedOld,
  });

  SelectionState copyWith({
    int? selectedLanguageIndex,
    int? selectedLevelIndex,
    int? selectedWhyIndex,
    int? selectedZoneIndex,
    int? selectedOldIndex,
    String? selectedWhy,
    String? selectedOld,
    String? selectedLanguage,
    String? selectedLevel,
    String? selectedZone,
  }) {
    return SelectionState(
      selectedLanguageIndex:
          selectedLanguageIndex ?? this.selectedLanguageIndex,
      selectedLevelIndex: selectedLevelIndex ?? this.selectedLevelIndex,
      selectedWhyIndex: selectedWhyIndex ?? this.selectedWhyIndex,
      selectedZoneIndex: selectedZoneIndex ?? this.selectedZoneIndex,
      selectedOldIndex: selectedOldIndex ?? this.selectedOldIndex,
      selectedWhy: selectedWhy ?? this.selectedWhy,
      selectedOld: selectedOld ?? this.selectedOld,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      selectedLevel: selectedLevel ?? this.selectedLevel,
      selectedZone: selectedZone ?? this.selectedZone,
    );
  }
}
