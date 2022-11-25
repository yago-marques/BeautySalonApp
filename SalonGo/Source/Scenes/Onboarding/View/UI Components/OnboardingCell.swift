//
//  OnboardingCell.swift
//  SalonGo
//
//  Created by Yago Marques on 25/11/22.
//

import UIKit

final class OnboardingCell: UICollectionViewCell {
    private let text: UILabel = {
        let label = UILabel()
        label.text = "teste"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension OnboardingCell: ViewCoding {
    func setupView() {
        self.backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        self.addSubview(text)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
