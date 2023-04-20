template <typename T>
int linear_search(T arr[], T key, int length) {
    for (int i = 0; i < length; i++) {
        if (arr[i] == key) return i;
    }
    return -1;
}

int main() {
    return 0;
}