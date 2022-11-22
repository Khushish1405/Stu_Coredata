//
//  ViewController.swift
//  AddStuAll
//
//  Created by Jaimin Solanki on 11/11/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var appdel = UIApplication.shared.delegate as! AppDelegate
    
    var Gender = ""
    var Marks = 0.0
    

    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtroll: UITextField!
    @IBOutlet weak var txtgender: UISwitch!
    @IBOutlet weak var SlidMarks: UISlider!
    @IBOutlet weak var txtMarksValue: UILabel!
    @IBOutlet weak var imgboy: UIImageView!
    @IBOutlet weak var imggirl: UIImageView!
    
    @IBOutlet weak var Slid1: UISlider!
    @IBOutlet weak var Slid2: UISlider!
    @IBOutlet weak var Slid3: UISlider!
    @IBOutlet weak var txtShow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SwitchAct(_ sender: Any) {
        
        if txtgender.isOn {
            imgboy.isHidden = true
            imggirl.isHidden = false
            Gender = "Female"
        }
        else{
            imgboy.isHidden = false
            imggirl.isHidden = true
            Gender = "Male"
        }
    }
    
    @IBAction func SlidAct(_ sender: Any) {
        
        Marks = Double(SlidMarks.value)
        txtMarksValue.text = "Marks : \(SlidMarks.value)"
    }
    
    @IBAction func BgClrAct(_ sender: Any) {
        
        let ValueRed = Slid1.value
        let ValueGreen = Slid2.value
        let ValueBlue = Slid3.value
        
        self.view.backgroundColor = UIColor(red: CGFloat(ValueRed/255.0), green: CGFloat(ValueGreen/255.0), blue: CGFloat(ValueBlue/255.0), alpha: 1.0)
        
        appdel.selectedClr = self.view.backgroundColor
    }
    
    
    @IBAction func ActSave(_ sender: Any) {
        
        if (txtname.text == "" && txtroll.text == "") {
            txtShow.text = "Plz Enter Details..."
        }
        else{
            
            let ManagedContext = appdel.persistentContainer.viewContext
            
            let entityStudent = NSEntityDescription.entity(forEntityName: "Student", in: ManagedContext)
            
            let ManagedObject = NSManagedObject(entity: entityStudent!, insertInto: ManagedContext)
            
            ManagedObject.setValue(txtname.text, forKey: "name")
            ManagedObject.setValue(txtroll.text, forKey: "roll")
            ManagedObject.setValue(Gender, forKey: "gender")
            ManagedObject.setValue(String(Marks), forKey: "marks")
            
            do {
                try ManagedContext.save()
            } catch let err as NSError {
                print(err)
            }
            
            txtShow.text = "Data Added..."
            
            print(ManagedObject)
        }
            
        }
    
}

