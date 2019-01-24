import Foundation

class ThemeHelper {
    
    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        } else { return }
    }

    let themePreferenceKey: String = "key"


    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
}
