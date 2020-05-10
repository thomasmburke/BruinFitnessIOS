//
//  TestListView.swift
//  ios
//
//  Created by Tom Burke on 5/6/20.
//  Copyright © 2020 Bruin Fitness. All rights reserved.
//

import SwiftUI

struct TestListView: View {
    
    @ObservedObject var testListVM = TestListViewModel()
    
    var body: some View {
        List {
            ForEach (testListVM.testCellViewModels) { testCellVM in
                TestCell(testCellVM: testCellVM)
            }
        }
    }
}

struct TestListView_Previews: PreviewProvider {
    static var previews: some View {
        TestListView()
    }
}


struct TestCell: View {
    @ObservedObject var testCellVM: TestCellViewModel
    var body: some View {
        HStack {
            Text(testCellVM.test.title)
            Text(testCellVM.test.desc)
        }
    }
}
