#include <stdio.h>

#include <string.h>

int main()
{

    for (int index = 1; index <= 20; index++)
    {

        if (index % 2 != 0)
        {

            printf("Numero impar: %d\n", index);
        }
    }
}