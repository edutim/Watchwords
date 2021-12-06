//
//  ViewController.swift
//  Watchwords
//
//  Created by Timothy Hart on 12/3/21.
//

import Cocoa

class ViewController: NSViewController {

    /// An outlet to the text field. Used to display the resulting password to the user.
    @IBOutlet weak var passwordTextField: NSTextField!
    
    /// An outlet to the label for the slider. Used to display the password length.
    @IBOutlet weak var sliderLabel: NSTextField!
    
    /// An outlet to the slider. Used to set the password length.
    @IBOutlet weak var lengthSlider: NSSlider!
    
    /// A constant to store the character we are allowed to use in the password.
    let allowedCharacters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sliderLabel.stringValue = "\(lengthSlider.intValue)"
    }

    /// Sent from the generate password button.
    @IBAction func generatePassword(_ sender: NSButton) {
        let newPassword = generateRandomString()
        passwordTextField.stringValue = newPassword
    }
    
    /// Generate a random string
    func generateRandomString() -> String {
        // Start with an empty string
        var potentialPassword = ""
        
        for _ in 0..<lengthSlider.intValue {
            potentialPassword.append(generateRandomCharacter())
        }
        
        return potentialPassword
        
    }
    
    /// Generates a random character
    func generateRandomCharacter() -> Character {
        // Ceate a random index into the characters string
        let index = Int.random(in: 0..<allowedCharacters.count)
        
        // Get and return a random character
        let character = allowedCharacters[index]
        return character
    }

    /// Sent from the slider. Updates the slider label.
    @IBAction func sliderUpdated(_ sender: NSSlider) {
        sliderLabel.stringValue = "\(sender.intValue)"
    }
    
    
}

