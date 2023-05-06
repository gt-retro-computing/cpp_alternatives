import java.util.Arrays;


class SelectionSort {
    public static <T extends Comparable<T>> T[] sort(T[] arr) {
        for (int i = 0; i < arr.length; i++) {
            int min_idx = i;
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[min_idx].compareTo(arr[j]) > 0) {
                    min_idx = j;
                }
            }
            if (min_idx != i) {
                T temp = arr[min_idx];
                arr[min_idx] = arr[i];
                arr[i] = temp;
            }
        }
        return arr;
    }

    
    

    public static void assertAndPrint(String testName, int testNumber, boolean expression) {
        System.out.printf(
            "Test %d: %s -> %s%n", testNumber, testName, expression ? "Passed" : "Failed"
        );
    }

    public static void main(String[] args) {
        assertAndPrint("Empty Array", 1, Arrays.equals(SelectionSort.sort(new Integer[]{}), new Integer[]{}));
        assertAndPrint("Sorted Array", 2, Arrays.equals(SelectionSort.sort(new Integer[]{0, 1, 3, 5, 6, 7, 8}), new Integer[]{0, 1, 3, 5, 6, 7, 8}));
        assertAndPrint("One element array", 3, Arrays.equals(SelectionSort.sort(new Integer[]{1}), new Integer[]{1}));
        assertAndPrint("Random Array", 4, Arrays.equals(SelectionSort.sort(new Integer[]{6, 1, 9, -4, 7, 32, -6}), new Integer[]{-6, -4, 1, 6, 7, 9, 32}));
        assertAndPrint("Array with repetition", 5, Arrays.equals(SelectionSort.sort(new Integer[]{7, 2, -4, 2, 23, 2, 2, 6}), new Integer[]{-4, 2, 2, 2, 2, 6, 7, 23}));
    }
}