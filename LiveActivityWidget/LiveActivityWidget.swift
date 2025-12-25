//
//  LiveActivityWidget.swift
//  LiveActivityWidget
//
//  Created by Sanket Vaghela on 24/12/25.
//

import WidgetKit
import SwiftUI

import WidgetKit
import SwiftUI
import ActivityKit

struct LiveActivityWidget: Widget {

    var body: some WidgetConfiguration {
        
        ActivityConfiguration(for: LiveActivityWidgetAttributes.self) { context in
            EVChargingLiveActivityView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                
                DynamicIslandExpandedRegion(.leading) {
                    Text("🔋 \(context.state.batteryPercentage)%")
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    Text("⚡ \(context.state.chargingSpeed, specifier: "%.1f")kW")
                }

                DynamicIslandExpandedRegion(.bottom) {
                    Text("⏱ \(context.state.timeRemaining) min • 💰 ₹\(context.state.cost, specifier: "%.1f")")
                }

            } compactLeading: {
                Text("\(context.state.batteryPercentage)%")
            } compactTrailing: {
                Image(systemName: "bolt.fill")
            } minimal: {
                Image(systemName: "bolt.car")
            }

        }

    }
}
