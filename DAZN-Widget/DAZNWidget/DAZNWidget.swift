//
//  DAZNWidget.swift
//  DAZNWidget
//
//  Created by Mariano Piscitelli on 23/03/22.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

//        let timeline = Timeline(entries: entries, policy: .atEnd)
        let timeline = Timeline(entries: entries, policy: .after(.now.advanced(by: 1)))
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct DAZNWidgetEntryView : View {
    var entry: Provider.Entry
    
    @State private var showWebView = false
    @State private var selectedURL: URL?
    
    func countDownString(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: referenceDate)
        return String(format: "%02d:%02d:%02d",
                      //                       components.day ?? 00,
                      components.hour ?? 00,
                      components.minute ?? 00,
                      components.second ?? 00)
    }
    
    @State var nowDate: Date = Date()
    let referenceDate: Date = Date() + 10000
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    let lightGreyColor = Color(red: 8.0/255.0, green: 23.0/255.0, blue: 29.0/255.0, opacity: 1.0)

    var body: some View {
        
        ZStack{
            
            Image("partita3")
                .resizable()
                .scaledToFit()
                .scaleEffect(1.2)
                .frame(width: UIScreen.main.bounds.width*0.880, height: UIScreen.main.bounds.height*0.192)
                .overlay(LinearGradient(gradient: Gradient(colors: [.white.opacity(0),.gray.opacity(0), .black.opacity(0), .black.opacity(0), .black.opacity(0.2), .black.opacity(0.45)]), startPoint: .top, endPoint: .bottom))
            
            Text(countDownString(from: referenceDate))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .font(.system(size:24))
                .padding(.bottom, 30)
            
            Text("20:45")
                .fontWeight(.regular)
                .foregroundColor(.white)
                .font(.system(size: 12, weight: .regular, design: .rounded))
                .padding(.top, 20)
            
            Text("ATALANTA - MILAN")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .font(.system(size: 12, weight: .regular, design: .rounded))
                .padding(.top, 85)
                .padding(.trailing, 205)
            
            Text("Serie A")
                .fontWeight(.light)
                .foregroundColor(.white)
                .font(.system(size: 11, weight: .regular, design: .rounded))
                .padding(.top, 120)
                .padding(.trailing, 281)
        }
        .frame(width: UIScreen.main.bounds.width*0.880, height: UIScreen.main.bounds.height*0.192)
        
    }
}

@main
struct DAZNWidget: Widget {
    let kind: String = "DAZNWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DAZNWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct DAZNWidget_Previews: PreviewProvider {
    static var previews: some View {
        DAZNWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
