//
//  PickerTableViewCell.swift
//  Final Project
//
//  Created by Sarah covey on 12/1/19.
//  Copyright © 2019 Sarah covey. All rights reserved.
//

import UIKit

class PickerTableViewCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
        return 1000
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return String(row)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
