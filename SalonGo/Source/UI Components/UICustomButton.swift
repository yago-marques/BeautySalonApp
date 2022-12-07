//
//  UICustomButton.swift
//  SalonGo
//
//  Created by Yago Marques on 07/12/22.
//

import Foundation
import UIKit

class UICustomButton: UIButton {
    var title: String {
        didSet {
            self.setTitle(self.title, for: .normal)
        }
    }

    var radius: CGFloat {
        didSet {
            self.layer.cornerRadius = self.radius
        }
    }

    var font: (size: CGFloat, weight: UIFont.Weight) {
        didSet {
            self.titleLabel?.font = UIFont.systemFont(
                ofSize: self.font.size,
                weight: self.font.weight
            )
        }
    }

    var background: UIColor {
        didSet {
            self.backgroundColor = self.background
        }
    }

    init(
        title: String = "",
        radius: CGFloat = 10,
        font: (size: CGFloat, weight: UIFont.Weight) = (0, .bold),
        background: UIColor = UIColor(named: "Pink")!
    ) {
        self.title = title
        self.radius = radius
        self.font = font
        self.background = background
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension UICustomButton {
    func setupButton(
        title: String,
        radius: CGFloat = 10,
        font: (size: CGFloat, weight: UIFont.Weight),
        background: UIColor = UIColor(named: "Pink")!
    ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerCurve = .circular
        self.clipsToBounds = true
        self.title = title
        self.radius = radius
        self.font = font
        self.background = background
    }
}
