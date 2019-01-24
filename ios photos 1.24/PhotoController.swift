import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func createPhoto(image imageData: Data, title: String) {
        let photo = Photo(imageData:imageData, title: title)
        photos.append(photo)
    }
    
    func update(updatePhoto photo: Photo, image: Data, title: String) {
        guard let index = photos.index(of: photo) else { return }
        var updatePhoto = photo
        updatePhoto.imageData = image
        updatePhoto.title = title
        photos[index] = updatePhoto
    }
}
