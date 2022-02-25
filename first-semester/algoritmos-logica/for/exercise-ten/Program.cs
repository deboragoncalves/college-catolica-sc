using System;

namespace exercise_ten
{
    class Program
    {
        static void Main(string[] args)
        {
            /* 
                Exercício 10: Faça  um  programa  que  leia  o  nome  e  peso  de  6  pessoas.  Calcule  e  imprima  o  IMC 
                (peso/altura2) de cada uma. Ao final do programa, imprima a quantidade de pessoas que estão 
                com peso abaixo do ideal (IMC < 20).
            */

            try {

                int lessWeight = 0;

                for (int i = 1; i <= 6; i++)
                {

                    Console.WriteLine();
                    Console.WriteLine("Informe o seu nome: ");
                    string name = Console.ReadLine();

                    Console.WriteLine("Informe o seu peso: ");
                    Double weight = double.Parse(Console.ReadLine());

                    Console.WriteLine("Informe a sua altura: ");
                    string height = Console.ReadLine();

                    if (name.Length > 0 && weight > 0.0 && height.Length > 0)
                    {
                        // Metros ou centimetros

                        Double numberHeight = 0.0;

                        if (height.Contains(".") || height.Contains(",")) {
                            numberHeight = double.Parse(height);
                            Console.WriteLine($"{name} tem {weight} kg e {numberHeight}m.");
                        } else {
                            numberHeight = double.Parse(height) / 100;
                            Console.WriteLine($"{name} tem {weight} kg e {numberHeight}cm.");
                        }

                        Double imc = Math.Round(weight / Math.Pow(numberHeight, 2), 2);

                        Console.WriteLine();
                        Console.WriteLine($"{name} tem IMC {imc}");

                        if (imc < 20.0)
                        {
                            lessWeight++;
                        }

                    }
                    else
                    {
                        Console.WriteLine("Os valores informados são inválidos.");
                        break;
                    }
                }

                Console.WriteLine();
                Console.WriteLine($"{lessWeight} pessoas estão abaixo do peso ideal.");

            } catch (Exception e) {
                Console.WriteLine("Os valores informados são inválidos.");
                Console.WriteLine(e);
            }
        }
    }
}
