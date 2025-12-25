//
//  EVChargingLiveActivityView.swift
//  LiveActivitiesDemo
//
//  Created by Sanket Vaghela on 25/12/25.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct EVChargingLiveActivityView: View {
    let context: ActivityViewContext<LiveActivityWidgetAttributes>

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(context.attributes.vehicleID)
                .font(.headline)

            ProgressView(
                value: Double(context.state.batteryPercentage),
                total: 100
            )

            HStack {
                Text("🔋 \(context.state.batteryPercentage)%")
                Spacer()
                Text("⚡ \(context.state.chargingSpeed, specifier: "%.1f") kW")
            }

            HStack {
                Text("⏱ \(context.state.timeRemaining) min left")
                Spacer()
                Text("💰 ₹\(context.state.cost, specifier: "%.2f")")
            }

            Text(context.state.status.rawValue.capitalized)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

//#Preview {
//    EVChargingLiveActivityView()
//}
