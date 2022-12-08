//
//  RegistrationView.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 30/11/22.
//

import UIKit

enum TextFields {
    case name, phone
}

protocol RegisterViewDelegate: AnyObject {
    func turnTextFieldRed(_ textField: TextFields)
}

final class RegisterView: UIView {
    var controllerDelegate: RegisterControllerDelegate?

    private lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.text = "Sua identificação"
        label.textAlignment = .center
        label.textColor = UIColor(named: "Pink")

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
        label.textColor = .secondaryLabel

        return label
    }()

    private lazy var nameTextField: PeepTextField = {
        let textfield = PeepTextField(placeholder: "Nome")
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.maskType = .none

        return textfield
    }()

    private lazy var phoneTextField: PeepTextField = {
        let textField = PeepTextField(placeholder: "Telefone (somente números)")
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.maskType = .cellphone

        return textField
    }()

    private lazy var confirmButton: UICustomButton = {
        let button = UICustomButton()
        button.setupButton(title: "Entrar", font: (20, .bold))
        button.addTarget(
            self,
            action: #selector(didTapConfirmButtonTarget),
            for: .touchUpInside
        )

        return button
    }()

    init(frame: CGRect, delegate: RegisterControllerDelegate? = nil) {
        self.controllerDelegate = delegate
        super.init(frame: frame)

        buildLayout()
    }

    @objc func didTapConfirmButtonTarget() {
        controllerDelegate?.registerIfIsPossible(
            name: nameTextField.textfield.text,
            phone: phoneTextField.textfield.text
        )
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension RegisterView: RegisterViewDelegate {
    func turnTextFieldRed(_ textField: TextFields) {
        switch textField {
        case .name:
            nameTextField.borderRed()
        case .phone:
            phoneTextField.borderRed()
        }
    }
}

extension RegisterView: ViewCoding {
    func setupView() {
        self.backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        let views: [UIView] = [
            title,
            subtitle,
            nameTextField,
            phoneTextField,
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
            self.nameTextField.topAnchor.constraint(equalTo: self.subtitle.bottomAnchor, constant: 50),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func telephoneNumberTFConstraints() {
        NSLayoutConstraint.activate([
            self.phoneTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 10),
            self.phoneTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.phoneTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.phoneTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func confirmButtonConstraints() {
        NSLayoutConstraint.activate([
            self.confirmButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            self.confirmButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.confirmButton.heightAnchor.constraint(equalTo: confirmButton.widthAnchor, multiplier: 0.2),
            self.confirmButton.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                constant: self.frame.width*(-1)/10
            )
        ])
    }
}
