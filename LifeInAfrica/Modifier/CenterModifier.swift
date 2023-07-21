//
//  CenterModifier.swift
//  LifeInAfrica
//
//  Created by Vedat Ozlu on 21.07.2023.
//

import SwiftUI

struct CenterModifier : ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
