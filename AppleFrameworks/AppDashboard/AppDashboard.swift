//
//  ContentView.swift
//  AppleFrameworks
//
//  Created by Archit  Joshi on 27/09/25.
//

import SwiftUI

struct AppDashboard: View {
    @StateObject var controller = AppDashboardController()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(
                    columns: controller.columns,
                    content: {
                        ForEach(MockData.frameworks, id: \.id) { framework in
                            FrameworkTitleView(framework: framework)
                                .onTapGesture { controller.selectedFramework = framework }
                        }
                    }
                )
            }
            .navigationTitle("🍎 Frameworks")
        }
        .sheet(
            isPresented: $controller.isPresented,
            onDismiss: {  controller.selectedFramework = nil },
            content: {
                FrameworkDetails(
                    framework: controller.selectedFramework ?? MockData.sampleFramework,
                    showDetailsScreen: $controller.isPresented
                )
            }
        )
    }
}

#Preview {
    AppDashboard()
}
