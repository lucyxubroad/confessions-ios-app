//
//  ViewController.swift
//  ConfessionsApp
//
//  Created by Lucy Xu on 12/23/18.
//  Copyright © 2018 Lucy Xu. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    var cornellImageView: UIImageView!
    var cornellLogoImageView: UIImageView!
    var cornellOverlayImageView: UIImageView!
    
    var emailImageView: UIImageView!
    var emailTextField: UITextField!
    
    var passwordImageView: UIImageView!
    var passwordTextField: UITextField!
    
    var googleSignInButton: UIButton!
    var googleOauthSignInButton: GIDSignInButton!
    var signInButton: UIButton!
    
    var signUpButton: UIButton!
    
    var spinner = UIActivityIndicatorView(style: .whiteLarge)
    var loadingView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().clientID = "890717240425-nfijso6f1m99d25iucti5rusbflokslh.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signInSilently()
        
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
        
        googleOauthSignInButton = GIDSignInButton()
        googleOauthSignInButton.translatesAutoresizingMaskIntoConstraints = false
        googleOauthSignInButton.layer.cornerRadius = 5
        view.addSubview(googleOauthSignInButton)
        
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
            googleOauthSignInButton.topAnchor.constraint(equalTo: passwordImageView.bottomAnchor, constant: 50),
            googleOauthSignInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            googleOauthSignInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            googleOauthSignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleOauthSignInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: googleOauthSignInButton.bottomAnchor, constant: 20),
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
            self.showActivityIndicator()
            NetworkManager.loginUser(email: email, password: password) { registeredUser in
                DispatchQueue.main.async {
                    let postsNavigationViewController = PostsNavigationViewController()
                    postsNavigationViewController.user = User(user_id: registeredUser.user_id, photo_id: registeredUser.photo_id)
                    self.hideActivityIndicator()
                    self.navigationController?.pushViewController(postsNavigationViewController, animated: true)
                }
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        showActivityIndicator()
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            /*
            Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            print("Successful sign in! \n userId: \(userId), idToken: \(idToken), fullName: \(fullName), givenName: \(givenName), familyName: \(familyName), email: \(email)")
             */
            let deadlineTime = DispatchTime.now() + 0.3 //Here is 0.3 second as per your requirement
            DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
                let postsNavigationViewController = PostsNavigationViewController()
                postsNavigationViewController.user = User(user_id: 1, photo_id: 1)
                self.hideActivityIndicator()
                self.navigationController?.pushViewController(postsNavigationViewController, animated: true)
            }
            
        }
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.loadingView = UIView()
            self.loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
            self.loadingView.center = self.view.center
            self.loadingView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            self.loadingView.alpha = 0.7
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10
            
            self.spinner = UIActivityIndicatorView(style: .whiteLarge)
            self.spinner.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.spinner.center = CGPoint(x:self.loadingView.bounds.size.width / 2, y:self.loadingView.bounds.size.height / 2)
            
            self.loadingView.addSubview(self.spinner)
            self.view.addSubview(self.loadingView)
            self.spinner.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.loadingView.removeFromSuperview()
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}


