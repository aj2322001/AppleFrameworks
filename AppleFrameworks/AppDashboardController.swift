//
//  AppDashboardController.swift
//  AppleFrameworks
//
//  Created by Archit  Joshi on 02/10/25.
//
import SwiftUI

final class AppDashboardController: ObservableObject {
    var selectedFramework: Framework? = nil {
        didSet {
            isPresented = (selectedFramework != nil)
        }
    }
    
    @Published var isPresented: Bool = false
}
