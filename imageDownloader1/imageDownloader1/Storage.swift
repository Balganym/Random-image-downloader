//
//  Storage.swift
//  imageDownloader1
//
//  Created by mac on 28.06.17.
//  Copyright © 2017 mac. All rights reserved.
//

import Cache

// MARK: - caches
private struct Caches {
    static let imageCache = SpecializedCache<UIImage>(name: "image Cache")
}

// MARK: - keys
private struct Keys {
    static let image = "image"
}

struct Storage {
    
    // геттер и сеттер для картинки:)
    static var image: UIImage? {
        get {
            return Caches.imageCache.object(forKey: Keys.image)
        }
        set {
            if let curImage = newValue {
               try! Caches.imageCache.addObject(curImage, forKey: Keys.image)
            } else {
                try! Caches.imageCache.removeObject(forKey: Keys.image)
            }
        }
    }
}
