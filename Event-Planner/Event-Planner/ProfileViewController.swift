//
//  ProfileViewController.swift
//  Event-Planner
//
//  Created by Aidan Lane on 12/11/20.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var themeControl: UISegmentedControl!
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var themeLabel: UILabel!
        
    @IBOutlet weak var currentPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    
    @IBOutlet weak var changeNameButton: UIButton!
    @IBOutlet weak var changePassButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = PFUser.current()
        userNameLabel.text = user!.username
        
        changeNameButton.layer.cornerRadius = 8
        changePassButton.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setTheme(_ sender: Any) {
        defaults.set(themeControl.selectedSegmentIndex, forKey: "theme")
        print(defaults.integer(forKey: "theme"))
        updateTheme()
    }
    
    func updateTheme() {
        if (defaults.integer(forKey: "theme") == 0) {
            view.backgroundColor = .white
            UITabBar.appearance().barTintColor = .white
            themeLabel.textColor = .black
            userLabel.textColor = .black
            userNameLabel.textColor = .black
        } else {
            view.backgroundColor = .darkGray
            UITabBar.appearance().barTintColor = .darkGray
            themeLabel.textColor = .white
            userLabel.textColor = .white
            userNameLabel.textColor = .white
        }
    }
    
    @IBAction func changeName(_ sender: Any) {
        let user = PFUser.current()
        user?["username"] = nameTextField.text
        user?.saveInBackground()
        viewDidLoad()
    }
    @IBAction func changePassword(_ sender: Any) {
        let user = PFUser.current()
        PFUser.logInWithUsername(inBackground: user?["username"] as! String ?? "", password: currentPassword.text ?? "") { (user, error) in
            if user != nil {
                user?.password = self.newPassword.text
                user?.saveInBackground()
                print("new password saved")
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
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
