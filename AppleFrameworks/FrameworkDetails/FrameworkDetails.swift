//
//  FrameworkDetails.swift
//  AppleFrameworks
//
//  Created by Archit  Joshi on 02/10/25.
//
import SwiftUI

struct FrameworkDetails: View {
    let framework: Framework
    @Binding var showDetailsScreen: Bool
    @State var isSafariScreenPresented: Bool = false
    var body: some View {
        return VStack {
            
            DismissViewButton(showViewScreen: $showDetailsScreen) {
                showDetailsScreen = false
            }
            
            Spacer()
            
            ScrollView {
                VStack(spacing: 24) {
                    FrameworkTitleView(framework: framework)
                    Text(framework.description)
                        .font(.body)
                        .padding()
                }
            }
            
            Spacer()
            
            Button {
                isSafariScreenPresented = true
            } label: {
                ButtonView(
                    title: "Learn More"
                )
            }
        }
        .padding()
        .fullScreenCover(
            isPresented: $isSafariScreenPresented) {
                if let safariUrl = URL(string: framework.urlString) {
                    SafariView(url: safariUrl)
                }
            }
    }
}

#Preview {
    FrameworkDetails(framework: MockData.sampleFramework, showDetailsScreen: .constant(false))
}

struct ButtonView: View {
    var title: String
    var textColor: Color = .white.opacity(0.7)
    var backgroundColor: Color = Color.red
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280,height: 50)
            .background(backgroundColor.gradient)
            .foregroundStyle(textColor)
            .cornerRadius(10)
    }
}
