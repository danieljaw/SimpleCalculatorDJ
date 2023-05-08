//
//  ViewController.swift
//  CaclulatorSimple-DJ
//
//  Created by Daniel Jaworski on 08/05/2023.
//

import UIKit



class ViewController: UIViewController {

    var workings: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAll()
        
    }
    
    func clearAll() {
        resultsCalc.text = "0"
        workings = ""
    }

    @IBOutlet var resultsCalc: UILabel!
    @IBAction func clearButton(_ sender: UIButton) {
        clearAll()
    }
    
    
    
    @IBOutlet var workingLabel: UILabel!
    
    func addToWorking(value: String) {
        workings = workings + value
        resultsCalc.text = workings
    }
    
    @IBAction func plusMinusButton(_ sender: UIButton) {
        addToWorking(value: "+/-")
    }
    @IBAction func percentButton(_ sender: UIButton) {
        addToWorking(value: "%")
    }
    @IBAction func divideButton(_ sender: UIButton) {
        addToWorking(value: "/")
    }
    @IBAction func multiplyButton(_ sender: UIButton) {
        addToWorking(value: "*")
    }
    @IBAction func minusButton(_ sender: UIButton) {
        addToWorking(value: "-")
    }
    @IBAction func plusButton(_ sender: UIButton) {
        addToWorking(value: "+")
    }
    @IBAction func isEqualButton(_ sender: UIButton) {
        
        if(validInput())
        {
            let chceckedIfPercentIsWorking = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: chceckedIfPercentIsWorking)
            let results = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(results: results)
            resultsCalc.text = resultString
            
        } else {
            
            let warning = UIAlertController(title: "Invalid data!", message: "Unable data to work with", preferredStyle: .alert)
            warning.addAction(UIAlertAction(title: "Understood!", style: .default))
            self.present(warning, animated: true, completion: nil)
            clearAll()
        }
        
        workings = ""
    }
    
    
    func validInput() -> Bool {
        
        var count = 0
        var charIndexes = [Int]()
        
        for char in workings {
            if specialChar(char: char) {
                charIndexes.append(count)
            }
            count += 1
        }
        
        var lastChar: Int = -1
        
        
        for index in charIndexes {
            if index == 0 {
                return false
            }
            if index == workings.count - 1 {
                return false
            }
            if lastChar != -1 {
                if index - lastChar == 1 {
                    return false
                }
            }
            lastChar = index
        }
        
        return true
    }
    
    func specialChar(char: Character) -> Bool {
        if char == "*" {
            return true
        }
        if char == "/" {
            return true
        }
        if char == "+" {
            return true
        }
        if "%".count > 1 {
            return true}
        return false
    }
    
    
    
    
    func formatResult(results: Double) -> String {
        if(results.truncatingRemainder(dividingBy: 1) == 0) {
            return String( format: "%.0f", results)
        } else {
            return String(format: "%.2f", results)
        }
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        addToWorking(value: "0")
    }
    @IBAction func oneButton(_ sender: UIButton) {
        addToWorking(value: "1")
    }
    @IBAction func twoButton(_ sender: UIButton) {
        addToWorking(value: "2")
    }
    @IBAction func threeButton(_ sender: UIButton) {
        addToWorking(value: "3")
    }
    @IBAction func fourButton(_ sender: UIButton) {
        addToWorking(value: "4")
    }
    @IBAction func fiveButton(_ sender: UIButton) {
        addToWorking(value: "5")
    }
    @IBAction func sixButton(_ sender: UIButton) {
        addToWorking(value: "6")
    }
    @IBAction func seventhButton(_ sender: UIButton) {
        addToWorking(value: "7")
    }
    @IBAction func eightButton(_ sender: UIButton) {
        addToWorking(value: "8")
    }
    @IBAction func nineButton(_ sender: UIButton) {
        addToWorking(value: "9")
    }
    @IBAction func commaButton(_ sender: UIButton) {
        addToWorking(value: ",")
    }
    
    
    
}
