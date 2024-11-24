import Foundation
import MailCore

class EmailManager {
    let smtpSession: MCOSMTPSession

    init(hostname: String, port: UInt32, username: String, password: String) {
        smtpSession = MCOSMTPSession()
        smtpSession.hostname = hostname
        smtpSession.port = port
        smtpSession.username = username
        smtpSession.password = password
        smtpSession.connectionType = .TLS
    }

    func sendEmail(to: String, subject: String, body: String, completion: @escaping (Error?) -> Void) {
        let mail = MCOMessageBuilder()
        mail.header.from = MCOAddress(displayName: "Your Name", mailbox: smtpSession.username)
        mail.header.to = [MCOAddress(displayName: "", mailbox: to)]
        mail.header.subject = subject
        mail.htmlBody = body

        let rfc822Data = mail.data()
        let sendOperation = smtpSession.sendOperation(with: rfc822Data)

        sendOperation.start { (error) in
            completion(error)
        }
    }
}
