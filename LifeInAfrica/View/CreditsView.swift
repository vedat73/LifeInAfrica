//
//  CreditsView.swift
//  LifeInAfrica
//
//  Created by Vedat Ozlu on 21.07.2023.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTIES
    // MARK: - BODY
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128,height: 128)
            Text("""
                Copyright © Vedat OZLU
                All right reserved
                Better Apps Less Code
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VStack
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
