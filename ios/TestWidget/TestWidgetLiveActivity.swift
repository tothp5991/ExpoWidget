//
//  TestWidgetLiveActivity.swift
//  TestWidget
//
//  Created by Péter Áron Tóth on 27/11/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct TestWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct TestWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TestWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension TestWidgetAttributes {
    fileprivate static var preview: TestWidgetAttributes {
        TestWidgetAttributes(name: "World")
    }
}

extension TestWidgetAttributes.ContentState {
    fileprivate static var smiley: TestWidgetAttributes.ContentState {
        TestWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: TestWidgetAttributes.ContentState {
         TestWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: TestWidgetAttributes.preview) {
   TestWidgetLiveActivity()
} contentStates: {
    TestWidgetAttributes.ContentState.smiley
    TestWidgetAttributes.ContentState.starEyes
}
