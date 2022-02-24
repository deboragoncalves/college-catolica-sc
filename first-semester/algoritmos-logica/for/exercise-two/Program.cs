using System;

namespace exercise_two
{
    class Program
    {
        static void Main(string[] args)
        {

            /* Exercício 2
            Altere o programa que imprima seu nome 15 vezes iniciando a variável auxiliar a partir 
            de 117. */

            Console.WriteLine("Digite o seu nome: ");
            string name = Console.ReadLine();

            int initial = 117;
            int final = 117 + 14;

            if (name != null && name.Length > 0) {
                for (int i = initial; i <= final; i++) {
                    Console.WriteLine($"Nome {i}: {name}");
                }
            } else {
                Console.WriteLine("O nome informado é inválido");
            }
        }
    }
}
