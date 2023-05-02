enum LessonMapper {
    static func transformToLesson(lessons: [LessonModel]) -> [Lesson] {
        lessons.map { model in
            Lesson(
                number: model.number,
                beginOfLesson: model.beginOfLesson,
                endOfLesson: model.endOfLesson,
                room: model.room,
                name: model.name,
                teacher: model.teacher)
        }
    }
}
