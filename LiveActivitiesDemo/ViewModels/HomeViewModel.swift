//
//  HomeViewModel.swift
//  LiveActivitiesDemo
//
//  Created by Sanket Vaghela on 25/12/25.
//


import ActivityKit
import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    

    private var activity: Activity<LiveActivityWidgetAttributes>?

    func startCharging() {
        let attributes = LiveActivityWidgetAttributes(
            stationName: "Tata EV Station",
            vehicleID: "Tata Sierra"
        )

        let initialState = LiveActivityWidgetAttributes.ContentState(
            batteryPercentage: 20,
            chargingSpeed: 45.0,
            timeRemaining: 40,
            cost: 120.0,
            status: .charging
        )

        do {
            let authInfo = ActivityAuthorizationInfo()
            print("areActivitiesEnabled =", authInfo.areActivitiesEnabled)

            activity = try Activity.request(
                attributes: attributes,
                content: ActivityContent(state: initialState, staleDate: nil)
                //pushType: .token // For remotely updates using APNs
            )
        } catch {
            print("Failed to start activity:", error)
        }
    }

    func updateCharging() async {
        guard let activity else { return }

        let updatedState = LiveActivityWidgetAttributes.ContentState(
            batteryPercentage: 70,
            chargingSpeed: 30.5,
            timeRemaining: 15,
            cost: 260.0,
            status: .almostCharged
        )

        await activity.update(
            ActivityContent(state: updatedState, staleDate: nil)
        )
    }

    func endCharging() async {
        guard let activity else { return }

        let finalState = LiveActivityWidgetAttributes.ContentState(
            batteryPercentage: 100,
            chargingSpeed: 0,
            timeRemaining: 0,
            cost: 320,
            status: .completed
        )

        await activity.end(
            ActivityContent(state: finalState, staleDate: nil),
            dismissalPolicy: .immediate
        )
    }
}
