import UIKit

protocol TimeTableView: AnyObject {
    func showNewDate(date: String)
    func showLessons()
}

class TimeTableViewController: UIViewController, TimeTableView {
    var presenter: TimeTablePresenter?
    
    private lazy var scheduleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .secondarySystemBackground
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        
        self.view.backgroundColor = .systemBackground
        self.tabBarController?.tabBar.backgroundColor = .systemBackground
        
        presenter?.loadLessons()
    }
    
    @IBAction func showPreviousDay(_ sender: UIBarButtonItem) {
        presenter?.showPreviousDay()
    }
    
    @IBAction func showNextDay(_ sender: UIBarButtonItem) {
        presenter?.showNextDay()
    }
    
    func showNewDate(date: String) {
        //infoDayLabel.title = date
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

private extension TimeTableViewController {
    
    @objc func didFiltersButtonTap() {
        presenter?.showFiltersScreen()
    }
    
    func setupNavigationBar() {
        let navBarButton = UIBarButtonItem(
            image: Constants.navBarButtonImage,
            style: .plain,
            target: self,
            action: #selector(didFiltersButtonTap)
        )
        self.navigationItem.rightBarButtonItem = navBarButton
    }
    
    func setupCollectionView() {
        self.view.addSubview(scheduleCollectionView)
        scheduleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        scheduleCollectionView.register(
            UINib(
                nibName: Constants.cellID,
                bundle: nil
            ),
            forCellWithReuseIdentifier: Constants.cellID
        )
        NSLayoutConstraint.activate([
            scheduleCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scheduleCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scheduleCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scheduleCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    enum Constants {
        static let cellID = "LessonViewCell"
        static let navBarButtonImage = UIImage(systemName: "list.bullet.rectangle")
    }
}
