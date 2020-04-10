//
//  Card.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright © 2020 Ricardo Bailoni. All rights reserved.
//

import UIKit

class Card: UIView {
    private lazy var contentImage: UIView = {
        return UIView()
    }()
    
    private lazy var imageView: UIImageView = {
        return UIImageView()
    }()
    
    private lazy var spinner: UIActivityIndicatorView = {
        return UIActivityIndicatorView(style: .whiteLarge)
    }()
    
    var imagePath: String? {
        didSet {
            DispatchQueue.main.async {
                self.imageView.image = nil
                self.spinner.startAnimating()
            }
            HearthstoneAPI.shared.getImage(path: self.imagePath ?? "") { [weak self] image in
                DispatchQueue.main.async {
                    self?.spinner.stopAnimating()
                    self?.imageView.image = image
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewCodeSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Card: ViewCodeProtocol {
    func viewHierarchySetup() {
        addSubview(spinner)
        addSubview(contentImage)
        contentImage.addSubview(imageView)
    }
    
    func viewConstraintSetup() {
        setConstraintsSpinner()
        setConstraintsContentImage()
        setConstraintsImageView()
    }
    
    private func setConstraintsSpinner() {
        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func setConstraintsContentImage() {
        contentImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func setConstraintsImageView() {
        imageView.topAnchor.constraint(equalTo: contentImage.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentImage.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentImage.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentImage.trailingAnchor).isActive = true
    }
    
    func viewThemeSetup() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .preto
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        contentImage.translatesAutoresizingMaskIntoConstraints = false
        contentImage.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
    }
}
