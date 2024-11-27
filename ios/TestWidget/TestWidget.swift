import WidgetKit
import SwiftUI

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
        let appGroupID = "group.com.peterarontoth.ExpoWidget"
        let sharedDefaults = UserDefaults(suiteName: appGroupID)
        // Get the count from the shared defaults
        let count = sharedDefaults?.integer(forKey: "count") ?? 0

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
        }
        .containerBackground(Color(red: 0.1137, green: 0.1059, blue: 0.1137), for: .widget)
    }
}

struct TestWidget: Widget {
    let kind: String = "TestWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TestWidgetEntryView(entry: entry)
        }
    }
}

#Preview(as: .systemSmall) {
    TestWidget()
} timeline: {
    SimpleEntry(date: Date(), count: 0)
}
