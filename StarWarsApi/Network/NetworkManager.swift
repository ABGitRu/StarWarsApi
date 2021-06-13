//
//  NetworkManager.swift
//  StarWarsApi
//
//  Created by Mac on 13.06.2021.
//

import Alamofire

protocol UpdatesDelegate {
    func didFinishUpdates(finished: Bool)
}

class NetworkManager {
    
    static let shared = NetworkManager()
    var delegate: UpdatesDelegate?
    var data: Film?
    
    func fetchFilms() {
        let url = "https://swapi.dev/api/films"
        AF.request(url)
            .validate()
            .responseDecodable(of: Film.self) { (responce) in
                guard let items = responce.value else { return }
                self.data = items
                self.delegate?.didFinishUpdates(finished: true)
            }
    }
    
    private init() {}
}
