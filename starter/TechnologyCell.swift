//
//  TechnologyCell.swift
//  starter
//
//  Created by Olawale Ipadeola on 3/28/22.
//

import UIKit

class TechnologyCell: UICollectionViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let personCount: UILabel = {
        let count = UILabel()
        count.translatesAutoresizingMaskIntoConstraints = false
        count.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        count.textColor = .white
        return count
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = 20
        backgroundColor = .purple
        addSubview(nameLabel)
        addSubview(personCount)
        
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            personCount.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            personCount.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            personCount.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    func configureWith(_ technology: Technology) {
        nameLabel.text = technology.name
        personCount.text = " numberOfCapableHumans: \(technology.numberOfCapableHumans) "
    }
    
    
}
