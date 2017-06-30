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
    static let imageCache = SpecializedCache<UIImage>(name: "Image Cache")
}

// MARK: - keys
private struct Keys {
    static let image = "Image"
}

struct Storage {
    
    // геттер и сеттер для картинки:)
    static var image: UIImage? {
        get {
            return Caches.imageCache.object(forKey: Keys.image)
        }
        set {
            if let curImage = newValue {
                Caches.imageCache.async.addObject(curImage, forKey: Keys.image)
            } else {
                Caches.imageCache.async.removeObject(forKey: Keys.image)
            }
        }
    }
}
