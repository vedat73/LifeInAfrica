//
//  GalleryView.swift
//  LifeInAfrica
//
//  Created by Vedat Ozlu on 20.07.2023.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    @State private var selectedAnimal : String = "lion"
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    // SIMPLE GRID DEFINITION
    // let gridLayout : [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]
    // EFFICIENT GRID DEFINITION
    // let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridColumn : Double = 3.0
    
    // MARK: - FUNCTION
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            
            VStack {
                // MARK: - IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white,lineWidth: 8))
                    .padding(.vertical,10)
                // MARK: - SLIDER
                Slider(value : $gridColumn, in: 2...4, step : 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                    }
                // MARK: - GRID
                LazyVGrid(columns: gridLayout,alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white,lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }  //: LazyVGrid
                .animation(.easeIn)
                .onAppear {
                    //withAnimation(.easeIn(duration: 0.5)) {
                        gridSwitch()
                    //}
                }
            } //: VStack
            .padding(.horizontal,10)
            .padding(.vertical,50)
        } //: ScrollView
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
