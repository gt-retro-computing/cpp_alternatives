template <typename T>
void __merge_sort_helper_merge(T arr[], int left, int right, int mid) {
    int next_start = mid + 1;
    if (arr[mid] <= arr[next_start]) return;

    while (left <= mid && next_start <= right) {
        if (arr[left] <= arr[next_start]) {
            left += 1;
        } else {
            T temp = arr[next_start];
            int temp_idx = next_start;

            while (temp_idx != left) {
                arr[temp_idx] = arr[temp_idx - 1];
                temp_idx += 1;
            }
            arr[left] = temp;
            left += 1;
            mid += 1;
            right += 1;
        }
    }
}

template <typename T>
void __merge_sort_helper_bounds(T arr[], int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2;
        __merge_sort_helper_bounds(arr, left, mid);
        __merge_sort_helper_bounds(arr, mid, right);
        __merge_sort_helper_merge(arr, left, right, mid);
    }
}

template <typename T>
void merge_sort(T arr[], int length) {
    __merge_sort_helper_bounds(arr, 0, length - 1);
}

int main() {
    return 0;
}