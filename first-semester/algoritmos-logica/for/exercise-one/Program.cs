using System;

namespace exercise_one
{
    class Program
    {
        static void Main(string[] args)
        {

            /* Exercício 1
            Faça um programa que imprima seu nome 15 vezes iniciando a variável auxiliar a partir 
            de 1. */

            Console.WriteLine("Digite o seu nome: ");
            string name = Console.ReadLine();

            if (name != null && name.Length > 0) {
                for (int i = 1; i <= 15; i++) {
                    Console.WriteLine($"Nome {i}: {name}");
                }
            } else {
                Console.WriteLine("O nome informado é inválido");
            }
        }
    }
}
