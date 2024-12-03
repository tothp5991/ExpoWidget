import ExpoModulesCore
import WidgetKit

public class WidgetRefreshModule: Module {
  public func definition() -> ModuleDefinition {
    Name("WidgetRefresh")

    // Method to refresh all timelines
    AsyncFunction("reloadAllTimelines") {
      // Ensure compatibility with iOS 14.0 or newer
      if #available(iOS 14.0, *) {
        WidgetCenter.shared.reloadAllTimelines()
      } else {
        throw NSError(
          domain: "WidgetRefreshError",
          code: 1,
          userInfo: [NSLocalizedDescriptionKey: "WidgetCenter is not available on this iOS version."]
        )
      }
    }
  }
}