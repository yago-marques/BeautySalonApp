//
//  RegistrationViewController.swift
//  SalonGo
//
//  Created by Milena Lima de Alcântara on 30/11/22.
//

import UIKit

protocol RegistrationControllerDelegate: AnyObject {
    func showRegistration()
}

final class RegistrationController: UIViewController {

    private weak var viewDelegate: RegistrationViewDelegate?
    private var presenter: RegistrationPresenting

    // MARK: - Mask
    private var actualText: String = ""
    private var maskedText: String = ""

    private var masked: Bool = true {
        didSet {
            refreshTextField()
        }
    }

    init(
        registrationView: RegistrationView,
        presenter: RegistrationPresenting
    ) {
        self.viewDelegate = registrationView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.view = registrationView
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupView()

        presenter.showOnboardingIfNeeded()
    }
}

private extension RegistrationController {
    func setupView() {
        self.presenter.controller = self
        self.presenter.router.navigation = self.navigationController
    }

    private func refreshTextField() {
//        viewDelegate = masked ? maskedText : actualText
    }
}

extension RegistrationController: RegistrationControllerDelegate {
    func showRegistration() {
        viewDelegate?.showRegistration()
    }
}

/*
 class ViewController: UIViewController {

     @IBOutlet private var textField: UITextField?

     private var actualText: String = ""
     private var maskedText: String = ""

     private var masked: Bool = true {
         didSet {
             refreshTextField()
         }
     }

     @IBAction private func maskedTogglePressed(_ sender: Any) {
         masked = !masked
     }

     private func refreshTextField() {
         textField?.text = masked ? maskedText : actualText
     }
 }

 extension ViewController: UITextFieldDelegate {

     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         var newString = (actualText as NSString).replacingCharacters(in: range, with: string) // Apply new text

         // Remove all whitespaces
         newString = newString.replacingOccurrences(of: " ", with: "")
         // Remove all that is not a number
         newString = newString.filter("0123456789".contains)

         // Split string into components of max 4
         var components: [String] = {
             var toDeplete = newString
             var components: [String] = []
             while !toDeplete.isEmpty {
                 let length = min(toDeplete.count, 4)
                 components.append(String(toDeplete.prefix(length)))
                 toDeplete.removeFirst(length)
             }
             return components
         }()
         // Limit to maximum of 3 components
         if components.count > 3 {
             components = Array(components[0..<3])
         }

         // Generate masked components, replacing all characters with X
         let maskedComponents: [String] = components.map { String($0.map { character in return "X" }) }

         // Add spaces
         newString = components.joined(separator: " ")
         let maskedText = maskedComponents.joined(separator: " ")

         // Assign new strings
         self.actualText = newString
         self.maskedText = maskedText

         // Refresh field
         refreshTextField()

         // Disallow text field to apply it's change
         return false
     }

 }
 */
