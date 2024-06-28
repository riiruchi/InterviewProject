//
//  EpisodeTableViewCell.swift
//  InterviewApp
//
//  Created by Ruchira  on 28/06/24.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    static let identifier = "EpisodeTableViewCell"
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let urlLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14,weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scoreLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(urlLabel)
        contentView.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            urlLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            urlLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 10),
            urlLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            scoreLabel.topAnchor.constraint(equalTo: urlLabel.bottomAnchor, constant: 5),
            scoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 10),
            scoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            scoreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with episode :Episode) {
        titleLabel.text = episode.title
        urlLabel.text = episode.url
        scoreLabel.text = "Score: \(episode.score ?? 0.0)"
    }

}
