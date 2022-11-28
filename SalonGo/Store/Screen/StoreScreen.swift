//
//  Store.swift
//  SalonGo
//
//  Created by Davi Capistrano on 28/11/22.
//

import UIKit

class StoreScreen: UIView {

    lazy var topImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Banner")
        return image
    }()

    lazy var nameCompanyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "💅 SALÃO DA IAIÁ"
        return label
    }()

    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "Rua Travessa Clemente, 234 - Maraponga"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.topImage)
        self.addSubview(self.nameCompanyLabel)
        self.addSubview(self.addressLabel)
        self.configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configConstraints(){
            NSLayoutConstraint.activate([
            self.topImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.topImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.topImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.nameCompanyLabel.topAnchor.constraint(equalTo: self.topImage.bottomAnchor, constant: 10),
            self.nameCompanyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.nameCompanyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.addressLabel.topAnchor.constraint(equalTo: self.nameCompanyLabel.bottomAnchor, constant: 5),
            self.addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.addressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
