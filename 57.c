int n;
int QuickSort(int arr[], int low, int high)
{
    if (low < high)
    {
        int i;
        i = low;
        int k;
        k = arr[low];
        arr[i] = k;
        int tmp;
        tmp = i - 1;
        tmp = QuickSort(arr, low, tmp);
        tmp = i + 1;
        tmp = QuickSort(arr, tmp, high);
    }
    return 0;
}

int main(){
    n = 10;
    int a[10];
    a[0]=4;a[1]=3;a[2]=9;a[3]=2;a[4]=0;
    a[5]=1;a[6]=6;a[7]=5;a[8]=7;a[9]=8;
    int i;
    i = 0;
    int tmp;
    tmp = 9;
    i = QuickSort(a, i, tmp);
    return 0;
}
