class LinearSearch {
    public static <T extends Comparable<T>> int search(T[] arr, T key) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i].compareTo(key) == 0) return i;
        }
        return -1;
    } 
}