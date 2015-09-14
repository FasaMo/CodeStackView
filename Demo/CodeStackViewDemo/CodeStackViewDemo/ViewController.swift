//
//  ViewController.swift
//  CodeStackViewDemo
//
//  Created by Fasa Mo on 15/9/14.
//  Copyright © 2015年 FasaMo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var didSetupConstraints = false

    var photoStackView = UIStackView(axis: .Vertical, distribution: .FillEqually)
    
    var infoStackView = UIStackView(axis: .Vertical, alignment: .Leading, spacing: 0)
    
    var infoTopStackView = UIStackView(axis: .Horizontal, alignment: .FirstBaseline, spacing: 20)
    
    var infoButtonsStackView = UIStackView(axis: .Horizontal, spacing: 5)
    
    let images = ["nature-1", "nature-2", "nature-3"]
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Nature"
        titleLabel.font = UIFont.systemFontOfSize(30)
        return titleLabel
    }()
    
    let descLabel: UILabel = {
        let descLabel = UILabel()
        descLabel.text = "A collection of nature photos from magdeleine.co"
        descLabel.numberOfLines = 0
        return descLabel
    }()
    
    let likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.setTitle("Like", forState: .Normal)
        likeButton.setTitleColor(.redColor(), forState: .Normal)
        return likeButton
    }()

    let shareButton: UIButton = {
        let shareButton = UIButton()
        shareButton.setTitle("Share", forState: .Normal)
        shareButton.setTitleColor(.redColor(), forState: .Normal)
        return shareButton
    }()
}

// MARK: LifeCircle
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add Subviews
        infoButtonsStackView.addArrangedSubview(self.likeButton)
        infoButtonsStackView.addArrangedSubview(self.shareButton)
        
        infoTopStackView.addArrangedSubview(titleLabel)
        infoTopStackView.addArrangedSubview(infoButtonsStackView)
        
        infoStackView.addArrangedSubview(infoTopStackView)
        infoStackView.addArrangedSubview(descLabel)
        
        view.addSubview(infoStackView)
        
        for imageName in self.images {
            let imageView = UIImageView()
            imageView.contentMode = .ScaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: imageName)
            photoStackView.addArrangedSubview(imageView)
        }
        
        view.addSubview(photoStackView)
        
        // Trigger
        view.setNeedsUpdateConstraints()
    }
}

// MARK: UpdateViewConstraints
extension ViewController {
    override func updateViewConstraints() {
        if !didSetupConstraints {
            let padding = CGFloat(8.0)
            
            view.addConstraint(photoStackView.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 20))
            view.addConstraint(photoStackView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: padding * 2))
            view.addConstraint(photoStackView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor,  constant: -padding * 2))
            view.addConstraint(photoStackView.heightAnchor.constraintEqualToAnchor(view.heightAnchor, multiplier: 0.7))
            
            view.addConstraint(infoStackView.topAnchor.constraintEqualToAnchor(photoStackView.bottomAnchor, constant: padding))
            view.addConstraint(infoStackView.leadingAnchor.constraintEqualToAnchor(photoStackView.leadingAnchor))
            view.addConstraint(infoStackView.trailingAnchor.constraintEqualToAnchor(photoStackView.trailingAnchor))
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
}