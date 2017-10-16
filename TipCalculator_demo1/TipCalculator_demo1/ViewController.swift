//
//  ViewController.swift
//  TipCalculator_demo1
//
//  Created by Liu, Lynn on 12/10/2017.
//  Copyright © 2017 Liu, Lynn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipResultLabel: UILabel!
    @IBOutlet weak var totalResultLabel: UILabel!
    @IBOutlet weak var tipPersentSilder: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.keyboardType = UIKeyboardType.numberPad
        inputTextField.addTarget(self, action:#selector(showResult) , for: .editingChanged)
        inputTextField.placeholder = "$0.00"
        inputTextField.becomeFirstResponder()
        tipPersentSilder.value = 0.15;
        tipPersentSilder.addTarget(self, action: #selector(showResult), for: .valueChanged)
    }
    
    func showResult(){
        var textFieldString = inputTextField.text
        let originNum = ((textFieldString?.characters.count)! > 0) ? Float(textFieldString!) : 0.0
        let persentNum = Float(originNum!) * tipPersentSilder.value
        tipResultLabel.text =  String(format: "%.2f", persentNum)
        
        tipLabel.text = "Tip(" + "\(Int(tipPersentSilder.value * 100))" + "%)"
    
        let totalNum = originNum! + persentNum
        totalResultLabel.text = String(format: "%.2f", totalNum)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

