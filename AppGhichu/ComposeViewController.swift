import UIKit

// MARK: - Gửi dữ liệu ngược lại
protocol ComposeViewControllerDelegate: AnyObject {
    func didSaveNote(title: String, body: String)
}

class ComposeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel! // 👈 UILabel hiển thị ngày

    // Delegate hoặc closure callback
    weak var delegate: ComposeViewControllerDelegate?
    var onSave: ((_ title: String, _ body: String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        titleTextField.textColor = .white
        bodyTextView.textColor = .white
        bodyTextView.backgroundColor = .clear
        bodyTextView.font = UIFont.systemFont(ofSize: 16)
        titleTextField.attributedPlaceholder = NSAttributedString(
            string: "Tiêu đề",
            attributes: [.foregroundColor: UIColor.gray]
        )

        setupDateLabel() // 👈 Gọi hàm để hiển thị ngày

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    // MARK: - Ẩn bàn phím
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    // MARK: - Thiết lập hiển thị ngày hiện tại
    func setupDateLabel() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "vi_VN") // hiển thị tiếng Việt
        formatter.dateFormat = "EEEE, 'ngày' d 'thg' M" // ví dụ: Thứ Năm, ngày 9 thg 10
        let currentDate = Date()
        let dateString = formatter.string(from: currentDate).capitalized
        dateLabel.text = dateString
        dateLabel.textColor = .white
    }

    // MARK: - Khi nhấn nút Xong
    @IBAction func doneButtonTapped(_ sender: Any) {
        let title = titleTextField.text ?? ""
        let body = bodyTextView.text ?? ""

        if title.isEmpty && body.isEmpty {
            showAlert(title: "Chưa có nội dung", message: "Vui lòng nhập ghi chú trước khi lưu.")
            return
        }

        // Gửi dữ liệu qua closure (ưu tiên)
        onSave?(title, body)

        // Hoặc dùng delegate
        delegate?.didSaveNote(title: title, body: body)

        // Hiển thị thông báo
        showAlert(title: "Đã lưu", message: "Ghi chú của bạn đã được lưu thành công!") {
            self.dismiss(animated: true, completion: nil)
        }
    }

    // MARK: - Hàm hiển thị thông báo
    func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            completion?()
        }))
        present(alert, animated: true, completion: nil)
    }
}

