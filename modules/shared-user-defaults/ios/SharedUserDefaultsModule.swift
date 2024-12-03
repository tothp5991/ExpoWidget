import ExpoModulesCore

public class SharedUserDefaultsModule: Module {
  public func definition() -> ModuleDefinition {
    Name("SharedUserDefaults")

    // Method to set data in UserDefaults for the app group
    AsyncFunction("setDataInSharedUserDefaults") { (value: Int, key: String) in
      let appGroupID = "group.com.peterarontoth.ExpoWidget" // Replace with your App Group ID
      if let sharedDefaults = UserDefaults(suiteName: appGroupID) {
        sharedDefaults.set(value, forKey: key)
        sharedDefaults.synchronize()
      }
    }

    // Method to get data from UserDefaults in the app group
    AsyncFunction("getDataFromSharedUserDefaults") { (key: String) -> String? in
      let appGroupID = "group.com.peterarontoth.ExpoWidget" // Replace with your App Group ID
      let sharedDefaults = UserDefaults(suiteName: appGroupID)
      return sharedDefaults?.string(forKey: key)
    }

    // Method to remove data from UserDefaults in the app group
    AsyncFunction("removeDataFromSharedUserDefaults") { (key: String) in
      let appGroupID = "group.com.peterarontoth.ExpoWidget" // Replace with your App Group ID
      if let sharedDefaults = UserDefaults(suiteName: appGroupID) {
        sharedDefaults.removeObject(forKey: key)
        sharedDefaults.synchronize()
      }
    }
  }
}