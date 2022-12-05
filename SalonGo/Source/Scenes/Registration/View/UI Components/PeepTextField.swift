//
//  PeepTextField.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 02/12/22.
//

import UIKit

class PeepTextField: UIView {
    // MARK: - Properties
    public var maskType: MaskTypes = .none
    public var placeholder: String

    /// Tipos de Máscara
    public enum MaskTypes {
       case none
       case cpf
       case cnpj
       case cep
       case cellphone

       var mask: String? {
           switch self {
           case .cpf:
               return "###.###.###-##"
           case .cnpj:
               return "##.###.###/####-##"
           case .cep:
               return "#####-###"
           case .cellphone:
               return "(##) # ####-####"
           case .none:
               return nil
           }
       }

       var maximumChars: Int? {
           switch self {
           case .cpf, .cellphone:
               return 11
           case .cnpj:
               return 14
           case .cep:
               return 8
           case .none:
               return nil
           }
       }

    }

    // MARK: - UI

    /// View que vai estar com o conteúdo para exibição
    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)

        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(textfield)

        return view
    }()

    lazy var textfield: UITextField = {
        let textfield = UITextField(frame: .zero)

        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ]
        )
        textfield.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textfield.textAlignment = .left
        textfield.borderStyle = .roundedRect
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.systemGray.cgColor
        textfield.layer.cornerRadius = 9
        textfield.clipsToBounds = true
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .none

        textfield.addTarget(self, action: #selector(textfieldChaged(_:)), for: .editingChanged)

        return textfield
    }()

    // MARK: - LifeCycle

    required init(placeholder: String) {
        self.placeholder = placeholder
        super.init(frame: CGRect.zero)
        buildLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    /// Função responsável por retirar todos os símbolo e somente manter números e letras
    /// - Parameter text: String para Formatar
    private func getOnlyDigitsFromString(text: String) -> String {
        return text.replacingOccurrences(of: "\\D", with: "", options: .regularExpression)
    }

    /// Aplicar máscara no texto digitado no campo de texto
    /// - Parameters:
    ///   - text: Texto para aplicar
    ///   - mask: Máscara para ser aplicada
    private func applyMaskToText(text: String, apply mask: String?) {
        var masked = ""
        var textIndex = 0
        var maskIndex = 0

        guard let mask = mask else {
            textfield.text = text
            return
        }

        let onlyChars = getOnlyDigitsFromString(text: text)

        while maskIndex < mask.count && textIndex < onlyChars.count {
            var char = mask[mask.index(mask.startIndex, offsetBy: maskIndex)]

            if char == "#" {
                char = onlyChars[text.index(onlyChars.startIndex, offsetBy: textIndex)]
                textIndex += 1
            }

            masked.append(char)
            maskIndex += 1
        }

        textfield.text = masked
    }

    /// Função reponsável por aplicar ações conforme o usuário digita
    /// - Parameter textfield: Textfield sofrendo edição
    @objc func textfieldChaged(_ textfield: UITextField) {
        guard let text = textfield.text else { return }
        applyMaskToText(text: text, apply: maskType.mask)
        if let maxChars = maskType.maximumChars, text.count > maxChars {
            _ = textfield.text?.dropLast()
        }
    }

    func textFieldContentSize() -> Int {
        guard let text = textfield.text else { return 0 }
        return text.count
    }

}

extension PeepTextField: ViewCoding {
    func setupView() {
        self.backgroundColor = .systemBackground
    }

    func setupHierarchy() {
        self.addSubview(contentView)
    }

    /// Função responsável pelo setup das constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // CONTENT VIEW CONTRAINTS
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),

          // TEXTFIElD CONSTRAINTS
            textfield.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            textfield.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            textfield.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textfield.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
