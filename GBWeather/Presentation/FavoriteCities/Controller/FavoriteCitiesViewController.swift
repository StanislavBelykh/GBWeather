//
//  FavoriteCitiesViewController.swift
//  GBWeather
//
//  Created by Stanislav Belykh on 09.08.2021.
//

import UIKit

class FavoriteCitiesViewController: UIViewController {
	@IBOutlet var tableView: UITableView!

	let cities = ["Москва", "Краснодар", "Сочи"]

    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
    }

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "moveToWeather" {
			let destinationVC = segue.destination
			guard
				let indexSelectCell = tableView.indexPathForSelectedRow?.row
			else { return }

			destinationVC.title = cities[indexSelectCell]
		}
	}
}

extension FavoriteCitiesViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		cities.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCityTableViewCell.identifier) as! FavoriteCityTableViewCell

		cell.configure(imageName: "CityWether", title: cities[indexPath.row])
		return cell
	}
}
