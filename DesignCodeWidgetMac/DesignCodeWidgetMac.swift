//
//  DesignCodeWidgetMac.swift
//  DesignCodeWidgetMac
//
//  Created by Alex on 14/01/2021.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct DesignCodeWidgetMacEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Newest")
                .font(Font.footnote.smallCaps())
                .foregroundColor(.secondary)
            
            ForEach(courseSections.indices) { index in
                if index < 2{
                    CourseRow(item: courseSections[index])
                }
            }
        }
        .padding(12)
    }
}

@main
struct DesignCodeWidgetMac: Widget {
    let kind: String = "DesignCodeWidgetMac"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            DesignCodeWidgetMacEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct DesignCodeWidgetMac_Previews: PreviewProvider {
    static var previews: some View {
        DesignCodeWidgetMacEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
