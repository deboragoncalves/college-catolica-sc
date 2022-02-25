using System;

namespace exercise_eight
{
    class Program
    {
        static void Main(string[] args)
        {
            /*
                Exercício 8: Faça um programa que leia o nome e sexo de 10 pessoas e calcule a quantidade de homens.
            */

            try
            {

                int countMen = 0;

                for (int i = 1; i <= 10; i++)
                {

                    Console.WriteLine();
                    Console.WriteLine("Informe o seu nome: ");
                    string name = Console.ReadLine();

                    Console.WriteLine("Informe o seu sexo: ");
                    string sex = Console.ReadLine();

                    if (name.Length > 0 && sex.Length > 0)
                    {
                        sex = sex.ToUpper();

                        Console.WriteLine($"{name} tem sexo {sex}.");

                        if (sex == "M" || sex.StartsWith("M"))
                        {
                            countMen++;
                        }

                    }
                    else
                    {
                        Console.WriteLine("Os valores informados são inválidos.");
                        break;
                    }
                }

                Console.WriteLine();
                Console.WriteLine($"{countMen} pessoas são do sexo masculino.");
            }
            catch (Exception e)
            {
                Console.WriteLine("Os valores informados são inválidos.");
                Console.WriteLine(e);
            }

        }
    }
}
