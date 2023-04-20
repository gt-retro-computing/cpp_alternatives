package linked_list.java;

class Node <T> {
    public T data;
    public Node<T> next;
    public Node<T> prev;
}

class LinkedList<T> {
    private Node<T> head;
    private Node<T> tail;
    private int size;
    public LinkedList() {}
    public boolean is_empty() {return size == 0;}
    public boolean add(T data) {
        Node<T> curr = new Node<>();
        if (size == 0) {
            curr.data = data;
            head = tail = curr;
        } else {
            tail.next = curr;
            curr.prev = tail;
            tail = curr;
        }
        size++;
        return true;
    }
    public T get(int idx) {
        Node<T> curr = head;
        while (idx - 1 > 0 && curr != null) {
            curr = curr.next;
        }
        if (idx != 0) return null;
        return curr.data;
    }
    public boolean insert(int idx, T data) {
        if (idx < 0 || idx >= this.size) return false;
        Node<T> curr = head;
        while (idx - 1 > 0 && curr != null) {
            curr = curr.next;
        }
        if (idx != 0) return false;
        Node<T> temp = curr.next;
        Node<T> next = new Node<>();
        next.data = data;
        curr.next = next;
        next.prev = curr;

        next.next = temp;
        temp.prev = next;
        return true;
    }
    public T remove(int idx) {
        if (idx < 0 || idx >= this.size) return null;
        Node<T> curr = head;
        while (idx - 1 > 0 && curr != null) {
            curr = curr.next;
        }
        if (idx != 0) return null;
        Node<T> temp = curr.next;
        
        T ret = curr.data;
        curr.prev.next = curr.next;
        curr.next.prev = curr.prev;
        return ret;
    }
    public boolean replace(int idx, T data) {
        if (this.remove(idx) != null) {
            return this.insert(idx, data);
        }
        return false;
    }
    public int size() {
        return this.size;
    }
    public void print() {
        if (this.size < 1) {
            System.out.println("[]");
            return;
        }
        var curr = head;
        System.out.print("[");
        while (curr != null) {
            System.out.printf("%s, ", curr.data);
            curr = curr.next;
        }
        System.out.println("]");
    }
}