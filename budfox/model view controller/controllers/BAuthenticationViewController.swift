//
//  BAuthenticationViewController.swift
//  budfox
//
//  Created by Vladimir Psyukalov on 18.09.17.
//  Copyright © 2017 YOUROCK INC. All rights reserved.
//


import UIKit


class BAuthenticationViewController: UIViewController, UITextFieldDelegate, BCountriesViewControllerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var selectCountryButton: UIButton!
    
    @IBOutlet weak var getCodeButton: BButton!
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    @IBOutlet weak var selectCountryBLC: NSLayoutConstraint!
    
    var country: BCountry?
    
    // MARK: Override func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerObserver()
        self.setup()
        self.localize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.registerObserver()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self .unregisterObserver()
    }
    
    // MARK: Custom func
    
    func setup() {
        self.title = NSLocalizedString("t_authentication", comment: "")
        getCodeButton.isEnabled = false;
        selectCountryButton.titleEdgeInsets = UIEdgeInsets(top: 0.0,
                                                           left: -(selectCountryButton.currentImage?.size.width)!,
                                                           bottom: 0.0,
                                                           right: 0.0)
        selectCountryButton.imageEdgeInsets = UIEdgeInsets(top: 0.0,
                                                           left: (UIScreen.main.bounds.width - 2 * selectCountryBLC.constant) - (selectCountryButton.currentImage?.size.width)!,
                                                           bottom: 0.0,
                                                           right: 0.0)
    }
    
    func localize() {
        selectCountryButton.setTitle(NSLocalizedString("b_select_country", comment: ""), for: .normal)
        getCodeButton.setTitle(NSLocalizedString("b_get_code", comment: ""), for: .normal)
        mobileNumberTextField.placeholder = NSLocalizedString("pl_your_mobile_number", comment: "")
        mobileNumberTextField.delegate = FALTextFieldMask.getInstance()
        mobileNumberTextField.textMask = "NNN NNN NN NN"
        codeLabel.text = NSLocalizedString("l_code", comment: "")
        descriptionLabel.text = NSLocalizedString("l_description", comment: "")
    }
    
    func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWiilShow(_ :)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_ :)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func unregisterObserver() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func enableGetButton() {
        let textField = mobileNumberTextField
        getCodeButton.isEnabled = textField?.text?.characters.count == textField?.textMask.characters.count && country != nil
    }
    
    // MARK: Observers
    
    func keyboardWiilShow(_ notification: NSNotification) {
        let duration: TimeInterval = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        let keyboardHeight: CGFloat = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect).size.height
        UIView.animate(withDuration: duration,
                       delay: 0.0,
                       options: .curveEaseOut,
                       animations: {
                        self.getCodeButton.transform = CGAffineTransform(translationX: 0.0, y: -keyboardHeight)
        })
        { (finished) in
            self.scrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 8.0, 0.0)
        }
    }
    
    func keyboardWillHide(_ notification: NSNotification) {
        let duration: TimeInterval = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        UIView.animate(withDuration: duration,
                       delay: 0.0,
                       options: .curveEaseOut,
                       animations: {
                        self.getCodeButton.transform = CGAffineTransform.identity
        })
        { (finished) in
            self.scrollView.contentInset = UIEdgeInsets.zero
        }
    }
    
    // MARK: BCountriesViewControllerDelegate
    
    func didSelectCountry(_ country: BCountry) {
        self.country = country
        selectCountryButton.setTitle(country.name, for: .normal)
        codeLabel.text = country.code
        enableGetButton()
    }
    
    // MARK: Actions
    
    @IBAction func selectCountryButton_TUI(_ sender: UIButton) {
        mobileNumberTextField.resignFirstResponder()
        let countriesVC: BCountriesViewController = BCountriesViewController()
        countriesVC.delegate = self
        self.navigationController?.pushViewController(countriesVC, animated: true)
    }
    
    @IBAction func getCodeButton_TUI(_ sender: UIButton) {
        /* TODO:
         *
         * Switch on activity indicator view
         * Sending code
         * Switch off activity indicator view
         * If success sending then go to next view controller
         * Else show message with error description and try again button or cancel
         *
         */
        
        print("TODO: ...")
        
    }
    
    @IBAction func mobileNumberTextField_EC(_ sender: UITextField) {
        enableGetButton()
    }
    
}
