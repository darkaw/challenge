//
//  photo.swift
//  Challenge
//
//  Created by Darkaw on 22/10/20.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
