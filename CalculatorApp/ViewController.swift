//
//  ViewController.swift
//  CalculatorApp
//  Created by marwa on 1/8/18.
//  Copyright © 2018 marwa. All rights reserved.
//

import UIKit

enum modes {
    case Not_Set
    case Addition
    case subtraction
    case muliplication
}
class ViewController: UIViewController {

    var laeblString:String = "0"
    var currentMode:modes = .Not_Set
    var saveNumber:Int = 0
    var lastButnWasMode:Bool = false
    
    @IBOutlet weak var calLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateText(){
        guard let labelInt:Int = Int(laeblString)else {
            return
        }
        if (currentMode == .Not_Set){
            saveNumber = labelInt
        }
        calLabel.text = "\(labelInt)"
    }
    func changeMode(newmode:modes) {
        if (saveNumber == 0) {
            return
        }
        currentMode = newmode
        lastButnWasMode = true
    }
    @IBAction func didPressAddition(_ sender: Any) {
        changeMode(newmode: .Addition)
    }
    @IBAction func didPresssubtraction(_ sender: Any) {
        changeMode(newmode: .subtraction)
        
    }
    @IBAction func didPressMultiplacat(_ sender: Any) {
        changeMode(newmode: .muliplication)
        
    }
    @IBAction func didPressEqual(_ sender: Any) {
        guard let labelInt:Int = Int(laeblString) else {
                    return
        }
        if (currentMode == .Not_Set || lastButnWasMode == true) {
            return
        }
        if(currentMode == .Addition){
            saveNumber = saveNumber + labelInt
        }else if(currentMode == .subtraction){
            saveNumber = saveNumber - labelInt
        }else if(currentMode == .muliplication){
            saveNumber = saveNumber * labelInt
        }
        currentMode = .Not_Set
        laeblString = "\(saveNumber)"
        updateText()
        lastButnWasMode = true
    }
    @IBAction func didpressClear(_ sender: Any) {
        laeblString = "0"
        currentMode = .Not_Set
        saveNumber = 0
        lastButnWasMode = false
        calLabel.text = "0"
    }
    @IBAction func didPressNumber(_ sender: UIButton) {
        let stringValue:String? = sender.titleLabel?.text
        if(lastButnWasMode){
            lastButnWasMode = false
            laeblString = "0"
        }
        laeblString = laeblString.appending(stringValue!)
        updateText()
        
    }
    
    
}

