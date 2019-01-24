import UIKit

class PhotosDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    var photoController = PhotoController()
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        
        if theme == "Dark" {
            view.backgroundColor = .gray
        } else {
            view.backgroundColor = .white
        }
    }
    
    func updateViews() {
        setTheme()
        
        if let photo = photo {
            navigationItem.title = "Edit Photo"
            imageView?.image = UIImage(data: photo.imageData)
            textField?.text = photo.title
        } else {
            navigationItem.title = "Add Photo"
        }
    }
    
    func presentImagePickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else { return }
        imageView.image = image
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addPhoto(_ sender: UIButton) {
        presentImagePickerController()
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        guard let title = textField.text else { return }
        guard let image = imageView.image else { return }
        guard let imageData = image.pngData() else { return }
        
        if let photo = photo {
            photoController.update(updatePhoto: photo, image: imageData, title: title)
        } else {
            photoController.createPhoto(image: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
        
    }
}

