template <typename T>
void selection_sort(T arr[], int length) {
    for (int i = 0; i < arr.length; i++) {
        int min_idx = i;
        for (int j = 0; j < arr.length; j++) {
            if (arr[i] < (arr[min_idx])) {
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

int main() {
    return 0;
}