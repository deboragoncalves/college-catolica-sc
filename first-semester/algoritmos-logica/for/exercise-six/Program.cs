using System;

namespace exercise_six
{
    class Program
    {
        static void Main(string[] args)
        {
            /*
                Exercício 6: Faça um programa que leia o nome e idade de 10 pessoas e calcule a quantidade de pessoas 
                com idade >= 18 anos.
            */

            try
            {

                int countMore18 = 0;


                for (int i = 1; i <= 10; i++)
                {

                    Console.WriteLine("Informe o seu nome: ");
                    string name = Console.ReadLine();

                    Console.WriteLine("Informe a sua idade: ");
                    int age = int.Parse(Console.ReadLine());

                    if (name.Length > 0 && age > 0)
                    {
                        Console.WriteLine($"{name} possui {age} anos");

                        if (age >= 18)
                        {
                            countMore18++;
                        }
                    }
                    else
                    {
                        Console.WriteLine("Os valores informados são inválidos.");
                        break;
                    }
                }

                Console.WriteLine($"{countMore18} pessoas possuem mais de 18 anos.");

            }
            catch (Exception e)
            {
                Console.WriteLine("Os valores informados são inválidos.");
                Console.WriteLine(e);
            }

        }
    }
}
