import java.util.Arrays;

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
        curr.data = data;
        if (size == 0) {
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
        if (this.size == 1) {
            this.head = new Node<>();
            this.head.data = data;
            this.tail = this.head;
            this.size = 1;
            return true;
        }
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
        if (temp != null)
        temp.prev = next;
        return true;
    }
    public T remove(int idx) {
        if (idx < 0 || idx >= this.size) return null;
        if (this.size == 1) {
            T ret = this.head.data;
            this.head = null;
            this.tail = null;
            this.size = 0;
            return ret;
        }
        Node<T> curr = head;
        while (idx - 1 > 0 && curr != null) {
            curr = curr.next;
        }
        if (idx != 0) return null;
       
        T ret = curr.data;
        // if (curr.prev != null)
        curr.prev.next = curr.next;
        // if (curr.next != null)
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

    private T[] toArr() {
        T[] ret = (T[]) new Object[this.size];
        if (this.size == 0) return ret;
        Node<T> curr = this.head;
        for (int i = 0; i < size && curr != null; i++) {
            ret[i] = curr.data;
            curr = curr.next;
        }
        return ret;
    }

    // REQUIRES WORKING ADD METHOD
    private static LinkedList<Integer> fromArr(int[] arr) {
        LinkedList<Integer> ret = new LinkedList<Integer>();
        for (int i : arr) {
            ret.add(i);
        }
        return ret;
    }

    private static void assertAndPrint(String testName, int testNumber, boolean expression) {
        System.out.printf(
            "Test %d: %s -> %s%n", testNumber, testName, expression ? "Passed" : "Failed"
        );
    }

    public static void test() {
        assertAndPrint("empty linked list - is_empty", 1, new LinkedList<Integer>().is_empty());
        assertAndPrint("empty linked list - size", 2, new LinkedList<Integer>().size() == 0);

        LinkedList<Integer> test3List = new LinkedList<Integer>();
        test3List.add(10);
        assertAndPrint("empty linked list - size", 3, Arrays.equals(test3List.toArr(), new Integer[]{10}));
        
        LinkedList<Integer> test4List = new LinkedList<Integer>();
        Integer output4 = test4List.remove(10);
        assertAndPrint("empty linked list - removing", 4, output4 == null);

        LinkedList<Integer> test5List = new LinkedList<Integer>();
        boolean output5 = test5List.insert(0, 10);
        assertAndPrint("empty linked list - inserting valid index", 5, output5 && Arrays.equals(test5List.toArr(), new Integer[]{10}));
        
        LinkedList<Integer> test6List = new LinkedList<Integer>();
        boolean output6 = test6List.insert(-1, 10);
        assertAndPrint("empty linked list - inserting invalid index negative", 6, !output6 && Arrays.equals(test6List.toArr(), new Integer[]{}));
        
        LinkedList<Integer> test7List = new LinkedList<Integer>();
        boolean output7 = test7List.insert(2, 10);
        assertAndPrint("empty linked list - inserting invalid index positive", 7, !output7 && Arrays.equals(test7List.toArr(), new Integer[]{}));
        
        LinkedList<Integer> test8List = new LinkedList<Integer>();
        boolean output8 = test8List.add(10);
        assertAndPrint("1 item linked list - head = tail", 8, output8 && test8List.head == test8List.tail && test8List.head.data == 10);

        LinkedList<Integer> test9List = new LinkedList<Integer>();
        test9List.add(10);
        assertAndPrint("1 item linked list - is_empty", 9, !test9List.is_empty());
        
        LinkedList<Integer> test10List = new LinkedList<Integer>();
        test10List.add(10);
        assertAndPrint("1 item linked list - size", 10, test10List.size() == 1);
        
        LinkedList<Integer> test11List = new LinkedList<Integer>();
        test11List.add(10);
        test11List.add(12);
        assertAndPrint("1 item linked list - adding", 11, Arrays.equals(test11List.toArr(), new Integer[]{10, 12}));
        
        LinkedList<Integer> test12List = new LinkedList<Integer>();
        test12List.add(10);
        test12List.remove(0);
        assertAndPrint("1 item linked list - removing", 12, Arrays.equals(test12List.toArr(), new Integer[]{}));
        
        LinkedList<Integer> test13List = new LinkedList<Integer>();
        test13List.add(10);
        test13List.insert(0, 12);
        assertAndPrint("1 item linked list - inserting", 13, Arrays.equals(test13List.toArr(), new Integer[]{12}));
        
    }
}

class Test {
    public static void main(String[] args) {
        LinkedList.test();
    }
}