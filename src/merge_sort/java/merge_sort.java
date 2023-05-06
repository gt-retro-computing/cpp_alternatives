import java.util.Arrays;
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
                    temp_idx--;
                }
                arr[left] = temp;
                left++;
                mid++;
                next_start++;
            }
        }
    }
    private static <T extends Comparable<T>> void boundsHelper(T[] arr, int left, int right) {
        if (right - left > 0) {
            int mid = left + ((right - left) / 2);
            boundsHelper(arr, left, mid);
            boundsHelper(arr, mid + 1, right);
            mergeHelper(arr, left, right, mid);
        }
    }
    public static <T extends Comparable<T>> T[] sort(T[] arr) {
        boundsHelper(arr, 0, arr.length - 1);
        return arr;
    }
    

    public static void assertAndPrint(String testName, int testNumber, boolean expression) {
        System.out.printf(
            "Test %d: %s -> %s%n", testNumber, testName, expression ? "Passed" : "Failed"
        );
    }

    public static void main(String[] args) {
        assertAndPrint("Empty Array", 1, Arrays.equals(MergeSort.sort(new Integer[]{}), new Integer[]{}));
        assertAndPrint("Sorted Array", 2, Arrays.equals(MergeSort.sort(new Integer[]{0, 1, 3, 5, 6, 7, 8}), new Integer[]{0, 1, 3, 5, 6, 7, 8}));
        assertAndPrint("One element array", 3, Arrays.equals(MergeSort.sort(new Integer[]{1}), new Integer[]{1}));
        assertAndPrint("Random Array", 4, Arrays.equals(MergeSort.sort(new Integer[]{6, 1, 9, -4, 7, 32, -6}), new Integer[]{-6, -4, 1, 6, 7, 9, 32}));
        assertAndPrint("Array with repetition", 5, Arrays.equals(MergeSort.sort(new Integer[]{7, 2, -4, 2, 23, 2, 2, 6}), new Integer[]{-4, 2, 2, 2, 2, 6, 7, 23}));
    }
}