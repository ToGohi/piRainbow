//
//  MainViewController+TableView.swift
//  piRainbow
//
//  Created by Antonio Gonzalez Hidalgo on 23/05/2020.
//  Copyright © 2020 Antonio Gonzalez Hidalgo. All rights reserved.
//

import UIKit

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return colors.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
    let piColor = colors[indexPath.row]
    cell.backgroundColor = piColor.uiColor()
    cell.textLabel?.text = piColor.title
    cell.textLabel?.textColor = piColor.uiColor().inverse
    return cell
  }

}

extension MainViewController: UITableViewDataSourcePrefetching {

  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {

    for indexPath in indexPaths where indexPath.row == colors.count - 10 {
      currentPage += 1
      interactor?.getPiNumbers(request: Main.PiNumbers.Request(start: start, numberOfDigits: sizePerPage))
      break
    }

  }

}
