//
//  DetailStuTableView.swift
//  AddStuAll
//
//  Created by Jaimin Solanki on 12/11/22.
//

import UIKit

class DetailStuTableView: UIViewController {
    
    var appdel = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRoll: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblMarks: UILabel!
    
    @IBOutlet weak var outFirst: UIButton!
    @IBOutlet weak var outNext: UIButton!
    @IBOutlet weak var outPrev: UIButton!
    @IBOutlet weak var outLast: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let selectedRow = appdel.Stuarray[appdel.selectedIndex]
        
        lblName.text = (selectedRow.value(forKey: "name") as! String)
        lblRoll.text = (selectedRow.value(forKey: "roll") as! String)
        lblGender.text = (selectedRow.value(forKey: "gender") as! String)
        lblMarks.text = (selectedRow.value(forKey: "marks") as! String)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Actfirst(_ sender: Any) {
        
        outPrev.isEnabled = false
        outNext.isEnabled = true
        outLast.isEnabled = true
        
        let SingleRow = appdel.Stuarray[0]
        
        lblName.text = (SingleRow.value(forKey: "name") as! String)
        lblRoll.text = (SingleRow.value(forKey: "roll") as! String)
        lblGender.text = (SingleRow.value(forKey: "gender") as! String)
        lblMarks.text = (SingleRow.value(forKey: "marks") as! String)
    }
    
    @IBAction func ActNext(_ sender: Any) {
    }
    
    @IBAction func ActPrev(_ sender: Any) {
    }
    
    @IBAction func ActLast(_ sender: Any) {
        
        outPrev.isEnabled = true
        outNext.isEnabled = false
        outFirst.isEnabled = true
        
        let cnt = appdel.Stuarray.count
        let SingleRow = appdel.Stuarray[cnt-1]
        
        lblName.text = (SingleRow.value(forKey: "name") as! String)
        lblRoll.text = (SingleRow.value(forKey: "roll") as! String)
        lblGender.text = (SingleRow.value(forKey: "gender") as! String)
        lblMarks.text = (SingleRow.value(forKey: "marks") as! String)
    }
    
    @IBAction func ActDelete(_ sender: Any) {
        
        let ManagedContext = appdel.persistentContainer.viewContext
        
        ManagedContext.delete(appdel.Stuarray[appdel.selectedIndex])
        
        do {
            try ManagedContext.save()
        } catch let err as NSError {
            print(err)
        }
        
        appdel.Stuarray.remove(at: appdel.selectedIndex)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
