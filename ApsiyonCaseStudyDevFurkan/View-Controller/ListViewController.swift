//
//  ListViewController.swift
//  ApsiyonCaseStudyDevFurkan
//
//  Created by Furkan Yıldız on 19.12.2021.
//

import UIKit

class ListViewController: UIViewController {
    
    private let viewModel = ListViewModel()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let pageControl = UIPageControl()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func initViewController() {
        setBackgroundColor()
        createTableView()
//        createSpinerFooter()
        bindTableView()
        bindTapActions()
    }
    
    private func setBackgroundColor(){
        self.view.backgroundColor = .systemBackground
        title = Strings.shared.popularMovies
        
    }
    
    private func createTableView(){
        view.addSubview(tableView)
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        tableView.rowHeight = 140
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: "MovieListTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
//    private func createSpinerFooter() -> UIView {
//        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
//        let spinner = UIActivityIndicatorView()
//        spinner.center = footerView.center
//        footerView.addSubview(spinner)
//        spinner.startAnimating()
//        return spinner
//    }
    
    
    private func bindTableView(){
        viewModel.popularMoviesCompletion = {
            [weak self] in
//            self?.tableView.reloadData()
            DispatchQueue.main.async {
                self?.tableView.reloadData()

            }
        }
    }
    
    private func bindTapActions(){
        viewModel.tapCellCompletion = {[weak self]
            (movieId) in
            guard let id = movieId else {return}
            let detailVC = MovieDetailViewController(movieId: id)
            self?.show(detailVC, sender: self)
        }
    }

}
