import UIKit

class LessonViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingView()
    }
    
    func configure(lesson: Lesson) {
//        let data = "Пара: \(lesson.number)\nПредмет: \(lesson.name)\nПреподаватель: \(lesson.teacher)\nАудитория: \(lesson.room)"
//        let attributedString = NSMutableAttributedString(string: data)
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 4
//        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
//        lessonInfoLabel.attributedText = attributedString
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
