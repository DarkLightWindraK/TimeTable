import Foundation

enum Flag {
    case isFirstLaunch
}

//TODO: Исправить весь кринж ниже

class FlagStorage {
    private let storage = UserDefaults.standard
    
    init() {
        if storage.object(forKey: "\(Flag.isFirstLaunch.self)") == nil {
            isFirstLaunchFlag = true
        }
    }
    
    var isFirstLaunchFlag: Bool {
        get {
            getValueByFlag(flag: Flag.isFirstLaunch)
        }
        set {
            setValueByFlag(flag: Flag.isFirstLaunch, value: newValue)
        }
    }
    
}

private extension FlagStorage {
    func getValueByFlag(flag: Flag) -> Bool {
        storage.bool(forKey: "\(flag.self)")
    }
    
    func setValueByFlag(flag: Flag, value: Bool) {
        storage.set(value, forKey: "\(flag.self)")
    }
}
