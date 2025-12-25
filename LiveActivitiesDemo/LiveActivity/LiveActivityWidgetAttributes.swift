//
//  LiveActivityWidgetLiveActivity.swift
//  LiveActivityWidget
//
//  Created by Sanket Vaghela on 24/12/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LiveActivityWidgetAttributes: ActivityAttributes {
    
    //dynamic properties (they change over time)
    public struct ContentState: Codable, Hashable {
        var batteryPercentage:Int
        var chargingSpeed:Double
        var timeRemaining:Int
        var cost:Double
        var status:ChargingStatus
    }

    // fixed properties (non-changing)
    var stationName: String
    var vehicleID: String
    
    enum ChargingStatus:String , Codable, Hashable{
        case preparing
        case charging
        case almostCharged
        case completed
    }
}




