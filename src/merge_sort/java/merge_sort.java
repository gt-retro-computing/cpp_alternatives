class MergeSort {
    private static <T extends Comparable<T>> void mergeHelper(T[] arr, int left, int right, int mid) {
        int next_start = mid + 1;
        if (arr[mid].compareTo(arr[next_start]) <= 0) return;
        while (left <= mid && next_start <= right) {
            if (arr[left].compareTo(arr[next_start]) <= 0) {
                left++;
            } else {
                T temp = arr[next_start];
                int temp_idx = next_start;

                while (temp_idx != left) {
                    arr[temp_idx] = arr[temp_idx -1];
                    temp_idx += 1;
                }
                arr[left] = temp;
                left++;
                mid++;
                right++;
            }
        }
    }
    private static <T extends Comparable<T>> void boundsHelper(T[] arr, int left, int right) {
        if (left < right) {
            int mid = left + (right - left) / 2;
            boundsHelper(arr, left, mid);
            boundsHelper(arr, mid, right);
            mergeHelper(arr, left, right, mid);
        }
    }
    public static <T extends Comparable<T>> void sort(T[] arr) {
        boundsHelper(arr, 0, arr.length - 1);
    }
}