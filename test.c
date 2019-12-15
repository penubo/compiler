#include <stdio.h>

int main() {
	int a[9] = {1, 4, 3, 5, 6, 7, 8, 9};
	int i = 1;

	a[++i] = a[a[i] / 4];

	printf("%d\n", a[i]);
	for (int i = 0; i < 9; i++) {
		printf("%d ", a[i]);
	}
	

	return 0;


}

