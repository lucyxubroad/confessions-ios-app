//
//  SignInViewController.swift
//  ConfessionsApp
//
//  Created by Lucy Xu on 12/23/18.
//  Copyright © 2018 Lucy Xu. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var cornellImageView: UIImageView!
    var cornellLogoImageView: UIImageView!
    var cornellOverlayImageView: UIImageView!
    
    var emailImageView: UIImageView!
    var emailTextField: UITextField!
    
    var passwordImageView: UIImageView!
    var passwordTextField: UITextField!
    
    var confirmPasswordImageView: UIImageView!
    var confirmPasswordTextField: UITextField!
    
    var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        cornellImageView = UIImageView()
        cornellImageView.translatesAutoresizingMaskIntoConstraints = false
        cornellImageView.image = UIImage(named: "cornell")
        cornellImageView.contentMode = .scaleAspectFill
        cornellImageView.clipsToBounds = true
        view.addSubview(cornellImageView)
        
        cornellOverlayImageView = UIImageView()
        cornellOverlayImageView.translatesAutoresizingMaskIntoConstraints = false
        cornellOverlayImageView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.75)
        view.addSubview(cornellOverlayImageView)
        
        cornellLogoImageView = UIImageView()
        cornellLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        cornellLogoImageView.image = UIImage(named: "cornellLogo")
        view.addSubview(cornellLogoImageView)
        
        emailImageView = UIImageView()
        emailImageView.translatesAutoresizingMaskIntoConstraints = false
        emailImageView.image = UIImage(named: "mail")
        view.addSubview(emailImageView)
        
        emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        emailTextField.textColor = .black
        emailTextField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.addSubview(emailTextField)
        
        passwordImageView = UIImageView()
        passwordImageView.translatesAutoresizingMaskIntoConstraints = false
        passwordImageView.image = UIImage(named: "lock")
        view.addSubview(passwordImageView)
        
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.addSubview(passwordTextField)
        
        confirmPasswordImageView = UIImageView()
        confirmPasswordImageView.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordImageView.image = UIImage(named: "lock")
        view.addSubview(confirmPasswordImageView)
        
        confirmPasswordTextField = UITextField()
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.placeholder = "Confirm Password"
        confirmPasswordTextField.textColor = .black
        confirmPasswordTextField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.addSubview(confirmPasswordTextField)
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.layer.cornerRadius = 5
        signUpButton.backgroundColor = UIColor(red: 241/255, green: 53/255, blue: 100/255, alpha: 1)
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        signUpButton.setTitleColor(.white, for: .normal)
        view.addSubview(signUpButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            cornellImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cornellImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cornellImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cornellImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            cornellImageView.heightAnchor.constraint(equalToConstant: 300)
            ])
        
        NSLayoutConstraint.activate([
            cornellOverlayImageView.topAnchor.constraint(equalTo: cornellImageView.topAnchor),
            cornellOverlayImageView.leadingAnchor.constraint(equalTo: cornellImageView.leadingAnchor),
            cornellOverlayImageView.trailingAnchor.constraint(equalTo: cornellImageView.trailingAnchor),
            cornellOverlayImageView.widthAnchor.constraint(equalTo: cornellImageView.widthAnchor),
            cornellOverlayImageView.heightAnchor.constraint(equalTo: cornellImageView.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            cornellLogoImageView.widthAnchor.constraint(equalToConstant: 200),
            cornellLogoImageView.heightAnchor.constraint(equalToConstant: 200),
            cornellLogoImageView.centerXAnchor.constraint(equalTo: cornellImageView.centerXAnchor),
            cornellLogoImageView.centerYAnchor.constraint(equalTo: cornellImageView.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            emailImageView.topAnchor.constraint(equalTo: cornellImageView.bottomAnchor, constant: 60),
            emailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            emailImageView.widthAnchor.constraint(equalToConstant: 20),
            emailImageView.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            emailTextField.bottomAnchor.constraint(equalTo: emailImageView.bottomAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: emailImageView.trailingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
            ])
        
        NSLayoutConstraint.activate([
            passwordImageView.topAnchor.constraint(equalTo: emailImageView.bottomAnchor, constant: 50),
            passwordImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            passwordImageView.widthAnchor.constraint(equalToConstant: 20),
            passwordImageView.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            passwordTextField.bottomAnchor.constraint(equalTo: passwordImageView.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordImageView.trailingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
            ])
        
        NSLayoutConstraint.activate([
            confirmPasswordImageView.topAnchor.constraint(equalTo: passwordImageView.bottomAnchor, constant: 50),
            confirmPasswordImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            confirmPasswordImageView.widthAnchor.constraint(equalToConstant: 20),
            confirmPasswordImageView.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            confirmPasswordTextField.bottomAnchor.constraint(equalTo: confirmPasswordImageView.bottomAnchor),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: confirmPasswordImageView.trailingAnchor, constant: 10),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
            ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 50),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func signUp() {
        if let email = emailTextField?.text, let password = passwordTextField?.text {
            print("email is \(email)")
            print("password is \(password)")
            NetworkManager.registerUser(email: email, password: password) { registeredUser in
                DispatchQueue.main.async {
                    print("registered?")
                }
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
