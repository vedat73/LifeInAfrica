//
//  VideoPlayerView.swift
//  LifeInAfrica
//
//  Created by Vedat Ozlu on 20.07.2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    var selectedVideoName : String
    var videoTitle : String
    // MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(
                player: playVideo(fileName: selectedVideoName, fileFormat: "mp4")
            ){
               // Text(videoTitle)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32,height: 32)
                    .padding(.top,6)
                    .padding(.horizontal,8)
                ,alignment: .topLeading)
        } //: VStack
        .tint(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(selectedVideoName: "lion", videoTitle: "Lion")
        }
    }
}
