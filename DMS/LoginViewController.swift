//
//  LoginViewController.swift
//  DMS
//
//  Created by Raja Ayyan on 10/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit
import CoreData


protocol LoginViewControllerDelegate {
    func didLoginSuccessfully()
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    var delegate: LoginViewControllerDelegate?
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.containerView.layer.cornerRadius = 10.0
        self.containerView.clipsToBounds = true
        
        self.loginButton.layer.cornerRadius = 6.0
        self.loginButton.clipsToBounds = true
        
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let background = CAGradientLayer().yellowGradientColor()
        background.frame = self.loginButton.bounds
        self.loginButton.layer.insertSublayer(background, atIndex: 0)
    }
    
    
    //MARK: -LoginACtion
    
    @IBAction func loginAction(sender: UIButton) {
        
        //let results = DataPersistence.getDataFromTableWithFilter("Users", filterParameter: self.userNameField.text!)
        //let results = DataPersistence.getUserDetails(self.userNameField.text!)
        let results = DataPersistence.getDataFromTableWithFilter("Users", coloumnName: "username", filterParameters: [self.userNameField.text!])
        
        
        if let userResults = results as? [Users]{
            if let result = userResults.first{
                print(result.username)
                print(result.password)
            }
        }
        
        
        if let result = results.first as! Users!{
            if result.username == self.userNameField.text && result.password == self.passwordField.text{
                resignFirstResponder()
                //Save the id in userdefaults
                let userid = result.id
                userDefaults.setObject(userid, forKey: "loggedinuserid")
                userDefaults.setObject(result.username, forKey: "loggedinusername")
                delegate?.didLoginSuccessfully()
            }else{
                showLogiAlert()
            }

        }
        
    }
    
    
    func showLogiAlert(){
        let alertController = UIAlertController(title: "Error!", message: "The username and password combination failed.", preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
        })
        alertController.addAction(ok)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    
}




//MARK: Extension GradientColorForButton


extension CAGradientLayer {
    
    func yellowGradientColor() -> CAGradientLayer {
        let topColor = UIColor(red: (238/255.0), green: (212/255.0), blue: (144/255.0), alpha: 1)
        let middleColor = UIColor(red: (233/255.0), green: (204/255.0), blue: (125/255.0), alpha: 1)
        let bottomColor = UIColor(red: (225/255.0), green: (185/255.0), blue: (96/255.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.CGColor,middleColor.CGColor, bottomColor.CGColor]
        let gradientLocations: [Float] = [0.0, 0.5,1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
}
