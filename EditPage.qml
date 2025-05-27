import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Page {
    id: root
    property int noteIndex: -1  // -1 = новая заметка

    TextField {
        id: titleField
        placeholderText: "Заголовок"
        text: noteIndex >= 0 ? notesModel.get(noteIndex).title : ""
    }

    TextArea {
        id: contentField
        placeholderText: "Текст заметки"
        text: noteIndex >= 0 ? notesModel.get(noteIndex).content : ""
    }

    Button {
        text: "Сохранить"
        onClicked: {
            if (noteIndex >= 0) {
                // Обновляем существующую заметку
                notesModel.set(noteIndex, {
                    title: titleField.text,
                    content: contentField.text
                })
            } else {
                // Добавляем новую
                notesModel.append({
                    title: titleField.text,
                    content: contentField.text
                })
            }
            stackView.pop()  // Возвращаемся назад
        }
    }
}
