using System;

namespace exercise_3
{
    class Program
    {
        static void Main(string[] args)
        {
            /* 

                Exercício 3:  Faça um programa que leia o valor dos elementos de um vetor de inteiros com 10 posições:

                a. Mostrar o maior e o menor valor do vetor
                b. Mostrar quantos números pares e quantos números ímpares existem no vetor
                c. Mostrar a média aritmética dos valores do vetor
            
            */

            Random number = new Random();

            int[] notes = new int[10];

            for (int a = 0; a < notes.Length; a++)
            {
                // aleatório entre 0 e 10
                notes[a] = number.Next(1, 11);
            }

            Console.Write("Vetor: ");
            Console.WriteLine(String.Join(", ", notes));
            bigSmallNumbers(notes);
            totalPairsOddNumbers(notes);
            averageNumbers(notes);
        }

        private static void bigSmallNumbers(int[] notes) {
            // sort - void
            Array.Sort(notes);

            Console.WriteLine();
            Console.Write("Vetor ordenado de forma crescente: ");
            Console.WriteLine(String.Join(", ", notes));
            Console.WriteLine($"Menor número: {notes[0]}");
            Console.WriteLine($"Maior número: {notes[notes.Length - 1]}");
        }

        private static void totalPairsOddNumbers(int[] notes) {
            int totalOdd = 0;
            int totalPairs = 0;

            for (int i = 0; i < notes.Length; i++) {
                if (notes[i] % 2 != 0) {
                    totalOdd++;
                } else {
                    totalPairs++;
                }
            }

            Console.WriteLine();
            Console.WriteLine("Quantidade de números ímpares: " + totalOdd);
            Console.WriteLine("Quantidade de números pares: " + totalPairs);

        }
        private static double averageNumbers(int[] notes)
        {
            int sum = 0;

            for (int i = 0; i < notes.Length; i++)
            {
                sum += notes[i];
            }

            double average = sum / notes.Length;
            Console.WriteLine();
            Console.WriteLine($"Média: {average}");
            return average;
        }

    }
}
