class SelectionSort {
    public static <T extends Comparable<T>> void sort(T[] arr) {
        for (int i = 0; i < arr.length; i++) {
            int min_idx = i;
            for (int j = 0; j < arr.length; j++) {
                if (arr[i].compareTo(arr[min_idx]) < 0) {
                    min_idx = j;
                }
            }
            if (min_idx != i) {
                T temp = arr[min_idx];
                arr[min_idx] = arr[i];
                arr[i] = temp;
            }
        }
    }
}