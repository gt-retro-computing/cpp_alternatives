import java.util.Arrays;
class BubbleSort {
    public static <T extends Comparable<T>> T[] sort(T[] arr) {
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr.length - i - 1; j++) {
                if (arr[j].compareTo(arr[j+1]) > 0) {
                    T temp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = temp;
                }
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
        assertAndPrint("Empty Array", 1, Arrays.equals(BubbleSort.sort(new Integer[]{}), new Integer[]{}));
        assertAndPrint("Sorted Array", 2, Arrays.equals(BubbleSort.sort(new Integer[]{0, 1, 3, 5, 6, 7, 8}), new Integer[]{0, 1, 3, 5, 6, 7, 8}));
        assertAndPrint("One element array", 3, Arrays.equals(BubbleSort.sort(new Integer[]{1}), new Integer[]{1}));
        assertAndPrint("Random Array", 4, Arrays.equals(BubbleSort.sort(new Integer[]{6, 1, 9, -4, 7, 32, -6}), new Integer[]{-6, -4, 1, 6, 7, 9, 32}));
        assertAndPrint("Array with repetition", 5, Arrays.equals(BubbleSort.sort(new Integer[]{7, 2, -4, 2, 23, 2, 2, 6}), new Integer[]{-4, 2, 2, 2, 2, 6, 7, 23}));
    }
}