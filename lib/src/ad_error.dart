/// To see the error code, see AdError.code.
/// To see a description of the error, see AdError.message.
/// See CODE constants for a list of error codes.
class AdError implements Comparable<int> {
  /// Indicates an internal error occurred.
  static const int codeInternalError = 0;

  /// Indicates that the device is rejected for services.
  /// Services may not be available for some devices that do not meet the requirements.
  /// For example, the country or version of the OS.
  static const int rejected = 2;

  /// Indicates that no ads are available to be served.
  /// If ads are visible in demo mode, your implementation is correct, and ads will be served once live.
  static const int codeNoFill = 3;

  /// Indicates that ads are not ready to be shown.
  /// Ensure to call the appropriate ad loading method or use automatic cache mode.
  /// If using automatic load mode, wait a little longer for ads to be ready.
  static const int codeNotReady = 1;

  /// Indicates that the ad creative has reached its daily cap for the user.
  /// This is typically relevant for cross-promotion ads only.
  static const int codeReachedCap = 6;

  /// Indicates that the CAS SDK is not initialized.
  /// Ensure to add CAS initialization code.
  static const int codeNotInitialized = 7;

  /// Indicates a timeout error occurred because the advertising source did not respond in time.
  /// The system will continue waiting for a response, which may delay ad loading or cause a loading error.
  static const int codeTimeout = 8;

  /// Indicates that there is no internet connection available, which prevents ads from loading.
  static const int codeNoConnection = 9;

  /// Indicates that there is a configuration error in one of the mediation ad sources.
  /// Report this error to your support manager for further assistance.
  static const int codeConfigurationError = 10;

  /// Indicates that the interval between impressions of interstitial ads has not yet passed.
  /// To change the interval, use the AdsSettings.interstitialInterval method.
  /// This error may also occur if a trial ad-free interval has been defined and has not yet passed since app start.
  static const int codeNotPassedInterval = 11;

  /// Indicates that another fullscreen ad is currently being displayed, preventing new ads from showing.
  /// Review your ad display logic to avoid duplicate impressions.
  static const int codeAlreadyDisplayed = 12;

  /// Indicates that ads cannot be shown because the application is not currently in the foreground.
  static const int codeNotForeground = 13;

  final int code;

  final String message;

  AdError(this.code, this.message);

  @override
  String toString() => message;

  @override
  int get hashCode => code;

  @override
  bool operator ==(Object other) {
    if (other is AdError) {
      return code == other.code;
    } else if (other is int) {
      return code == other;
    }
    return false;
  }

  @override
  int compareTo(int other) => code.compareTo(other);

  @Deprecated("Renamed to codeNotInitialized")
  static const int codeManagerIsDisabled = codeNotInitialized;

  @Deprecated("Renamed to codeNotPassedInterval")
  static const int codeIntervalNotYetPassed = codeNotPassedInterval;

  @Deprecated("Renamed to codeNotForeground")
  static const int codeAppIsPaused = codeNotForeground;

  @Deprecated("No longer used")
  static const int codeNotEnoughSpace = 1005;
}
