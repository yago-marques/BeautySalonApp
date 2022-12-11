//
//  OnboardingCell.swift
//  SalonGo
//
//  Created by Yago Marques on 25/11/22.
//

import UIKit
import Lottie

struct OnboardingViewModel {
    let animation: String
    let title: String
    let subtitle: String
}

final class OnboardingCell: UICollectionViewCell {

    var viewModel: OnboardingViewModel = .init(animation: "", title: "", subtitle: "") {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.animation.animation = LottieAnimation.named(self.viewModel.animation)
                self.title.text = self.viewModel.title
                self.subtitle.text = self.viewModel.subtitle
                self.animation.play()
            }
        }
    }

    lazy var animation: LottieAnimationView = {
        let animationView = LottieAnimationView(animation: LottieAnimation.named(self.viewModel.animation))
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.backgroundColor = .clear
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop

        return animationView
    }()

    private lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center

        return label
    }()

    private lazy var subtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .secondaryLabel

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

    }

    func setupHierarchy() {
        let views: [UIView] = [
            animation,
            title,
            subtitle
        ]

        views.forEach { self.addSubview($0) }
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            animation.topAnchor.constraint(equalTo: self.topAnchor),
            animation.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            animation.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            animation.heightAnchor.constraint(equalTo: animation.widthAnchor),

            title.topAnchor.constraint(equalToSystemSpacingBelow: animation.bottomAnchor, multiplier: 5),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            title.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),

            subtitle.topAnchor.constraint(equalToSystemSpacingBelow: title.bottomAnchor, multiplier: 2),
            subtitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subtitle.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
        ])
    }
}
