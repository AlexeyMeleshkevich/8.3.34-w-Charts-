import UIKit
import RealmSwift

class TaskViewController: UIViewController {
    
    let textLabel1 = UILabel()
    let textLabel2 = UILabel()
    let textLabel3 = UILabel()
    var resultLabel = UILabel()
    var textField1 = UITextField()
    var textField2 = UITextField()

    var values: Results<Values>!
    
    var countButton = UIButton(type: .roundedRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "8.3.34"
        
        createTextLabel1()
        createTextLabel2()
        createTextLabel3()
        createResultLabel()
        createTextField1()
        createTextField2()
        createCountButton()
        
        countButton.addTarget(self, action: #selector(countButtonPressed), for: .touchDown)
    }
    
    @objc func countButtonPressed(sender: UIButton){
        if textField1.text!.isEmpty || textField2.text!.isEmpty {
            if textField1.text == ""{
                let alert = UIAlertController(title: Constants.EMPTY_STRING, message: "Enter R", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Ok", style: .cancel)
                alert.addAction(alertAction)
                present(alert, animated: true)
            }
            if textField2.text == ""{
                let alert = UIAlertController(title: "", message: "Enter I", preferredStyle: .alert)
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
    func createResultLabel(){
        let frame = CGRect(x: 150, y: 300, width: 300, height: 20)
        resultLabel.frame = frame
        view.addSubview(resultLabel)
    }
    
    func createCountButton(){
        let frame = CGRect(x: 185, y: 250, width: 80, height: 50)
        countButton.frame = frame
        
        countButton.setTitle("Count", for: .normal)
        countButton.setTitleColor(.blue, for: .normal)
        
        countButton.sizeToFit()
        view.addSubview(countButton)
    }
    // MARK: VALUE LABELS
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
    let frame = CGRect(x: 30, y: 300, width: 100, height: 20)
        textLabel3.frame = frame
        textLabel3.text = Constants.MAX_POWER_STRING
        textLabel3.sizeToFit()
        view.addSubview(textLabel3)
    }
    // mark end
    // MARK: ENTER VALUE FIELDS
    func createTextField1(){
        let frameText = CGRect(x: 65, y: 100, width: 130, height: 25)
        textField1 = UITextField(frame: frameText)
        textField1.placeholder = "enter R here"
        textField1.borderStyle = .roundedRect
        view.addSubview(textField1)
    }
    
    func createTextField2(){
        let frameText = CGRect(x: 65, y: 160, width: 130, height: 25)
        textField2 = UITextField(frame: frameText)
        textField2.placeholder = "enter I here"
        textField2.borderStyle = .roundedRect
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
}
