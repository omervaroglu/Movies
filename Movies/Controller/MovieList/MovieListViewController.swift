//
//  MovieListViewController.swift
//  Movies
//
//  Created by Ömer Faruk Varoğlu on 21.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MovieListViewModel! {
        didSet{
            viewModel.delegate = self
        }
    }
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadDatas()
    }
    
    private func registerTableView() {
        tableView.rowHeight = 150
        tableView.register(with: MoviesTableViewCell.className)
        
        viewModel.movies.asObservable().bind(to: tableView.rx.items(cellIdentifier: "MoviesTableViewCell", cellType: MoviesTableViewCell.self)) { row, element, cell in
                    cell.configureCell(movie: element)
                }
            .disposed(by: self.disposeBag)
        tableView.rx.modelSelected(Result.self).subscribe { [weak self] ( item ) in
            guard let self = self else { return }
            self.viewModel.selectItem(at: item)
        }
    }
}

//MARK: - MovieListViewModelDelegate
extension MovieListViewController: MovieListViewModelDelegate {
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .detail(let viewModel):
            let viewController = MovieDetailBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .titleUpdate(let title):
            self.title = title
        case .showMovie:
            registerTableView()
        }
    }
}

