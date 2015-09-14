//
//  UIStackView+NewAutoLayoutView.swift
//  CodeStackViewDemo
//
//  Created by Fasa Mo on 15/9/14.
//  Copyright © 2015年 FasaMo. All rights reserved.
//

import UIKit

extension UIStackView {
    convenience init(axis: UILayoutConstraintAxis, distribution: UIStackViewDistribution = .Fill, alignment: UIStackViewAlignment = .Fill, spacing: CGFloat = 8) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
}