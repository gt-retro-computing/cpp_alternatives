class BinarySearch {
    public static <T extends Comparable<T>> int search(T[] arr, T key) {
        int left = 0;
        int right = arr.length;
        while (left < right) {
            int mid = (left + right) / 2;
            if (arr[mid].compareTo(key) == 0) return mid;
            if (arr[mid].compareTo(key) < 0) left = mid;
            if (arr[mid].compareTo(key) > 0) right = mid;
        }
        return -1;
    }
}