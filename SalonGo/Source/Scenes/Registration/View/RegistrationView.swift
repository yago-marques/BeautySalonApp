//
//  RegistrationView.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 30/11/22.
//

import UIKit

protocol RegistrationViewDelegate: AnyObject {
    func showRegistration()
}

class RegistrationView: UIView {

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

    private lazy var nameTF: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.keyboardType = .default
        textField.attributedPlaceholder = NSAttributedString(
            string: "Nome",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ]
        )
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 9
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none

        return textField
    }()

    private lazy var telephoneNumberTF: UITextField = { // try application mask
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.keyboardType = .phonePad
        textField.attributedPlaceholder = NSAttributedString(
            string: "Telefone (somente números)",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ]
        )
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray.cgColor
        // UIColor(named: "OffBlack")?.cgColor
        textField.layer.cornerRadius = 9
        textField.clipsToBounds = true
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textAlignment = .left

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

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension RegistrationView: RegistrationViewDelegate {
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
