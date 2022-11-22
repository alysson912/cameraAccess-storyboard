//
//  CustomTableViewCell.swift
//  desafioTabbar
//
//  Created by ALYSSON DODO on 22/11/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    

    static  let identifier = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none // desabilita efeito  select cell
    }
    
    func setupCell(profile : Profile){
        userImageView.image = profile.photo
        nameLabel.text = profile.name
    }
}
