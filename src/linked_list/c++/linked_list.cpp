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
        if (_size == 0) {
            curr.data = data;
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

int main() {
    return 0;
}