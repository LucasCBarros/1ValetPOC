//
//  ConfigurationViewController.swift
//  1ValetPOC
//
//  Created by Lucas C Barros on 16/04/22.
//

import UIKit

class ConfigurationViewController: UIViewController {

    @IBOutlet weak var profilePhoto: UIImageView!

    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profilePhone: UILabel!
    @IBOutlet weak var profileLink: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        profileName.text = "Lucas C. Barros"
        profilePhone.text = "LucasCavalcanteDeBarros@gmail.com"
        profileLink.text = "www.Linked.com/LucasCBarros"

        profilePhoto.layer.borderWidth = 5
        profilePhoto.layer.masksToBounds = false
        profilePhoto.layer.borderColor = UIColor.white.cgColor
        profilePhoto.layer.cornerRadius = profilePhoto.frame.height/2
        profilePhoto.clipsToBounds = true
    }
    
    // MARK: - View Code Implementation
    /// From this line down I was starting to implement this view using View Code
    /// to avoid the use of Storyboards that may cause a lot a conflicts and make
    /// it harder to work in teams.
    
    private let profileDetailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.isHidden = true
        return stackView
    }()
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "configBackground")
        return imageView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LucasProfile")
        return imageView
    }()
    
    private let profileNameLabel: UILabel = {
        let textLabel = UILabel()
        return textLabel
    }()
    private let profilePhoneLabel: UILabel = {
        let textLabel = UILabel()
        return textLabel
    }()
    private let profileLinkLabel: UILabel = {
        let textLabel = UILabel()
        return textLabel
    }()
}

// MARK: View Code methods
extension ConfigurationViewController {
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
    
    func setupUI() {
        setupHierarchy()
        setupConstraints()
        setupAdditionalConfigs()
    }
    
    func setupHierarchy() {
        view.addSubview(headerImageView)
        view.addSubview(profileDetailStackView)
        view.addSubview(profileImageView)
        headerImageView.addSubview(profileNameLabel)
        headerImageView.addSubview(profilePhoneLabel)
        headerImageView.addSubview(profileLinkLabel)
    }

    func setupConstraints() {
        setupProfilePhotoConstraints()
        setupHeaderImageConstraints()
        setupTextContainerConstraints()
    }

    func setupAdditionalConfigs() {
        profileNameLabel.text = "Lucas C. Barros"
        profilePhoneLabel.text = "+1 (604) 790 1323"
        profileLinkLabel.text = "www.linkedin.com/in/lucascbarros"
        
        profileImageView.layer.borderWidth = 5
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
    }
    
    func setupProfilePhotoConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -50),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150),
            profileImageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 150)
        ])
    }
    
    func setupHeaderImageConstraints() {
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200)
        ])
    }
    
    func setupTextContainerConstraints() {
        profileDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileDetailStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileDetailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileDetailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            profileDetailStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 300)
        ])
    }
}
