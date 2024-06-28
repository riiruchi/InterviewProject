//
//  Episode.swift
//  InterviewApp
//
//  Created by Ruchira  on 28/06/24.
//

import Foundation

struct Episode: Codable {
    let url : String
    let title : String
    let score : Double?
}

struct EpisodeResponse : Codable {
    let data : [Episode]
}
