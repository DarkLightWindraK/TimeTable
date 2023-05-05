import UIKit

class LessonViewCell: UICollectionViewCell {
    @IBOutlet private weak var subjectLabel: UILabel!
    @IBOutlet private weak var teacherLabel: UILabel!
    @IBOutlet private weak var roomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingView()
    }
    
    func configure(lesson: Lesson) {
        subjectLabel.text = lesson.name
        teacherLabel.text = lesson.teacher
        roomLabel.text = "Аудитория: \(lesson.room)"
    }
}

private extension LessonViewCell {
    func settingView() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
}
