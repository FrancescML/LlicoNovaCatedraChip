# Sorting algorithms

## Selection Sort

```c++
template <typename T>
void sel_sort (vector<T>& v) {
    const int n = v.size();
    for (int i = 0; i < n - 1; ++i) {
        const int p = pos_min(v, i, n-1);
        swap(v[i], v[p]);
}   }


template <typename T>
int pos_min (vector<T>& v, int l, int r) {
    int p = l;
    for (int j = l + 1; j <= r; ++j) {
        if (v[j] < v[p]) {
            p = j;
    }   }
    return p;
}
```

## Insertion Sort (v1)

```c++
template <typename T>
void ins_sort_1 (vector<T>& v) {
    const int n = v.size();
    for (int i = 1; i < n; ++i) {
        for (int j = i; j > 0 and v[j - 1] > v[j]; --j) {
            swap(v[j - 1], v[j]);
}   }   }
```

## Insertion Sort (v2)

Avoids swap-chaining: instead of doing swaps, tht elements are
shifted to the right (this improves from three assignments per
iteration to one).

```c++
template <typename T>
void ins_sort_2 (vector<T>& v) {
    const int n = v.size();
    for (int i = 1; i < n; ++i) {
        const T x = v[i];
        int j;
        for (j = i; j > 0 and v[j - 1] > x; --j) {
            v[j] = v[j - 1];
        }
        v[j] = x;
}   }
```

## Insertion Sort (v3)

In order to avoid the final test at each iteration, the smallest element is first
placed at the first position of the table.

```c++
template <typename T>
void ins_sort_3 (vector<T>& v) {
    const int n = v.size();
    swap(v[0], v[pos_min(v, 0, n-1)]);
    for (int i = 2; i < n; ++i) {
        const T x = v[i];
        int j;
        for (j = i; v[j - 1] > x; --j) {
            v[j] = v[j - 1];
        }
        v[j] = x;
}   }
```

## Bubblesort

```c++
template <typename T>
void bubble_sort (vector<T>& v) {
    const int n = v.size();
    for (int i = 0; i < n - 1; ++i) {
        for (int j = n - 1; j > i; --j) {
            if (v[j - 1] > v[j]) {
                swap(v[j - 1], v[j]);
}   }   }   }
```

## Heapsort with ADT

```c++
template <typename T>
void heap_sort_0 (vector<T>& v) {
    const int n = v.size();
    priority_queue<T> pq;
    for (int i = 0; i < n; ++i) {
        pq.push(v[i]);
    }
    for (int i = n - 1; i >= 0; --i) {
        v[i] = pq.top();
        pq.pop();
}   }
```

## Heapsort

```c++
template <typename T>
void heap_sort (vector<T>& v) {
    const int n = v.size();
    make_heap(v);
    for (int i = n - 1; i >= 1; --i) {
        swap(v[0], v[i]);
        sink(v, i, 0);
}   }


template <typename T>
void make_heap (vector<T>& v) {
    const int n = v.size();
    for (int i = n/2 - 1; i >= 0; i--) {
        sink(v, n, i);
}   }


template <typename T>
void sink (vector<T>& v, int n, int i) {
    const T x = v[i];
    int c = 2*i + 1;
    while (c < n) {
        if (c+1 < n and v[c] < v[c + 1]) c++;
        if (x >= v[c]) break;
        v[i] = v[c];
        i = c;
        c = 2*i + 1;
    }
    v[i] = x;
}
```

## Mergesort (v1)

```c++
template <typename T>
void merge_sort_1 (vector<T>& v) {
    merge_sort_1(v, 0, v.size() - 1);
}


template <typename T>
void merge_sort_1 (vector<T>& v, int l, int r) {
    if (l < r) {
        const int m = (l + r) / 2;
        merge_sort_1(v, l, m);
        merge_sort_1(v, m + 1, r);
        merge(v, l, m, r);
}   }


template <typename T>
void merge (vector<T>& v, int l, int m, int r) {
    vector<T> b(r - l + 1);
    int i = l;
    int j = m + 1;
    int k = 0;
    while (i <= m and j <= r) {
        if (v[i] <= v[j]) b[k++] = v[i++];
        else b[k++] = v[j++];
    }
    while (i <= m) b[k++] = v[i++];
    while (j <= r) b[k++] = v[j++];
    for (k = 0; k <= r - l; ++k) v[l + k] = b[k];
}
```

## Mergesort (v2)

Cuts the recursion when the subvector is "small enough" at which
point it uses insertion sort.

```c++
template <typename T>
void merge_sort_2 (vector<T>& v) {
    merge_sort_2(v, 0, v.size() - 1);
}


template <typename T>
void merge_sort_2 (vector<T>& v, int l, int r) {
    const int CRITICAL_SIZE = 50;
    if (r - l < CRITICAL_SIZE) {
        ins_sort(v, l, r);
    } else {
        const int m = (l + r) / 2;
        merge_sort_2(v, l, m);
        merge_sort_2(v, m + 1, r);
        merge(v, l, m, r);
}   }
```

## Mergesort with bottom-up merging

```c++
template <typename T>
void merge_sort_bu (vector<T>& v) {
    const int n = v.size();
    for (int m = 1; m < n; m *= 2) {
        for (int i = 0; i < n - m; i += 2*m) {
            merge(v, i, i + m - 1, min(i + 2 * m - 1, n - 1));
}   }   }
```

## Quicksort with Hoare's partition (v1)

```c++
template <typename T>
void quick_sort_1 (vector<T>& v) {
    quick_sort_1(v, 0, v.size() - 1);
}


template <typename T>
void quick_sort_1 (vector<T>& v, int l, int r) {
    if (l < r) {
        const int q = partition(v, l, r);
        quick_sort_1(v, l, q);
        quick_sort_1(v, q + 1, r);
}   }


template <typename T>
int partition (vector<T>& v, int l, int r) {
    const T x = v[l];
    int i = l - 1;
    int j = r + 1;
    for (;;) {
        while (x < v[--j]);
        while (v[++i] < x);
        if (i >= j) return j;
        swap(v[i], v[j]);
}   }
```

## Quicksort (v2)

Pivot is selected at random.

```c++
template <typename T>
void quick_sort_2 (vector<T>& v) {
    quick_sort_2(v, 0, v.size() - 1);
}


template <typename T>
void quick_sort_2 (vector<T>& v, int l, int r) {
    if (l < r) {
        const int p = randint(l, r);
        swap(v[l], v[p]);
        const int q = partition(v, l, r);
        quick_sort_2(v, l, q);
        quick_sort_2(v, q + 1, r);
}   }
```

## Quicksort (v3)

Stops sorting when the subvector is "small enough". At the end, a
last pass is made with insertion sort.

```c++
template <typename T>
void quick_sort_3 (vector<T>& v) {
    quick_psort_3(v, 0, v.size() - 1);
    ins_sort(v, 0, v.size() - 1);
}


template <typename T>
void quick_psort_3 (vector<T>& v, int l, int r) {
    const int CRITICAL_SIZE = 100;
    if (r - l >= CRITICAL_SIZE) {
        const int q = partition(v, l, r);
        quick_psort_3(v, l, q);
        quick_psort_3(v, q + 1, r);
}   }
```

<Autors autors="jpetit"/>
