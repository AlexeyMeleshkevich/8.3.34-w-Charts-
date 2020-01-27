import UIKit
import RealmSwift
import MessageUI

class TaskViewController: UIViewController {
    
    
    let textLabel1 = UILabel()
    let textLabel2 = UILabel()
    let textLabel3 = UILabel()
    
    var message = String()
    var emailAdress = String()
    
    var resultLabel = UILabel()
    
    var textField1 = UITextField()
    var textField2 = UITextField()
    
    var countButton = UIButton(type: .roundedRect)
    var sendButton = UIButton(type: .roundedRect)
    
    var values: Results<Values>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "8.3.34"
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.hideKeyboardWhenTappedAround()
        
        
        setUI()
        
        view.backgroundColor = UIColor.white
        
        countButton.addTarget(self, action: #selector(countButtonPressed), for: .touchDown)
        sendButton.addTarget(self, action: #selector(sendMailAction), for: .touchDown)
    }
    
    @objc func countButtonPressed(sender: UIButton){
        if textField1.text!.isEmpty || textField2.text!.isEmpty {
            if textField1.text!.isEmpty {
                let alert = UIAlertController(title: Constants.EMPTY_STRING, message: "Enter R", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .cancel)
                alert.addAction(alertAction)
                present(alert, animated: true)
            }
            if textField2.text!.isEmpty {
                let alert = UIAlertController(title: Constants.EMPTY_STRING, message: "Enter I", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .cancel)
                alert.addAction(alertAction)
                present(alert, animated: true)
                
            }
            
        } else {
            let resistance = Double(textField1.text!)
            let amperage = Double(textField2.text!)
            let result = calculateResult()
            
            let newData = Values(resistance: resistance!, amperage: amperage!, result: result)
            StorageManager.saveData(values: newData)
        }
        
    }
    
    func setUI() {
        createTextLabel1()
        createTextLabel2()
        createTextLabel3()
        createResultLabel()
        createTextField1()
        createTextField2()
        createCountButton()
        sendDataButton()
    }
    
    func createResultLabel(){
        let frame = CGRect(x: 150, y: 230, width: 300, height: 20)
        resultLabel.frame = frame
        view.addSubview(resultLabel)
    }
    
    func createCountButton(){
        let frame = CGRect(x: 70, y: 300, width: 120, height: 70)
        countButton.frame = frame
        
        
        countButton.layer.cornerRadius = countButton.frame.size.height / 2
        countButton.layer.borderWidth = 2
        countButton.layer.borderColor = UIColor.blue.cgColor
        countButton.setTitle("Count", for: .normal)
        countButton.setTitleColor(.blue, for: .normal)
        
        //        countButton.sizeToFit()
        view.addSubview(countButton)
    }
    
    // MARK: - VALUE LABELS
    func createTextLabel1(){
        textLabel1.text = "R ="
        let frameText = CGRect(x: 30, y: 100, width: 20, height: 20)
        textLabel1.frame = frameText
        textLabel1.sizeToFit()
        view.addSubview(textLabel1)
    }
    
    func createTextLabel2(){
        textLabel2.text = "I ="
        let frameText = CGRect(x: 30, y: 160, width: 80, height: 25)
        textLabel2.frame = frameText
        view.addSubview(textLabel2)
    }
    
    func createTextLabel3(){
        let frame = CGRect(x: 30, y: 230, width: 100, height: 20)
        textLabel3.frame = frame
        textLabel3.text = Constants.MAX_POWER_STRING
        textLabel3.sizeToFit()
        view.addSubview(textLabel3)
    }
    
    func sendDataButton() {
        let frame = CGRect(x: 200, y: 300, width: 120, height: 70)
        sendButton.frame = frame
        
        
        sendButton.layer.cornerRadius = sendButton.frame.size.height / 2
        sendButton.layer.borderWidth = 2
        sendButton.layer.borderColor = UIColor.blue.cgColor
        sendButton.setTitle("Send Email", for: .normal)
        sendButton.setTitleColor(.blue, for: .normal)
        
        //        countButton.sizeToFit()
        view.addSubview(sendButton)
    }
    
    
    // mark end
    // MARK: - ENTER VALUE FIELDS
    func createTextField1(){
        let frameText = CGRect(x: 65, y: 100, width: 130, height: 25)
        textField1 = UITextField(frame: frameText)
        textField1.placeholder = "enter R here"
        textField1.borderStyle = .roundedRect
        textField1.autocorrectionType = .no
        
        view.addSubview(textField1)
    }
    
    func createTextField2(){
        let frameText = CGRect(x: 65, y: 160, width: 130, height: 25)
        textField2 = UITextField(frame: frameText)
        textField2.placeholder = "enter I here"
        textField2.borderStyle = .roundedRect
        textField2.autocorrectionType = .no
        
        view.addSubview(textField2)
    }
    //mark end
    
    func calculateResult() -> Double {
        
        let resistance = Double(textField1.text!)!
        let amperage = Double(textField2.text!)!
        
        let result: Double = pow(amperage,2) * resistance
        resultLabel.text = String(result)
        return result
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func sendMailAction(sender: UIButton) {
        loginAlert()
    }
    
    func loginAlert() {
        
        let alertController = UIAlertController(title: "Send Email",
                                                message: nil,
                                                preferredStyle: .alert)
        
        alertController.addTextField { (usernameTF) in
            usernameTF.placeholder = "Enter email here"
            
            //            if usernameTF.hasText == true {
            //                self.emailAdress = usernameTF.text!
            //            }
            
        }
        
        let okayAC = UIAlertAction(title: "Ok", style: .default) { (okayAC) in
            if MFMailComposeViewController.canSendMail() {
                
                let controller = MFMailComposeViewController()
                
                
                controller.mailComposeDelegate = self
                if let textField: UITextField = alertController.textFields?.first{
                    controller.setToRecipients([textField.text!])
                }
                
                self.values = realm.objects(Values.self)
                
                self.message = """
                Result: \(self.values.last!.result)
                Resistance: \(self.values.last!.resistance)
                Amperage: \(self.values.last!.amperage)
                """
                controller.setSubject("Task results")
                controller.setMessageBody(self.message, isHTML: false)
                
                
                self.present(controller, animated: true, completion: nil)
            } else {
                return
            }
        }
        
        
        let cancelAC = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okayAC)
        alertController.addAction(cancelAC)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
//    func createMessageBody() {
//        
//        values = realm.objects(Values.self)
//        for i in 0..<values.count {
//            dataSet1.append(ChartDataEntry(x: Double(i), y: values[i].result))
//            self.message = 
//        }
//        
//    }
    
    
}

extension TaskViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            controller.dismiss(animated: true)
        }
        
        switch result {
        case .cancelled:
            print("cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email sent")
        default:
            return
        }
        controller.dismiss(animated: true)
    }
    
}
