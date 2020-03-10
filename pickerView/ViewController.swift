//
//  ViewController.swift
//  pickerView
//
//  Created by adithyasai neeli on 2020-03-09.
//  Copyright © 2020 adithyasai neeli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField_Date: UITextField!
    var datePicker : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textField_Date.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        self.pickUpDate(self.textField_Date)
    }
    
    func pickUpDate(_ textField: UITextField){
        
        self.datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePicker.Mode.date
        textField.inputView = self.datePicker
        
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = .red
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ViewController.cancelClick))
        
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        toolbar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolbar
        
    }
    
    @objc func doneClick()
    
    {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        textField_Date.text = dateFormatter1.string(from: datePicker.date)
        textField_Date.resignFirstResponder()
        

    }
    
    @objc func cancelClick()
    {
        textField_Date.resignFirstResponder()
    }
    

}

