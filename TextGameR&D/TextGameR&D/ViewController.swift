//
//  ViewController.swift
//  TextGameR&D
//
//  Created by Glenn Von Posadas on 8/2/20.
//  Copyright © 2020 GAM Dynamics. All rights reserved.
//

import UIKit

let MAX_OPTIONS_CHAR_LENGTH = 15

class ViewController: UIViewController {
    
    private let answerString = "titanic"
    private var options = [String]()
    private var fields = [String]()
    
    @IBOutlet weak var answerButtonsContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startLayout()
    }
    
    private func startLayout() {
        let characters = Array(self.answerString)
        self.fields = characters.map({ $0.uppercased() })
        self.options = self.fields
        
        let missingOptionsCount = MAX_OPTIONS_CHAR_LENGTH - self.fields.count
        if missingOptionsCount > 0 {
            let randomString = self.randomString(length: missingOptionsCount)
            randomString.forEach { c in
                self.options.append("\(c)")
            }
        }
        
        self.options.shuffle()
        
        print("answer: \(self.answerString)")
        print("options: \(self.options)")
    }
    
    private func randomString(length: Int) -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

