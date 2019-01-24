
import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photo? {
        didSet{
            updateViews()
        }
    }
    
    
    func updateViews() {
        guard let photo = photo else { return }
        
        textLabel.text = photo.title
        imageView.image = UIImage(data: photo.imageData)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
}
