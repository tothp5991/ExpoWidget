import WidgetKit
import SwiftUI
import AppIntents

struct IncrementCounter: AppIntent {
    static var title: LocalizedStringResource = "Increment Counter"

    func perform() async throws -> some IntentResult {
        let appGroupID = "group.com.peterarontoth.ExpoWidget" // Replace with your App Group ID
        let sharedDefaults = UserDefaults(suiteName: appGroupID)
        let count = sharedDefaults?.integer(forKey: "counter") ?? 0
        sharedDefaults?.set(count + 1, forKey: "counter")
        if #available(iOS 14.0, *) {
            WidgetCenter.shared.reloadAllTimelines() // Refresh widget if needed
        }
        return .result()
    }
}

struct DecrementCounter: AppIntent {
    static var title: LocalizedStringResource = "Decrement Counter"

    func perform() async throws -> some IntentResult {
        let appGroupID = "group.com.peterarontoth.ExpoWidget" // Replace with your App Group ID
        let sharedDefaults = UserDefaults(suiteName: appGroupID)
        let count = sharedDefaults?.integer(forKey: "counter") ?? 0
        sharedDefaults?.set(count - 1, forKey: "counter")
        if #available(iOS 14.0, *) {
            WidgetCenter.shared.reloadAllTimelines() // Refresh widget if needed
        }
        return .result()
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), count: 0)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), count: 0)
        completion(entry)
    }
  
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        var entries: [SimpleEntry] = []
        let appGroupID = "group.com.peterarontoth.ExpoWidget" // Replace with your App Group ID
        let sharedDefaults = UserDefaults(suiteName: appGroupID)
        let count = sharedDefaults?.integer(forKey: "counter") ?? 0
        let entry = SimpleEntry(date: Date(), count: count)
        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let count: Int
}

struct TestWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Count:")
            Text("\(entry.count)")
            HStack(spacing: 16) {
                DecrementButton()
                IncrementButton()
            }
        }
        .containerBackground(Color(red: 0.1137, green: 0.1059, blue: 0.1137), for: .widget)
    }
}

struct IncrementButton: View {
    var body: some View {
        Button("+", intent: IncrementCounter())
        .foregroundColor(.white)
        .frame(width: 56, height: 56)
        .background(Color(red: 0.2, green: 0.2, blue: 0.2))
        .cornerRadius(28)
        .font(.system(size: 14, weight: .bold))
        .buttonStyle(PlainButtonStyle())
    }
}

struct DecrementButton: View {
    var body: some View {
        Button("-", intent: DecrementCounter())
        .foregroundColor(.white)
        .frame(width: 56, height: 56)
        .background(Color(red: 0.2, green: 0.2, blue: 0.2))
        .cornerRadius(28)
        .font(.system(size: 14, weight: .bold))
        .buttonStyle(PlainButtonStyle())
    }
}

struct TestWidget: Widget {
    let kind: String = "TestWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TestWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Test Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    TestWidget()
} timeline: {
    SimpleEntry(date: Date(), count: 0)
}
