//
//  ViewController.swift
//  Caculator
//
//  Created by Duy Bùi on 4/14/17.
//  Copyright © 2017 Duy Bùi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var operation = 0;	
    @IBOutlet weak var lblText: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath{
             lblText.text = String(sender.tag-1)
            numberOnScreen = Double(lblText.text!)!
            performingMath = false;
        }
        else{
            if sender.tag != 0{
                lblText.text = 	lblText.text! + String(sender.tag-1);
                numberOnScreen = Double(lblText.text!)!	;

            }
            else if sender.tag == 0{
                if checkDot(character: lblText.text!){
                    lblText.text = lblText.text! + "."
                    numberOnScreen = Double(lblText.text!)!
                }
            }
        }
        
    }
    
    //hàm kiểm tra, chỉ cho phép 1 dấu . dc phép xuất hiện
    func checkDot(character: String) -> Bool {
       
        if character != ""{
              //let charAtIndex = character[character.index(character.startIndex, offsetBy: 0)]
            var count: Int = 0;
            for charac in character.characters{
                if (charac == "."){
                    count+=1;
                }
            }
            if (count > 0){
                return false;
            }
            else{
                return true;
            }
        }
        return false;
    }
    @IBAction func buttons(_ sender: UIButton) {
        //kiểm tra xem người dùng có click những nút khác ngoài những nút tính toán hay không
        	if 	lblText.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 13 && sender.tag != 18{
                previousNumber = Double(lblText.text!)!
                if sender.tag == 14{
                    lblText.text = "/"
                }
                if sender.tag == 15{
                    lblText.text = "x"
                }
                if sender.tag == 16{
                    lblText.text = "-"
                }
                if (sender.tag == 17){
                    lblText.text = "+"
                    
                }
                operation = sender.tag
                performingMath = true;
        }
                //nếu người dùng nhấn dấu =
        else if sender.tag == 18{
                if operation == 14{
                lblText.text = String(previousNumber / numberOnScreen)
                    numberOnScreen = previousNumber/numberOnScreen
                }
                if operation == 15{
                    lblText.text = String(previousNumber * numberOnScreen)
                     numberOnScreen = previousNumber * numberOnScreen
                }
                if (operation == 16){
                    lblText.text = String(previousNumber - numberOnScreen)
                     numberOnScreen = previousNumber - numberOnScreen
                }
                if (operation == 17){
                    lblText.text = String(previousNumber + numberOnScreen)
                     numberOnScreen = previousNumber + numberOnScreen
                }
        }
                //người dùng nhấn nút AC
        else if sender.tag == 11{
                lblText.text = ""
                previousNumber = 0
                numberOnScreen = 0
                operation = 0
        }
                //người dúng nhấn dấu "+-"
        else if sender.tag == 12{
                if lblText.text! != "" || lblText.text! != "0"{
                    numberOnScreen *= -1
                    lblText.text = String(numberOnScreen)
                }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

