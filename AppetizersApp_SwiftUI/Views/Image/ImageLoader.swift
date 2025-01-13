//
//  AppetizerRemoteImage.swift
//  AppetizersApp_SwiftUI
//
//  Created by Ritika Gupta on 13/01/25.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = Image(.foodPlaceholder)
    
    func loadImage(fromUrlString urlString: String) {
        NetworkManager.shared.downloadImage(fromUrlString: urlString) { uiimage in
            guard let uiimage = uiimage else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiimage)
            }
        }
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var remoteImageLoader = ImageLoader()
    var urlString: String
    
    var body: some View {
        remoteImageLoader.image?
        .resizable()
        .aspectRatio(contentMode: .fit)
            .onAppear {
                remoteImageLoader.loadImage(fromUrlString: urlString)
            }
    }
}

/*
 final class ImageLoader: ObservableObject {
     @Published var downloadedImage: Image?
     
     func downloadImage(fromURLString: String) {
         guard  downloadedImage == nil else {
             return
         }
         print(fromURLString)
         NetworkManager.shared.downloadImage(fromURLString: fromURLString) { image in
             guard let image = image else {
                 return
             }
             
             DispatchQueue.main.async {
                 self.downloadedImage = Image(uiImage: image)
             }
         }
     }
 }

 struct RemoteImage: View {
     var image: Image?
     
     var body: some View {
         image?.resizable() ?? Image(uiImage: .foodPlaceholder).resizable()
     }
 }

 struct AppetizerRemoteImage: View {
     @StateObject var imageloader = ImageLoader()
     let urlString: String
     
     var body: some View {
         RemoteImage(image: imageloader.downloadedImage)
             .onAppear {
                 imageloader.downloadImage(fromURLString: urlString)
             }
     }
 } 
 */
