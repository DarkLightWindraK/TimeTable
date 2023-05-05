import UIKit

protocol TimeTableView: AnyObject {
    func showNewDate(date: String)
    func showLessons()
}

class TimeTableViewController: UIViewController, TimeTableView {
    var presenter: TimeTablePresenter?
    
    @IBOutlet private weak var scheduleCollectionView: UICollectionView!
    @IBOutlet private weak var infoDayLabel: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleCollectionView.register(
            UINib(
                nibName: Constants.cellID,
                bundle: nil
            ),
            forCellWithReuseIdentifier: Constants.cellID
        )
        scheduleCollectionView.delegate = self
        scheduleCollectionView.dataSource = self
        scheduleCollectionView.showsVerticalScrollIndicator = false
        scheduleCollectionView.showsHorizontalScrollIndicator = false
        scheduleCollectionView.backgroundColor = .secondarySystemBackground
        
        view.backgroundColor = .secondarySystemBackground
        
        presenter?.loadFirstState()
    }
    
    @IBAction func showPreviousDay(_ sender: UIBarButtonItem) {
        presenter?.showPreviousDay()
    }
    
    @IBAction func showNextDay(_ sender: UIBarButtonItem) {
        presenter?.showNextDay()
    }
    
    func showNewDate(date: String) {
        infoDayLabel.title = date
    }
    
    func showLessons() {
        scheduleCollectionView.reloadData()
    }
}

extension TimeTableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.lessons.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellID, for: indexPath) as? LessonViewCell,
            let lesson = presenter?.lessons[indexPath.row]
        else {
            return LessonViewCell()
        }
        
        cell.configure(lesson: lesson)
        return cell
    }
}

enum TestData {
    static func makeLessons() -> [Lesson] {
        var array: [Lesson] = []
        for i in 1...20 {
            let lesson = Lesson(number: i, beginOfLesson: "", endOfLesson: "", room: "\(i * ((1...5).randomElement() ?? 1))", name: "Предмет \(i)", teacher: "Преподаватель \(i)")
            array.append(lesson)
        }
        return array
    }
}

private extension TimeTableViewController {
    enum Constants {
        static let cellID = "LessonViewCell"
    }
}
