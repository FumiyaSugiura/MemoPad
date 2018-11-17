//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 杉浦文哉 on 2018/11/17.
//  Copyright © 2018 杉浦文哉. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextFiled : UITextField!
    @IBOutlet var contentTextFiled : UITextView!
    
    var saveData : UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextFiled.text = saveData.object(forKey: "title") as? String
        contentTextFiled.text = saveData.object(forKey: "content") as? String
        titleTextFiled.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMemo(){
        saveData.set(titleTextFiled.text, forKey: "title")
        saveData.set(contentTextFiled.text, forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        //ok butoon
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            self.navigationController?.popViewController(animated: true)
       }
       )
        )
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
