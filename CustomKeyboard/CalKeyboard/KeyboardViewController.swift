//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
        let buttonTitles = ["Q", "W", "E", "R", "T", "Y"]
       
        
    }

    @IBAction func keyPressed(sender: AnyObject?) {
        let button = sender as! UIButton
        let title = button.titleForState(.Normal)
        (textDocumentProxy as UIKeyInput).insertText(title!)
    }
    
    @IBAction func deleteKey(sender: AnyObject?) {
        print("Did I reach deleteKey?",title)
        (textDocumentProxy as UIKeyInput).deleteBackward()    }
    
    @IBAction func returnButton(sender: AnyObject?) {
        print("Did I reach returnButton?",title)
        (textDocumentProxy as UIKeyInput).insertText("\r\n")   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
//        deleteButton.addTarget(self, action: "keyPressed", forControlEvents: .TouchUpInside)
        print("passed loadinterface")
    }


}
