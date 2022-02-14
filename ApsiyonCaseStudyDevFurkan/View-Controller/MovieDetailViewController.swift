//
//  MovieDetailViewController.swift
//  ApsiyonCaseStudyDevFurkan
//
//  Created by Furkan Yıldız on 19.12.2021.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private var viewModel: MovieDetailViewModel!
    
    init(movieId: Int?) {
        super.init(nibName: nil, bundle: nil)
        viewModel = MovieDetailViewModel(movieId: movieId)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    
    private func setupUI(){
        setBackgroundColor()
        createImageView()
        createTitleLabel()
        bindMovieDetailData()
    }
    
    private func setBackgroundColor(){
        self.view.backgroundColor = .systemBackground
    }
    
    private func createImageView(){
        self.view.addSubview(imageView)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.height/3)
        ])
    }
    
    private func createTitleLabel(){
        self.view.addSubview(titleLabel)
        titleLabel.font = .boldSystemFont(ofSize: 21)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 20)
        ])
    }
    
    private func bindMovieDetailData(){
        viewModel.movieDetailCompletion = {
            [weak self] (path, title)in
            self?.updateUI(path: path, title: title)
        }
    }
    
    
    private func updateUI(path: String, title: String){
        updateImageView(path: path)
        updateTitle(title: title)
    }
    
    private func updateImageView(path: String){
        SetImageHandler.setImage(path: path, imageView: imageView)
    }
    
    private func updateTitle(title: String){
        titleLabel.text = title
    }



}
