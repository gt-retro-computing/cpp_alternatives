package main

linear_search::proc($T: typeid, arr: [dynamic]T, key: T) {
    for val, i in arr {
        if val == key {
            return i;
        }
    }
    return -1;
}

main::proc() {}