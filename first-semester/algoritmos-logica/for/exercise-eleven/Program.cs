using System;

namespace exercise_eleven
{
    class Program
    {
        static void Main(string[] args)
        {
            /* 
                Exercício 11: Faça  um  programa  que  leia  o  nome  e  peso  de  6  pessoas.  Calcule  e  imprima  o  IMC 
                (peso/altura2) de cada uma. Ao final do programa, imprima a quantidade de pessoas que estão 
                com peso abaixo do ideal (IMC < 20), dentro do peso ideal (IMC entre 20 e 25) e com peso acima 
                do ideal (IMC > 25). Dica: nesse caso, serão necessários 3 contadores, 1 para cada faixa de peso.
            */

            try {

                int lessWeight = 0;
                int rightWeight = 0;
                int bigWeight = 0;

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

                        if (imc > 20.0 && imc < 25.0)
                        {
                            rightWeight++;
                        }

                        if (imc > 25.0)
                        {
                            bigWeight++;
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

                Console.WriteLine();
                Console.WriteLine($"{rightWeight} pessoas estão no seu peso ideal.");

                Console.WriteLine();
                Console.WriteLine($"{bigWeight} pessoas estão acima do peso ideal.");

            } catch (Exception e) {
                Console.WriteLine("Os valores informados são inválidos.");
                Console.WriteLine(e);
            }
        }
    }
}

