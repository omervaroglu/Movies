//
//  MovieListViewController.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import UIKit

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MovieListViewModel! {
        didSet{
            viewModel.delegate = self
        }
    }
    private var movieList: [Result] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadDatas()
        registerTableView()
    }
    
    private func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(with: MoviesTableViewCell.className)
    }
}

//MARK: - MovieListViewModelDelegate
extension MovieListViewController: MovieListViewModelDelegate {
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .titleUpdate(let title):
            self.title = title
        case .showMovie(let movieList):
            self.movieList = movieList
            tableView.reloadData()
        }
    }
    
}

//MARK: - TableView Delegate & Datasource
extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
        let movie = movieList[indexPath.row]
        cell.configureCell(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
