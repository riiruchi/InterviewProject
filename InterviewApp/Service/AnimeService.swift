//
//  AnimeService.swift
//  InterviewApp
//
//  Created by Ruchira  on 28/06/24.
//

import Foundation

protocol AnimeServiceProtocol {
    func fetchEpisodes(completion : @escaping (Result<[Episode], Error>) -> Void)
}

class AnimeService : AnimeServiceProtocol {
    private let urlString = "https://api.jikan.moe/v4/anime/1/episodes"
    
    func fetchEpisodes(completion: @escaping (Result<[Episode], any Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do{
                let episodesResponse = try JSONDecoder().decode(EpisodeResponse.self, from: data)
                completion(.success(episodesResponse.data))
            }catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
