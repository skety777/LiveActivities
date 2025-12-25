//
//  HomeView.swift
//  LiveActivitiesDemo
//
//  Created by Sanket Vaghela on 25/12/25.
//

import SwiftUI

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        VStack(spacing: 20) {

            Button("Start Charging") {
                viewModel.startCharging()
            }

            Button("Update Charging") {
                Task { await viewModel.updateCharging() }
            }

            Button("End Charging") {
                Task { await viewModel.endCharging() }
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
