//
//  ViewController.swift
//  GITTest
//
//  Created by Ghanshyam Maliwal on 8/22/18.
//  Copyright © 2018 Ghanshyam Maliwal. All rights reserved.
//

import UIKit

// A minor change

extension UIView {
    func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 3.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var counter = 0
    
    @IBAction func changeText() {
        
        self.label.alpha = 1.0
        UIView.animate(withDuration: 1.0, animations: {
            self.label.alpha = 0.0
            
        }) { (flag) in
            if self.counter % 2 == 0 {
                self.label.text = "It is very delicious food"
            } else {
                self.label.text = "It is very yummy taste"
            }
            UIView.animate(withDuration: 1.0, animations: {
                self.counter += 1
                self.label.alpha = 1.0
            }) { (flag) in}
        }
        
    }

}

