#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	FILE *fptr1, *fptr2;
	if(argv[1] == NULL || argv[2] == NULL) {
		printf("Please enter two filenames...");
	}
	char from;
	
	fptr1 = fopen(argv[1], "r");

	if(fptr1 == NULL) {
		printf("Could not open file %s\n", argv[1]);
		exit(1);
	}
	fptr2 = fopen(argv[2], "w");
	if(fptr2 == NULL){
		printf("Could not open file %s\n", argv[2]);
		exit(1);
	}
	
	from = fgetc(fptr1);
	while(from != EOF) {
		fputc(from, fptr2);
		from = fgetc(fptr1);
	}

	printf("Contents of %s copied to %s...\n",argv[1],argv[2]);

	fclose(fptr1);
	fclose(fptr2);

	return 0;
}
