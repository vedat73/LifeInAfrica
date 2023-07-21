//
//  ContentView.swift
//  LifeInAfrica
//
//  Created by Vedat Ozlu on 20.07.2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var isGridViewActive : Bool = false
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    // let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Int = 1
    @State private var toolbarIcon : String = "square.grid.2x2"
    
    // MARK: - FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        // Toolbar Icon
        switch gridColumn {
            case 1 : toolbarIcon = "square.grid.2x2"
            case 2 : toolbarIcon = "square.grid.3x2"
            case 3 : toolbarIcon = "rectangle.grid.1x2"
            default: toolbarIcon = "square.grid.2x2"
        }
    }
    // MARK: - BODY
    var body: some View {
        NavigationStack {
                Group {
                    if !isGridViewActive {
                        //List
                        List {
                            CoverImageView()
                                .frame(height: 300)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalListItemView(animal: animal)
                                } // : NavigationLink
                            } //: ForEach
                            CreditsView()
                                .modifier(CenterModifier())
                        } //: List
                    } else {
                        // VGRID
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                                ForEach(animals) { item in
                                    NavigationLink {
                                        AnimalDetailView(animal: item)
                                    } label: {
                                        AnimalGridItemView(animal: item)
                                    }
                                } //: ForEach
                            } //: VGrid
                            .padding(10)
                            .animation(.easeIn)
                        } //: ScrollView
                    } //: Condition
                } //: Group
                .navigationTitle("Africa")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 16) {
                            // LIST
                            Button {
                                //listview activated
                                isGridViewActive = false
                                haptics.impactOccurred()
                            } label: {
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .primary : .accentColor)
                            }
                            // GRID
                            Button {
                                //grid activated
                                isGridViewActive = true
                                haptics.impactOccurred()
                                gridSwitch()
                            } label: {
                                Image(systemName: toolbarIcon)
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? .accentColor : .primary)
                            }
                        } //: HStack
                    } //: ToolbarItem
            } //: Toolbar
        } //: NavigationStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
