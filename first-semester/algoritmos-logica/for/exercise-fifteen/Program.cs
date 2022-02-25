using System;

namespace exercise_fifteen
{
    class Program
    {
        static void Main(string[] args) 
        {
            /*
                Exercício 15: Faça um algoritmo que leia o nome e idade de 10 pessoas. Calcule a soma das idades e a 
                idade média (a soma das idades / 10).
            */

            try {

                int totalAge = 0;
                int totalPeople = 10;

                for (int i = 1; i <= totalPeople; i++) {
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

                int adverageAge = totalAge / totalPeople;

                Console.WriteLine();
                Console.WriteLine($"A soma das idades é de {totalAge} anos");
                Console.WriteLine($"A média das idades é de {adverageAge} anos");

            } catch (Exception e) {
                Console.WriteLine("Os valores informados são inválidos.");
                Console.WriteLine(e);
            }
        }
    }
}
