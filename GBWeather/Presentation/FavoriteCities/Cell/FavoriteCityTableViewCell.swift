//
//  FavoriteCityTableViewCell.swift
//  GBWeather
//
//  Created by Stanislav Belykh on 09.08.2021.
//

import UIKit

class FavoriteCityTableViewCell: UITableViewCell {

	static let identifier = "FavoriteCityTableViewCell"

	@IBOutlet private var imageCell: UIImageView!
	@IBOutlet private var lableCell: UILabel!

	func configure(imageName: String?, title: String) {
		imageCell.image = UIImage(named: "CityWether")
		lableCell.text = title
	}
}
