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
    var body: some View {
        return VStack {
            
            HStack {
                Spacer()
                Button {
                    showDetailsScreen = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }

            }
            .padding()
            
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
                
            } label: {
                ButtonView(
                    title: "Learn More"
                )
            }
        }
        .padding()
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
