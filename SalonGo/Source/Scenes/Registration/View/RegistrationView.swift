//
//  RegistrationView.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 30/11/22.
//

import UIKit

protocol RegistrationViewDelegate: AnyObject {
    func showRegistration()
    func didTapConfirmButton()
}

class RegistrationView: UIView {
    private var delegate: RegistrationViewDelegate?

    private lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.text = "Sua identificação"
        label.textAlignment = .center
        label.textColor = UIColor(named: "Pink") ?? UIColor.black

        return label
    }()

    private lazy var subtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.text = """
                    Não se preocupe! Seus dados serão utilizados
                    apenas para caso de agendamento,ajudando a
                    comunicação entre você e o estabelecimento.
                    """
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "OffBlack") ?? UIColor.black

        return label
    }()

    private lazy var nameTF: PeepTextField = {
        let textfield = PeepTextField(placeholder: "Nome")
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.maskType = .none

        return textfield
    }()

    private lazy var telephoneNumberTF: PeepTextField = {
        let textField = PeepTextField(placeholder: "Telefone (somente números)")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.maskType = .cellphone

        return textField
    }()

    private lazy var confirmButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "Pink")
        button.setTitle("Confirmar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 9
        button.clipsToBounds = true
        button.addTarget(
            self,
            action: #selector(didTapConfirmButtonTarget),
            for: .touchUpInside
        )

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    @objc func didTapConfirmButtonTarget() {
        delegate?.didTapConfirmButton()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension RegistrationView: RegistrationViewDelegate {
    func didTapConfirmButton() {
        print("size 1: \(nameTF.textFieldContentSize())")
        if nameTF.textFieldContentSize() <= 0 {
            print("size 2: \(nameTF.textFieldContentSize())")
        }
    }

    func showRegistration() {
        buildLayout()
    }
}

extension RegistrationView: ViewCoding {
    func setupView() {
        self.backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        let views: [UIView] = [
            title,
            subtitle,
            nameTF,
            telephoneNumberTF,
            confirmButton
        ]
        views.forEach { self.addSubview($0) }
    }

    func setupConstraints() {
        titleConstraints()
        subtitleConstraints()
        nameTFConstraints()
        telephoneNumberTFConstraints()
        confirmButtonConstraints()
    }

    func titleConstraints() {
        NSLayoutConstraint.activate([
            self.title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }

    func subtitleConstraints() {
        NSLayoutConstraint.activate([
            self.subtitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.subtitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 10)
        ])
    }

    func nameTFConstraints() {
        NSLayoutConstraint.activate([
            self.nameTF.topAnchor.constraint(equalTo: self.subtitle.bottomAnchor, constant: 50),
            self.nameTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.nameTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.nameTF.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func telephoneNumberTFConstraints() {
        NSLayoutConstraint.activate([
            self.telephoneNumberTF.topAnchor.constraint(equalTo: self.nameTF.bottomAnchor, constant: 10),
            self.telephoneNumberTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.telephoneNumberTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.telephoneNumberTF.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func confirmButtonConstraints() {
        NSLayoutConstraint.activate([
            self.confirmButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.confirmButton.heightAnchor.constraint(equalToConstant: 50),
            self.confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.confirmButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ])
    }
}
