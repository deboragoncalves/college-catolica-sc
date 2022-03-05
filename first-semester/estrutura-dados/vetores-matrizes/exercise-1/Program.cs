using System;

namespace exercise_1
{
    class Program
    {
        static void Main(string[] args)
        {
            /* 

                Exercício 1: Criar um vetor com 5 posições e ler os valores. 
                Criar duas funções, que irão receber o vetor como parâmetro, 
                uma função irá calcular a soma dos números pares do vetor 
                e a outra retorna a quantidade de números ímpares.
            
            */
            
            Random number = new Random();

            int[] notes = new int[5];

            for (int a = 0; a < notes.Length; a++)
            {
                // aleatório entre 0 e 10
                notes[a] = number.Next(1, 11);
            }

            Console.Write("Vetor: ");
            Console.WriteLine(String.Join(", ", notes));
            sumPairNumbers(notes);
            totalOddNumbers(notes);
        }

        private static int sumPairNumbers(int[] notes) {

            int sumPair = 0;

            for (int i = 0; i < notes.Length; i++) {
                if (notes[i] % 2 == 0) {
                    sumPair += notes[i];
                }
            }

            Console.WriteLine("Soma dos números pares: " + sumPair);
            return sumPair;
        }
        private static int totalOddNumbers(int[] notes) {

            int totalOdd = 0;

            for (int i = 0; i < notes.Length; i++) {
                if (notes[i] % 2 != 0) {
                    totalOdd++;
                }
            }

            Console.WriteLine("Quantidade de números ímpares: " + totalOdd);
            return totalOdd;
        }        
    }
}
