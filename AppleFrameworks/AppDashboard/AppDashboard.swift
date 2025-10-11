//
//  ContentView.swift
//  AppleFrameworks
//
//  Created by Archit  Joshi on 27/09/25.
//

import SwiftUI

struct AppDashboard: View {
    var controller = AppDashboardController()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns: controller.columns,
                    content: {
                        ForEach(MockData.frameworks, id: \.id) { framework in
                            NavigationLink {
                                FrameworkDetails(framework: framework)
                            } label: {
                                FrameworkTitleView(framework: framework)
                            }
                        }
                    }
                )
            }
            .navigationTitle("🍎 Frameworks")
        }
    }
}

#Preview {
    AppDashboard()
}
