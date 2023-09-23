import Foundation

class FilterPresenter {
    weak var viewController: FilterViewController?
    var delegate: TimeTableCoordinator?
    
    private var config: FilterConfig
    
    init(config: FilterConfig) {
        self.config = config
    }
    
    func getFilterConfig() -> FilterConfig {
        config
    }
    
    func saveFilterConfig(newConfig: FilterConfig) {
        delegate?.closeFilterScreen(newFilterConfig: newConfig)
    }
}
