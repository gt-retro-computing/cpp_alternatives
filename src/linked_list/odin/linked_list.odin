package main

Node :: struct ($T : typeid) {
    data: T,
    next: Node(T),
    prev: Node(T)
}

LinkedList :: struct ($T: typeid) {
    head: Node(T),
    tail: Node(T),
    size: u32
}

is_empty :: proc ($T: typeid, list: LinkedList(T)) {
    return list.size == 0
}

add :: proc ($T: typeid, list: LinkedList(T), data: T) {
    curr : Node(T);
    curr . data = data

    // does this break because of mem scope
    if list.size == 0 {
        list . head = curr
        list . tail = curr
    } else {
        list . tail . next = curr
        curr . prev = list . tail
        list . tail = curr
    }
    size += 1
    return true;
}

get :: proc ($T: typeid, list : LinkedList(T), idx: u32) {
    curr := list . head
    for idx - 1 > 0 && curr != nil {
        curr = curr . next
    }
    if idx != 0 {
        return nil
    }
    return curr . data
}

insert :: proc ($T: typeid, list : LinkedList(T), idx: u32, data: T) {
    if idx < 0 || idx >= list . size {
        return false
    }
    curr := list . head

    for idx - 1 > 0 && curr != nil {
        curr = curr . next
    }
    if idx != 0 {
        return false
    }
    temp := curr . next
    next : Node(T)
    next . data = data
    curr . next = next
    next . prev = curr

    next . next = temp
    temp . prev = next
    return true
}

remove :: proc ($T : typeid, list : LinkedList(T), idx: u32) {
    if idx < 0 || idx >= list . size {
        return nil
    }
    curr := list . head 
    
    for idx - 1 > 0 && curr != nil {
        curr = curr . next
    }

    if idx != 0 {
        return nil
    }

    ret := curr . data

    curr . prev . next = curr . next
    curr . next . prev = curr . prev

    return ret
}

replace :: proc ($T: typeid, list : LinkedList(T), idx: u32, data: T) {
    if remove(T, list, idx) != nil {
        return insert(T, list, idx, data)
    }
    return false
}

// redundant in odin due to no oop
size :: proc ($T: typeid, list : LinkedList(T)) {
    return list . size;
}

// print :: proc ($T : typeid, list : LinkedList(T)) {
    
// }

main :: proc () {}