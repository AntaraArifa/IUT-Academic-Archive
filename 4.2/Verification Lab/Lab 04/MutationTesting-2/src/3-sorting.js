function insertionSort(arr) {
    let n = arr.length;
        for (let i = 1; i < n; i++) {
            let current = arr[i];
            let j = i-1; 
            while ((j > -1) && (current < arr[j])) {
                arr[j+1] = arr[j];
                j--;
            }
            arr[j+1] = current;
        }
    return arr;
}

console.log(insertionSort([2,1,4,3]))
module.exports = {
    insertionSort
}