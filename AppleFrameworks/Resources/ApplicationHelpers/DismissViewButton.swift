//
//  DismissViewButton.swift
//  AppleFrameworks
//
//  Created by Archit  Joshi on 05/10/25.
//

import SwiftUI

struct DismissViewButton: View {
    var buttonAction: (()->())?
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                buttonAction?()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }

        }
        .padding()
    }
}
