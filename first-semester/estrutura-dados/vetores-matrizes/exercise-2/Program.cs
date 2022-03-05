using System;

namespace exercise_2
{
    class Program
    {
        static void Main(string[] args)
        {
            /*
            
                Exercício 2: Criar uma matriz de ordem 5. 
                Criar uma função que retorna um vetor com os elementos da diagonal principal.

            */

            Random number = new Random();

            int[,] notes = new int[5, 5];

            for (int a = 0; a < 5; a++) {
                for (int b = 0; b < 5; b++) {
                    notes[a, b] = number.Next(1, 11);

                    if (a == b) {
                        Console.WriteLine($"Elemento [{a}, {b}] - Diagonal principal: {notes[a, b]}");
                    }
                }
            }

        }
    }
}
