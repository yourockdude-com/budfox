//
//  BCountriesViewController.swift
//  budfox
//
//  Created by Vladimir Psyukalov on 18.09.17.
//  Copyright © 2017 YOUROCK INC. All rights reserved.
//


import UIKit


protocol BCountriesViewControllerDelegate: class {
    
    func didSelectCountry(_ country: BCountry)
    
}


class BCountriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var countriesModel: BCountriesModel?
    
    weak var delegate: BCountriesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        countriesModel?.load { (success) in
            if (success) {
                self.tableView.reloadData()
            }
        }
    }
    
    func setup() {
        self.title = NSLocalizedString("t_countries", comment: "")
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.register(UINib(nibName: BCountryTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: BCountryTableViewCell.identifier)
        countriesModel = BCountriesModel.sharedModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesModel?.countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BCountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: BCountryTableViewCell.identifier, for: indexPath) as! BCountryTableViewCell
        if let countries = countriesModel?.countries {
            let country: BCountry = countries[indexPath.row]
            cell.name = country.name
            cell.code = country.code
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let countries = countriesModel?.countries {
            delegate?.didSelectCountry(countries[indexPath.row])
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
