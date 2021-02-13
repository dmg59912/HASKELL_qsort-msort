#include <stdio.h>

void merge(int* a, int first, int mid, int last)
{
	int l_size = (mid - last) + 1;
	int r_size = last - mid;

	int left[l_size], right[r_size];

	for (int i = 0; i < l_size; i++)
		left[i] = a[first + i];

	for (int i = 0; i < r_size; i++)
		right[i] = a[(mid + 1) + i];

	int i = 0;
	int j = 0;
	int k = 1;

	while (i < l_size && j < r_size)
	{
		if (left[i] <= right[j])
		{
			a[k] = left[i];
			i++;
		}
		else if (left[i] > right[j])
		{
			a[k] = right[j];
			j++;
		}
		k++;
	}

	while (j < r_size)
	{
		a[k] = right[j];
		j++;
		k++;
	}
}

// Mergesort
void msort(int* a, int first, int last)
{
	if (first < last)
	{
		int mid = (first + (last - 1)) / 2;

		msort(a, first, mid);
		msort(a, mid + 1, last);
		merge(a, first, mid, last);
	}
}

void printArray(int a[], int n)
{
	for (int i = 0; i < n; i++)
	{
		if (i == (n - 1))
			printf("%d", a[i]);
		else
			printf("%d, ", a[i]);
	}
	printf("\n");
}

int main()
{
	int size = 10;
	int arr[10] = { 4, 65, 2, -31, 0, 99, 2, 83, 782, 1 };

	printf("Merge Sort\n");
	msort(arr, 0, size - 1);
	printArray(arr, size);

	return 0;
}


/*#include <stdio.h>

# define N 10

void qsort2( int *a, int n); //quick sort array a with n elements 
void quick_sort(int *a, int, int );// to recursively call quicksort 
int partition(int *a, int, int, int ); //our pivot value and reorder subarray
int pivot(int*a, int, int, int); //find value to split the array

void print(int*a); //to print our arrray

void swapf(int * a, int * b);// swap values

int main(void) 
{
  int a[N] = {4,65,2,-31,0,99,2,83,287,1};
   printf("Hello World!\n");
   qsort2(a, N-1);
   print(a);
   return 0;
}

void quick_sort( int * a, int left, int right) // left side of subarray right side of subarray 
{
  
 if (left < right)
  {
    int pivot_index = pivot(a, left, right, right/2);
    pivot_index = partition(a,left,right, pivot_index);
    quick_sort(a, left, pivot_index -1 ); // break array to first element up to pivot index
    quick_sort(a,pivot_index + 1, right); // second part of subarray starting from ppivot to last index
  }

}

int pivot(int *a, int left, int right, int center)
{
  if(a[left] > a[right])
  {
    if(a[right] > a[center])
      return right;
    else if(a[left] > a[center])
      return center;
    else 
      return left;
  }
  else
  {
    if(a[left] > a[center])
      return left;
    else if(a[right] > a[center])
      return center;
    else
      return right;
  }
}

void print(int *a)
{
  for(int i = 0; i < N; ++i)
    printf(" %d",a[i]);
}

int partition( int * a, int left, int right, int pivot_index)
{
  int pivot_value = a[pivot_index];
  swapf(&a[pivot_index],&a[right]);

  int store = left;

  for(int i = left; i < right; ++i)
  {
    if(a[i] <= pivot_value)
    {
      swapf(&a[store],&a[i]);
      ++store;
    }
  }

  swapf(&a[right], &a[store]);
  return store;
}

void qsort2( int *a, int n) //quick sort array a with n elements
{
  quick_sort(a, 0, n);
}

void swapf(int * a, int *b)//swap value function 
{
  int temp = *a;
  *a = *b;
  *b = temp;

}
*/
