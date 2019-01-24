import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?

    @IBAction func darkThemePressed(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func lightThemePressed(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToLight()
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
}
