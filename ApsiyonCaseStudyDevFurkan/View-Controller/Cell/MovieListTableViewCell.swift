//
//  MovieListTableViewCell.swift
//  ApsiyonCaseStudyDevFurkan
//
//  Created by Furkan Yıldız on 19.12.2021.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    private let thumbnailImageView = UIImageView()
    private let rightArrowImageView = UIImageView(image: UIImage(named: "rightArrow"))
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let voteLabel = UILabel()
    private let image1Attachment = NSTextAttachment()

    let viewModel = MovieListTableViewCellViewModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.selectionStyle = .none
        createThumbnailImageView()
        createRightArrowImageView()
        createTitleLabel()
        createDateLabel()
        createVoteLabel()
        bindData()
    }
    
    private func createThumbnailImageView() {
        thumbnailImageView.layer.cornerRadius = 9
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.contentMode = .scaleAspectFill
        self.contentView.addSubview(thumbnailImageView)
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thumbnailImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            thumbnailImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 120),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 90)
        
        ])
    }
    
    private func createRightArrowImageView() {
        self.contentView.addSubview(rightArrowImageView)
        rightArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightArrowImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -10),
            rightArrowImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            rightArrowImageView.heightAnchor.constraint(equalToConstant: 20),
            rightArrowImageView.widthAnchor.constraint(equalToConstant: 10)
        
        ])
    }
    
    private func createTitleLabel() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.contentView.addSubview(titleLabel)
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.thumbnailImageView.centerYAnchor, constant: -2),
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: rightArrowImageView.leadingAnchor, constant: -5)
        ])
    }
    
    private func createDateLabel() {
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .lightGray
        self.contentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3)
        ])
    }
    
    private func createVoteLabel() {
        voteLabel.font = .systemFont(ofSize: 14)
        voteLabel.textColor = .red
        image1Attachment.image = UIImage(named: "rightArrow")
        self.contentView.addSubview(voteLabel)
        voteLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voteLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            voteLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,constant: 3)
        ])
    }
   
    private func bindData(){
        viewModel.dataSettedCompletion = {
            [weak self] (url, title, date, vote) in
            self?.updateUI(url: url, title: title, date: date, vote: vote)
        }
    }
    
    private func updateUI(url: String, title: String, date: String, vote: Double){
        updateImageView(url: url)
        updateTitleLabel(title: title, date: date)
        updateDateLabel(date: date)
        updateVoteLabel(vote: vote)
        
    }
    
    private func updateImageView(url:String) {
        SetImageHandler.setImage(path: url, imageView: thumbnailImageView)
    }
    
    private func updateTitleLabel(title:String, date:String) {
        titleLabel.text = "\(title)"
    }
    
    private func updateDateLabel(date: String) {
        let dateComponents = date.split(separator: "-")
        let year = dateComponents.first ?? ""
        dateLabel.text = "\(year)"
    }
    
    private func updateVoteLabel(vote: Double) {
        if vote > 9 {
            voteLabel.textColor = .systemGreen
            voteLabel.text = "Nice - \(vote) / 10"
        } else if vote >= 7 && vote <= 9 {
            voteLabel.textColor = .systemOrange
            voteLabel.text = "Good - \(vote) / 10"
        } else {
            voteLabel.textColor = .red
            voteLabel.text = "Avareage - \(vote) / 10 "
        }
        
    }
    
    
    
    



}
