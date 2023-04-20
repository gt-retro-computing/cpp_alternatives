template <typename T>
void bubble_sort(T arr[], int length) {
    for (int i = 0; i < length; i++) {
        for (int j = 0; j < length - i - 1; j++) {
            if (arr[j] > (arr[j+1])) {
                T temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}

int main() {
    return 0;
}