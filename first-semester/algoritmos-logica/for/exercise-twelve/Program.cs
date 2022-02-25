using System;

namespace exercise_twelve
{
    class Program
    {
        static void Main(string[] args) 
        {
            /*
                Exercício 12: Faça um algoritmo que leia o nome e idade de 10 pessoas e calcule a soma das idades.
            */

            try {

                int totalAge = 0;

                for (int i = 1; i <= 10; i++) {
                    Console.WriteLine();
                    Console.WriteLine("Informe seu nome: ");
                    string name = Console.ReadLine();

                    Console.WriteLine("Informe sua idade: ");
                    int age = int.Parse(Console.ReadLine());

                    if (name.Length > 0 && age > 0) {
                        Console.WriteLine($"{name} tem {age} anos");

                        totalAge += age;
                    } else {
                        Console.WriteLine("Os valores informados são inválidos.");
                        break;
                    }

                }

                Console.WriteLine();
                Console.WriteLine($"A soma das idades é de tem {totalAge} anos");

            } catch (Exception e) {
                Console.WriteLine("Os valores informados são inválidos.");
                Console.WriteLine(e);
            }
        }
    }
}
