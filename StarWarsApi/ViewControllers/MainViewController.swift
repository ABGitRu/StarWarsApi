//
//  MainViewController.swift
//  StarWarsApi
//
//  Created by Mac on 13.06.2021.
//

import UIKit
import Alamofire

class MainViewController: UITableViewController {
    
    private var films = NetworkManager.shared
    private var selectedFilm: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        films.delegate = self
        films.fetchFilms()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.data?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        
        guard let film = films.data?.results[indexPath.row] else { return cell }
        cell.textLabel?.text = film.title
        cell.detailTextLabel?.text = "Episode \(String(film.episodeID))"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedFilm = films.data?.results[indexPath.row]
        return indexPath
    }
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? DetailViewController else { return }
        dvc.details = selectedFilm
     }
    
}
extension MainViewController: UpdatesDelegate {
    func didFinishUpdates(finished: Bool) {
        if finished {
            self.tableView.reloadData()
        }
    }
    
    
}
