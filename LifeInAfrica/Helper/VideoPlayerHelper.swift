//
//  VideoPlayerHelper.swift
//  LifeInAfrica
//
//  Created by Vedat Ozlu on 20.07.2023.
//

import Foundation
import AVKit

var videoPlayer : AVPlayer?

func playVideo(fileName : String,fileFormat : String) -> AVPlayer? {
    if let videoUrl = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: videoUrl)
        videoPlayer?.play()
        return videoPlayer!
    } else {
        return nil
    }
}
