//
//  EpisodeViewModel.swift
//  InterviewApp
//
//  Created by Ruchira  on 28/06/24.
//

import Foundation

class EpisodeViewModel {
    private var animeService : AnimeServiceProtocol
    private(set) var episodes:[Episode] = [] {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var reloadTableViewClosure: (() -> Void)?
    
    init(animeService : AnimeServiceProtocol = AnimeService()) {
        self.animeService = animeService
    }
    
    func fetchEpisodes() {
        animeService.fetchEpisodes { [weak self] result in
            switch result {
            case .success(let episodes):
                self?.episodes = episodes
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
