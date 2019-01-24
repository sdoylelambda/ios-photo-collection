import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotosCollectionViewCell
        
        // Configure the cell
        let photo = photoController.photos[indexPath.item]
        cell.imageView.image = UIImage(data: photo.imageData)
        cell.textLabel.text = photo.title
        
        return cell
    }
    
    func setTheme() {
        guard let theme = themeHelper.themePreference else { return }
        
        if theme == "Dark" {
            collectionView.backgroundColor = .gray
        } else {
            collectionView.backgroundColor = .white
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailVC = segue.destination as? PhotosDetailViewController {
            detailVC.photoController = photoController
            detailVC.themeHelper = themeHelper
            
            if segue.identifier == "MoreInfo" {
                
                guard let index = collectionView?.indexPathsForSelectedItems?.first?.item else { return }
                let photo = photoController.photos[index]
                detailVC.photo = photo
                
            } else if segue.identifier == "AddPhoto"{
                // need something here?
            }
        }
        
        if let themeVC = segue.destination as? ThemeSelectionViewController {
            themeVC.themeHelper = themeHelper
        }
    }
}
