//
//  DetailStuCollecView.swift
//  AddStuAll
//
//  Created by Jaimin Solanki on 12/11/22.
//

import UIKit

class DetailStuCollecView: UIViewController {
    
    var appdel = UIApplication.shared.delegate as! AppDelegate
    

    @IBOutlet weak var lblnm: UILabel!
    @IBOutlet weak var lblroll: UILabel!
    @IBOutlet weak var lblgend: UILabel!
    @IBOutlet weak var lblmarks: UILabel!
    
    @IBOutlet weak var outletFirst: UIButton!
    @IBOutlet weak var OutletNext: UIButton!
    @IBOutlet weak var outletPrev: UIButton!
    @IBOutlet weak var outletLast: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let selectedRow = appdel.Stuarray[appdel.selectedCollIndex]
        
        lblnm.text = (selectedRow.value(forKey: "name") as! String)
        lblroll.text = (selectedRow.value(forKey: "roll") as! String)
        lblgend.text = (selectedRow.value(forKey: "gender") as! String)
        lblmarks.text = (selectedRow.value(forKey: "marks") as! String)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actFirst(_ sender: Any) {
        
        outletPrev.isEnabled = false
        OutletNext.isEnabled = true
        outletLast.isEnabled = true
        
        let SingleRow = appdel.Stuarray[0]
        
        lblnm.text = (SingleRow.value(forKey: "name") as! String)
        lblroll.text = (SingleRow.value(forKey: "roll") as! String)
        lblgend.text = (SingleRow.value(forKey: "gender") as! String)
        lblmarks.text = (SingleRow.value(forKey: "marks") as! String)
    }
    
    @IBAction func actNext(_ sender: Any) {
    }
    
    @IBAction func actPrev(_ sender: Any) {
    }
    
    @IBAction func actLast(_ sender: Any) {
        
        outletPrev.isEnabled = true
        OutletNext.isEnabled = false
        outletFirst.isEnabled = true
        
        let cnt = appdel.Stuarray.count
        let SingleRow = appdel.Stuarray[cnt-1]
        
        lblnm.text = (SingleRow.value(forKey: "name") as! String)
        lblroll.text = (SingleRow.value(forKey: "roll") as! String)
        lblgend.text = (SingleRow.value(forKey: "gender") as! String)
        lblmarks.text = (SingleRow.value(forKey: "marks") as! String)
        
        
    }
    
    @IBAction func actDelete(_ sender: Any) {
        
        let managedContext = appdel.persistentContainer.viewContext
        
        managedContext.delete(appdel.Stuarray[appdel.selectedCollIndex])
        
        do {
            try managedContext.save()
        } catch let err as NSError {
            print(err)
        }
        
        appdel.Stuarray.remove(at: appdel.selectedCollIndex)
        
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
