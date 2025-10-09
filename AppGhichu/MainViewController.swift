import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var savedButton: UIButton! // Nút icon bạn tự tạo

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 13/255, green: 12/255, blue: 29/255, alpha: 1)

        // Cập nhật hiển thị ban đầu
        updateSavedCount()

        // Thêm hành động khi ấn nút icon
        savedButton.addTarget(self, action: #selector(openNoteDetail), for: .touchUpInside)
    }

    // MARK: - Cập nhật số lượng ghi chú
    func updateSavedCount() {
        let hasNote = UserDefaults.standard.string(forKey: "noteTitle") != nil

        if hasNote {
            // Hiển thị "1" bên cạnh icon
            savedButton.setTitle("  1", for: .normal)
        } else {
            // Không có ghi chú thì không hiện số
            savedButton.setTitle("", for: .normal)
        }
    }

    // MARK: - Khi ấn nút ➕ để tạo ghi chú mới
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let newPostVC = NewPostViewController(nibName: "NewPostViewController", bundle: nil)

        // Nhận dữ liệu sau khi lưu
        newPostVC.onSave = { [weak self] title, body in
            // Lưu ghi chú vào UserDefaults
            UserDefaults.standard.set(title, forKey: "noteTitle")
            UserDefaults.standard.set(body, forKey: "noteBody")

            // Cập nhật nút 💾 hiển thị số 1
            self?.updateSavedCount()
        }

        self.present(newPostVC, animated: true, completion: nil)
    }

    // MARK: - Khi ấn nút icon (đã lưu)
    @objc func openNoteDetail() {
        guard let title = UserDefaults.standard.string(forKey: "noteTitle"),
              let body = UserDefaults.standard.string(forKey: "noteBody") else {
            return
        }

        let detailVC = NoteDetailViewController(nibName: "NoteDetailViewController", bundle: nil)
        detailVC.noteTitleText = title
        detailVC.noteBodyText = body
        present(detailVC, animated: true)
    }
}


