using System;

namespace exercise_thirteen
{
    class Program
    {
        static void Main(string[] args) 
        {
            /*
                Exercício 13: Faça um algoritmo que leia o nome, idade e sexo de 10 pessoas e calcule a soma das idades 
                das mulheres.
            */

            try {

                int totalAgeWomen = 0;

                for (int i = 1; i <= 10; i++)
                {
                    Console.WriteLine();
                    Console.WriteLine("Informe seu nome: ");
                    string name = Console.ReadLine();

                    Console.WriteLine("Informe sua idade: ");
                    int age = int.Parse(Console.ReadLine());

                    Console.WriteLine("Informe seu sexo: ");
                    string sex = Console.ReadLine();

                    if (name.Length > 0 && age > 0 && sex.Length > 0) {
                        sex = sex.ToUpper();

                        Console.WriteLine($"{name} tem {age} anos e possui sexo {sex}.");

                        if (sex == "F" || sex.StartsWith("F")) {
                            totalAgeWomen += age;
                        }

                    } else {
                        Console.WriteLine("Os valores informados são inválidos.");
                        break;
                    }

                }

                Console.WriteLine();
                Console.WriteLine($"A soma das idades das mulheres é de {totalAgeWomen} anos.");

            } catch (Exception e) {
                Console.WriteLine("Os valores informados são inválidos.");
                Console.WriteLine(e);
            }
        }
    }
}
