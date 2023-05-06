import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

class BinarySearch {
    public static <T extends Comparable<T>> int search(T[] arr, T key) {
        int left = 0;
        int right = arr.length;
        if (arr.length == 1) return arr[0].compareTo(key) == 0 ? 0 : -1;
        while (left < right) {
            int mid = (left + right) / 2;
            if (arr[mid].compareTo(key) == 0) return mid;
            if (arr[mid].compareTo(key) < 0) left = mid;
            if (arr[mid].compareTo(key) > 0) right = mid;
        }
        return -1;
    }

    private static void assertAndPrint(String testName, int testNumber, boolean expression) {
        System.out.printf(
            "Test %d: %s -> %s%n", testNumber, testName, expression ? "Passed" : "Failed"
        );
    }

    public static void main(String[] args) throws FileNotFoundException {
        assertAndPrint("Empty List", 1, 
        BinarySearch.search(new Integer[]{}, 0) == -1
    );
            assertAndPrint("Element present in List", 2,
        BinarySearch.search(new Integer[]{1, 3, 5, 7}, 3) == 1
    );
            assertAndPrint("Element present in list with one Element", 3,
        BinarySearch.search(new Integer[]{1}, 1) == 0
    );
            assertAndPrint("Element absent in list with one element", 4,
        BinarySearch.search(new Integer[]{1}, 3) == -1
    );
            assertAndPrint("Element present at the end of the list", 5,
        BinarySearch.search(new Integer[]{1, 3, 5, 7, 9, 10}, 10) == 5
    );
            assertAndPrint("List with negative numbers and negative key", 6,
        BinarySearch.search(new Integer[]{-5, -4, -2, 0, 3, 5, 12}, -2) == 2
    );
            assertAndPrint("List with negative numbers and positive key", 7,
        BinarySearch.search(new Integer[]{-5, -4, -2, 0, 3, 5, 12}, 3) == 4
    );
    }
}