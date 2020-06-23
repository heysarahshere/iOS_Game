//
//  SettingsTableViewController.swift
//  Final Project
//
//  Created by Sarah covey on 12/1/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import UIKit


class SettingsTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var userSetting: GameSetting?;
    var defaultSetting: GameSetting?;
    var startNumber:Int = 1;
    var endNumber:Int = 1000;
    
    @IBOutlet weak var topCell: UIView!
    
    @IBOutlet var startNumberLabel: UILabel!
    @IBOutlet var endNumberLabel: UILabel!
    @IBOutlet var startNumberPicker: UIPickerView!
    @IBOutlet var endNumberPicker: UIPickerView!
    
    @IBOutlet var saveButton: UIBarButtonItem!
    let startNumberPickerCellIndexPath = IndexPath( row: 1, section: 0);
    let endNumberPickerCellIndexPath = IndexPath( row: 1, section: 1);
    
    var isStartNumberPickerShown: Bool = true {
        didSet {
            startNumberPicker.isHidden = !isStartNumberPickerShown;
        }
    }
    var isEndNumberPickerShown: Bool = true {
        didSet {
            endNumberPicker.isHidden = !isEndNumberPickerShown;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userSetting = GameSetting.loadFromFile() {
            startNumber = Int(userSetting.startNumber);
            endNumber = Int(userSetting.endNumber);
        } else if let defaultSetting = GameSetting.loadDefault() {
            startNumber = defaultSetting.startNumber;
            endNumber = defaultSetting.startNumber;
        } else {
            startNumber = 1;
            endNumber = 1000;
        }
        
        startNumberLabel.text = String(startNumber);
        endNumberLabel.text = String(endNumber);
        
        // set start picker
        var x = startNumber;
        var y = 0;
        var comp = 3;
        var ctr = 0;
        repeat {
        y = x % 10
        x = x / 10;
            startNumberPicker.selectRow(y, inComponent: comp, animated: false);
            comp = comp - 1;
            ctr = ctr + 1;
        } while ctr < 4
        
        
        // set end picker
        var a = endNumber;
        var b = 0;
        var comp2 = 3;
        var ctr2 = 0;
        repeat {
        b = a % 10
        a = a / 10;
            endNumberPicker.selectRow(b, inComponent: comp2, animated: false);
            comp2 = comp2 - 1;
            ctr2 = ctr2 + 1;
        } while ctr2 < 4
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (startNumberPickerCellIndexPath.section, startNumberPickerCellIndexPath.row):
            return isStartNumberPickerShown ? 244.0 : 0.0
       case (endNumberPickerCellIndexPath.section, endNumberPickerCellIndexPath.row):
            return isEndNumberPickerShown ? 244.0 : 0.0
        case (0, 0):
            return 50.0;
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              tableView.deselectRow(at: indexPath, animated: true)
              
              switch (indexPath.section, indexPath.row) {

               case (startNumberPickerCellIndexPath.section, startNumberPickerCellIndexPath.row - 1):
                   if isStartNumberPickerShown {
                       isStartNumberPickerShown = false
                   } else if isEndNumberPickerShown {
//                       isEndNumberPickerShown = false
                       isStartNumberPickerShown = true
                   } else {
                       isStartNumberPickerShown = true
                   }
                   
                   tableView.beginUpdates()
                   tableView.endUpdates()
                   
               case (endNumberPickerCellIndexPath.section, endNumberPickerCellIndexPath.row - 1):
                   if isEndNumberPickerShown {
                       isEndNumberPickerShown = false
                   } else if isStartNumberPickerShown {
//                       isStartNumberPickerShown = false
                       isEndNumberPickerShown = true
                   } else {
                       isEndNumberPickerShown = true
                   }
                   
                   tableView.beginUpdates()
                   tableView.endUpdates()
               
              default:
                  break
              }

          }

    
    // -MARK: UIPickerView DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return 2;
        } else {
            return 10;
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        
        if pickerView == startNumberPicker {
            
            
            if startNumberPicker.selectedRow(inComponent: 0) == 1{
                
                startNumberPicker.selectRow(1, inComponent: 0, animated: true)
                startNumberPicker.selectRow(0, inComponent: 3, animated: true)
                startNumberPicker.selectRow(0, inComponent: 1, animated: true)
                startNumberPicker.selectRow(0, inComponent: 2, animated: true)
            }
            var startNumber: Int = startNumberPicker.selectedRow(inComponent: 3)
            startNumber += startNumberPicker.selectedRow(inComponent: 0) * 1000
            startNumber += startNumberPicker.selectedRow(inComponent: 1) * 100
            startNumber += startNumberPicker.selectedRow(inComponent: 2) * 10
            startNumberLabel.text = "\(startNumber)"
            
        } else if pickerView == endNumberPicker{

            if endNumberPicker.selectedRow(inComponent: 0) == 1{
                
                endNumberPicker.selectRow(1, inComponent: 0, animated: true)
                endNumberPicker.selectRow(0, inComponent: 3, animated: true)
                endNumberPicker.selectRow(0, inComponent: 1, animated: true)
                endNumberPicker.selectRow(0, inComponent: 2, animated: true)
            }

            var endNumber: Int = endNumberPicker.selectedRow(inComponent: 3)
            endNumber += endNumberPicker.selectedRow(inComponent: 0) * 1000
            endNumber += endNumberPicker.selectedRow(inComponent: 1) * 100
            endNumber += endNumberPicker.selectedRow(inComponent: 2) * 10
            
            
            endNumberLabel.text = "\(endNumber)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
       return String(row)
        
        
    }

    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        print(endNumber)
        print(startNumber)

        var startNumber: Int = startNumberPicker.selectedRow(inComponent: 3)
        startNumber += startNumberPicker.selectedRow(inComponent: 0) * 1000
        startNumber += startNumberPicker.selectedRow(inComponent: 1) * 100
        startNumber += startNumberPicker.selectedRow(inComponent: 2) * 10
        var endNumber: Int = endNumberPicker.selectedRow(inComponent: 3)
        endNumber += endNumberPicker.selectedRow(inComponent: 0) * 1000
        endNumber += endNumberPicker.selectedRow(inComponent: 1) * 100
        endNumber += endNumberPicker.selectedRow(inComponent: 2) * 10
        if startNumber < endNumber {
                //save defaults
            let userSetting = GameSetting(startNumber: startNumber, endNumber: endNumber);
            GameSetting.saveToFile(gameSetting: userSetting)
                // leave picker
        self.dismiss(animated: true, completion: nil);
            
            } else {
                newAlert();
            }
            
    
    }
    
    func newAlert() {
        let alert = UIAlertController(title: "Error", message: "Start number must be lower than end number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
   
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation



}
