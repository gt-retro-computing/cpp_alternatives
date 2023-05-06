import java.io.FileNotFoundException;

class LinearSearch {
    public static <T extends Comparable<T>> int search(T[] arr, T key) {
        for (int i = 0; i < arr.length; i++) {
            if (arr[i].compareTo(key) == 0) return i;
        }
        return -1;
    } 
    

    public static void assertAndPrint(String testName, int testNumber, boolean expression) {
        System.out.printf(
            "Test %d: %s -> %s%n", testNumber, testName, expression ? "Passed" : "Failed"
        );
    }

    public static void main(String[] args) throws FileNotFoundException {
        assertAndPrint("Empty List", 1, 
        LinearSearch.search(new Integer[]{}, 0) == -1
    );
            assertAndPrint("Element present in List", 2,
        LinearSearch.search(new Integer[]{1, 3, 5, 7}, 3) == 1
    );
            assertAndPrint("Element present in list with one Element", 3,
        LinearSearch.search(new Integer[]{1}, 1) == 0
    );
            assertAndPrint("Element absent in list with one element", 4,
        LinearSearch.search(new Integer[]{1}, 3) == -1
    );
            assertAndPrint("Element present at the end of the list", 5,
        LinearSearch.search(new Integer[]{1, 3, 5, 7, 9, 10}, 10) == 5
    );
            assertAndPrint("List with negative numbers and negative key", 6,
        LinearSearch.search(new Integer[]{-5, -4, -2, 0, 3, 5, 12}, -2) == 2
    );
            assertAndPrint("List with negative numbers and positive key", 7,
        LinearSearch.search(new Integer[]{-5, -4, -2, 0, 3, 5, 12}, 3) == 4
    );
    }
}