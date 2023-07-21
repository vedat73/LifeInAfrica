//
//  VideoModel.swift
//  LifeInAfrica
//
//  Created by Vedat Ozlu on 20.07.2023.
//

import Foundation

struct Video : Codable, Identifiable {
    let id : String
    let name : String
    let headline : String
    
    // Computed property
    var thumbnail : String {
        "video-\(id)"
    }
}
