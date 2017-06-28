//
//  ViewController.swift
//  imageDownloader1
//
//  Created by mac on 21.06.17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - variables
    private let url = "https://unsplash.it/1080/1920/?random"
    
    // MARK: - outlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!
    
    // MARK: - actions
    // если в кэше есть картинка, удаляем ее, и загружаем новый или удаляем старый и загружаем новый
    @IBAction private func getNewImage(_ sender: UIBarButtonItem) {
        if Storage.image != nil {
            Storage.image = nil
        }
        getImage()
    }
    
    // просто очищаем кэш
    @IBAction private func clearCache(_ sender: UIBarButtonItem) {
        Storage.image = nil
    }
    
    // MARK: - internal functions
    // достаем картинку с кэша, если там есть; иначе, картинку загружаем и сохраняем
    private func getImage() {
        spinner.startAnimating()
        if Storage.image != nil {
            spinner.stopAnimating()
            imageView.image = Storage.image
        } else {
            ImageDownloader.fetchImage(with: url) {image in
                Storage.image = image
                self.getImage()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        getImage()
    }

}

