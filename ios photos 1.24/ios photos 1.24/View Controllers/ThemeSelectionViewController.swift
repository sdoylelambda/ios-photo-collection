import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    var photoController = PhotoController()
    var themHelper: ThemeHelper?
    var photo: Photo?
    
    func setTheme() {
        guard let theme = ThemeHelper?.themePreference else { return }
        
        if theme = "Dark" {
            view.backgroundColor = .gray
        } else {
            view.backgroundColor = .white
        }
    }
    
}
