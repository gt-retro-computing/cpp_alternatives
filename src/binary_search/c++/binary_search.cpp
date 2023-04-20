template <typename T>
int binary_search(T arr[], T key, int length) {
    int left = 0;
    int right = length;
    while (left < right) {
        int mid = (left + right) / 2;
        if (arr[mid] == key) return mid;
        if (arr[mid] < key) left = mid;
        if (arr[mid] > key) right = mid;
    }
    return -1;
}

int main() {
    return 0;
}