#include <stdio.h>
#include <string>
#include <string.h>
#include <cstring>
template <typename T> 
class Node {
    T data;
    Node<T> next;
    Node<T> prev;
};

template <typename T>
class LinkedList {
private:
    Node<T> head;
    Node<T> tail;
    int _size;
public:
    bool is_empty() {return _size == 0;}
    bool add(T data) {
        Node<T> curr = new Node<T>();
        curr.data = data;

        if (_size == 0) {
            head = tail = curr;
        } else {
            tail.next = curr;
            curr.prev = tail;
            tail = curr;
        }
        _size++;
        return true;
    }
    T get(int idx) {
        Node<T> curr = head;
        while (idx - 1 > 0 && curr != nullptr) {
            curr = curr.next;
        }
        if (idx != 0) return nullptr;
        return curr.data;
    }
    bool insert(int idx, T data) {
        if (idx < 0 || idx >= this._size) return false;
        Node<T> curr = head;
        while (idx - 1 > 0 && curr != nullptr) {
            curr = curr.next;
        }
        if (idx != 0) return false;
        Node<T> temp = curr.next;
        Node<T> next = new Node<T>();
        next.data = data;
        curr.next = next;
        next.prev = curr;

        next.next = temp;
        temp.prev = next;
        return true;
    }
    T remove(int idx) {
        if (idx < 0 || idx >= this._size) return nullptr;
        Node<T> curr = head;
        while (idx - 1 > 0 && curr != nullptr) {
            curr = curr.next;
        }
        if (idx != 0) return nullptr;
        Node<T> temp = curr.next;
        
        T ret = curr.data;
        curr.prev.next = curr.next;
        curr.next.prev = curr.prev;
        return ret;
    }
    bool replace(int idx, T data) {
        if (this.remove(idx) != nullptr) {
            return this.insert(idx, data);
        }
        return false;
    }
    int size() {
        return this._size;
    }
    // void print() {
    //     if (this._size < 1) {
    //         printf("[]\n");
    //         return;
    //     }
    //     var curr = head;
    //     printf("[");
    //     while (curr != nullptr) {
    //         printf("%s, ", curr.data);
    //         curr = curr.next;
    //     }
    //     System.out.println("]");
    // }
};

void assertAndPrint(int testNumber, bool expression) {
    printf(
            "Test %d: 'compiler complained about cstrings' -> %d\n", testNumber, expression
        );
}

// void arrEquals(int* a, int* b) 

int main() {
    // LinkedList<int> test1, test2, test3, test4, test5, test6, test7, test8, test9, test10, test11, test12, test13;
    // assertAndPrint(1, test1.is_empty());
    // assertAndPrint(2, test2.size() == 0);
    
    // test3.add(10);
    // assertAndPrint(3, Arrays.equals(test3List.toArr(), new Integer[]{10}));
        
    //     LinkedList<Integer> test4List = new LinkedList<Integer>();
    //     Integer output4 = test4List.remove(10);
    //     assertAndPrint("empty linked list - removing", 4, output4 == null);

    //     LinkedList<Integer> test5List = new LinkedList<Integer>();
    //     boolean output5 = test5List.insert(0, 10);
    //     assertAndPrint("empty linked list - inserting valid index", 5, output5 && Arrays.equals(test5List.toArr(), new Integer[]{10}));
        
    //     LinkedList<Integer> test6List = new LinkedList<Integer>();
    //     boolean output6 = test6List.insert(-1, 10);
    //     assertAndPrint("empty linked list - inserting invalid index negative", 6, !output6 && Arrays.equals(test6List.toArr(), new Integer[]{}));
        
    //     LinkedList<Integer> test7List = new LinkedList<Integer>();
    //     boolean output7 = test7List.insert(2, 10);
    //     assertAndPrint("empty linked list - inserting invalid index positive", 7, !output7 && Arrays.equals(test7List.toArr(), new Integer[]{}));
        
    //     LinkedList<Integer> test8List = new LinkedList<Integer>();
    //     boolean output8 = test8List.add(10);
    //     assertAndPrint("1 item linked list - head = tail", 8, output8 && test8List.head == test8List.tail && test8List.head.data == 10);

    //     LinkedList<Integer> test9List = new LinkedList<Integer>();
    //     test9List.add(10);
    //     assertAndPrint("1 item linked list - is_empty", 9, !test9List.is_empty());
        
    //     LinkedList<Integer> test10List = new LinkedList<Integer>();
    //     test10List.add(10);
    //     assertAndPrint("1 item linked list - size", 10, test10List.size() == 1);
        
    //     LinkedList<Integer> test11List = new LinkedList<Integer>();
    //     test11List.add(10);
    //     test11List.add(12);
    //     assertAndPrint("1 item linked list - adding", 11, Arrays.equals(test11List.toArr(), new Integer[]{10, 12}));
        
    //     LinkedList<Integer> test12List = new LinkedList<Integer>();
    //     test12List.add(10);
    //     test12List.remove(0);
    //     assertAndPrint("1 item linked list - removing", 12, Arrays.equals(test12List.toArr(), new Integer[]{}));
        
    //     LinkedList<Integer> test13List = new LinkedList<Integer>();
    //     test13List.add(10);
    //     test13List.insert(0, 12);
    //     assertAndPrint("1 item linked list - inserting", 13, Arrays.equals(test13List.toArr(), new Integer[]{12}));
    //     return 0;
}