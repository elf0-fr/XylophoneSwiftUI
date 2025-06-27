//
//  XylophoneWidgetExtension.swift
//  XylophoneWidgetExtension
//
//  Created by Elfo on 25/06/2025.
//

import WidgetKit
import SwiftUI
import AppIntents

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [SimpleEntry] = [SimpleEntry(date: Date())]

        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct XylophoneWatchExtensionEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ContentView()
    }
}

struct XylophoneWidgetExtension: Widget {
    let kind: String = "XylophoneWidgetExtension"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            XylophoneWatchExtensionEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Play Xylophone")
        .description("Your Xylophone on your home screen.")
        .supportedFamilies([.systemLarge])
    }
}

#Preview(as: .systemLarge) {
    XylophoneWidgetExtension()
} timeline: {
    SimpleEntry(date: .now)
}
