//
//  ViewController.swift
//  Morse
//
//  Created by Zhanqi on 4/15/19.
//  Copyright © 2019 Zhanqi. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

//Morse Code Map
//The lower case letter shares the same morse code as upper case letter
//space "|"
let ToMorse = [
    "A": ".-",
    "B": "-...",
    "C": "-.-.",
    "D": "-..",
    "E": ".",
    "F": "..-.",
    "G": "--.",
    "H": "....",
    "I": "..",
    "J": ".---",
    "K": "-.-",
    "L": ".-..",
    "M": "--",
    "N": "-.",
    "O": "---",
    "P": ".--.",
    "Q": "--.-",
    "R": ".-.",
    "S": "...",
    "T": "-",
    "U": "..-",
    "V": "...-",
    "W": ".--",
    "X": "-..-",
    "Y": "-.--",
    "Z": "--..",
    "a": ".-",
    "b": "-...",
    "c": "-.-.",
    "d": "-..",
    "e": ".",
    "f": "..-.",
    "g": "--.",
    "h": "....",
    "i": "..",
    "j": ".---",
    "k": "-.-",
    "l": ".-..",
    "m": "--",
    "n": "-.",
    "o": "---",
    "p": ".--.",
    "q": "--.-",
    "r": ".-.",
    "s": "...",
    "t": "-",
    "u": "..-",
    "v": "...-",
    "w": ".--",
    "x": "-..-",
    "y": "-.--",
    "z": "--..",
    "1": ".----",
    "2": "..---",
    "3": "...--",
    "4": "....-",
    "5": ".....",
    "6": "-....",
    "7": "--...",
    "8": "---..",
    "9": "----.",
    "0": "-----",
    " ": "|",
]

class ViewController: UIViewController {

    @IBOutlet weak var input_text: UITextField!
    @IBOutlet weak var output_text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        input_text.delegate = self
        // Do any additional setup after loading the view.
    }

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String)
        -> Bool {
            var allowedCharacters = CharacterSet.alphanumerics;
            allowedCharacters.insert(" ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
    }
    @IBAction func button_enter(_ sender: Any) {

        
        if let content = input_text.text{
            if(content == ""){
                output_text.text = "Input Text can not be empty"
                
            }
            else{
                output_text.text = "Input Text: \(input_text.text!) \n Morse Code:\(convertStringToMorse(input_text.text!))"
            }
        }
    }
    
    
    // Conversion
    func convertStringToMorse(_ input: String) -> String {
        let stringConverted = input
        return stringConverted
            //Return an array of the non-nil results of ToMorse in sequence
            .compactMap { ToMorse[String($0)] }
            //Insert space between elements.
            .joined(separator: " ")
    }
    
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



