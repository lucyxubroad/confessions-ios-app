//
//  ViewController.swift
//  ConfessionsApp
//
//  Created by Lucy Xu on 12/23/18.
//  Copyright © 2018 Lucy Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cornellImageView: UIImageView!
    var cornellLogoImageView: UIImageView!
    var cornellOverlayImageView: UIImageView!
    
    var emailImageView: UIImageView!
    var emailTextField: UITextField!
    
    var passwordImageView: UIImageView!
    var passwordTextField: UITextField!
    
    var googleSignInButton: UIButton!
    var signInButton: UIButton!
    
    var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        passwordTextField.isSecureTextEntry = true
        passwordTextField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.addSubview(passwordTextField)
        
        googleSignInButton = UIButton()
        googleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        googleSignInButton.setTitle("Sign In with Google", for: .normal)
        googleSignInButton.layer.cornerRadius = 5
        googleSignInButton.backgroundColor = UIColor(red: 241/255, green: 53/255, blue: 100/255, alpha: 1)
        googleSignInButton.setTitleColor(.white, for: .normal)
        view.addSubview(googleSignInButton)
        
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.layer.cornerRadius = 5
        signInButton.backgroundColor = UIColor(red: 241/255, green: 53/255, blue: 100/255, alpha: 1)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        view.addSubview(signInButton)
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Don't have an account? Sign up!", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: .light)
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
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
            googleSignInButton.topAnchor.constraint(equalTo: passwordImageView.bottomAnchor, constant: 50),
            googleSignInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            googleSignInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            googleSignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleSignInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: googleSignInButton.bottomAnchor, constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
    }
    
    @objc func signUp() {
        let signUpViewController = SignUpViewController()
        present(signUpViewController, animated: true, completion: nil)
    }
    
    @objc func signIn() {
        if let email = emailTextField?.text, let password = passwordTextField?.text {
            print("email is \(email)")
            print("password is \(password)")
            NetworkManager.loginUser(email: email, password: password) { registeredUser in
                DispatchQueue.main.async {
//                    print("registered user is \(registeredUser)")
                    let postsNavigationViewController = PostsNavigationViewController()
                    postsNavigationViewController.user = User(user_id: registeredUser.user_id, photo_id: registeredUser.photo_id)
                    self.navigationController?.pushViewController(postsNavigationViewController, animated: true)
                }
            }
        }
    }
}


