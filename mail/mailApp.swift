import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var hostnameField: NSTextField!
    @IBOutlet weak var portField: NSTextField!
    @IBOutlet weak var emailField: NSTextField!
    @IBOutlet weak var passwordField: NSTextField!
    @IBOutlet weak var recipientField: NSTextField!
    @IBOutlet weak var subjectField: NSTextField!
    @IBOutlet weak var bodyTextView: NSTextView!
    @IBOutlet weak var sendButton: NSButton!
    
    var emailManager: EmailManager?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendEmail(_ sender: Any) {
        // Lấy thông tin từ các trường nhập liệu
        let hostname = hostnameField.stringValue
        let port = UInt32(portField.stringValue) ?? 465 // Giá trị mặc định
        let username = emailField.stringValue
        let password = passwordField.stringValue
        let recipient = recipientField.stringValue
        let subject = subjectField.stringValue
        let body = bodyTextView.string
        
        // Khởi tạo EmailManager với thông tin người dùng nhập vào
        emailManager = EmailManager(hostname: hostname, port: port, username: username, password: password)

        emailManager?.sendEmail(to: recipient, subject: subject, body: body) { error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error sending email: \(error.localizedDescription)")
                } else {
                    print("Email sent successfully!")
                }
            }
        }
    }
}
