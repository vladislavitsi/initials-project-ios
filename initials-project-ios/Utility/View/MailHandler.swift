//
//  MailHandler.swift
//  initials-project-ios
//
//  Created by Uladzislau Kleshchanka on 6/15/18.
//  Copyright © 2018 Uladzislau Kleshchanka. All rights reserved.
//

import UIKit
import MessageUI

class MailHandler: MFMailComposeViewController, MFMailComposeViewControllerDelegate  {
    
    private static let MAIL_SUBJECT = "Handkr. Initials image"
    private static let MIME_TYPE_IMAGE = "image/png"
    private static let MAIN_DEFAULT_FILE_NAME = "initialsImage"
    
    class func mailComposeViewControllerForImage(_ image: UIImage, name: String) -> MailHandler {
        let mailHandler = MailHandler()
        mailHandler.mailComposeDelegate = mailHandler
        
        mailHandler.setSubject(MAIL_SUBJECT)
        mailHandler.setMessageBody(name, isHTML: false)
        if let attachmentData = UIImagePNGRepresentation(image)  {
            mailHandler.addAttachmentData(attachmentData, mimeType: MIME_TYPE_IMAGE, fileName: MAIN_DEFAULT_FILE_NAME)
        }
        return mailHandler
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("Mail cancelled")
        case .saved:
            print("Mail saved")
        case .sent:
            print("Mail sent")
        case .failed:
            print("Mail sent failed: \(String(describing: error?.localizedDescription))")
        }
        
        dismiss(animated: true, completion: nil)
    }
}
