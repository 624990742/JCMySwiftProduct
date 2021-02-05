import UIKit


/// Mark - 冒泡算法
func bubbleSortMethod(_ nums: inout [Int]) {
    var iCount = 0;//记录外层循环的次数
    var jCount = 0;//记录内存循环交换的次数
    let n = nums.count
    for i in 0..<n {
        iCount += 1
        for j in 0..<(n - 1 - i) {
            jCount += 1
            if nums[j] > nums[j + 1] {
                nums.swapAt(j, j + 1)
                print(nums)
                print("============")
            }
        }
    }
    print("外层次数:\(iCount)","交换次数:\(jCount)")
}
 
var nums = [10,1,2,9,7,19,5,3,8,13,17]
bubbleSortMethod(&nums)
