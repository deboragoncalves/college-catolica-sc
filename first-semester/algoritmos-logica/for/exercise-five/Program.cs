using System;

namespace exercise_five
{
    class Program
    {
        static void Main(string[] args)
        {
            /*
            Exercício 5: Faça um programa que calcule a área das circunferências com raio variando entre x e 
            y, sendo x e y informados pelo usuário.
            */

            try {
                Double PI = Math.PI;
                int r;

                Console.WriteLine("Informe o primeiro valor inteiro para o raio da circunferência: ");
                int firstR = int.Parse(Console.ReadLine());

                Console.WriteLine("Informe o segundo valor inteiro para o raio da circunferência: ");
                int lastR = int.Parse(Console.ReadLine());

                if (firstR > 0 && lastR > 0) {
                    for (int i = firstR; i <= lastR; i++) {
                        r = i;
                        Double areaCirc = Math.Round(PI * Math.Pow(r, 2), 2);
                        Console.WriteLine($"Área da circunferência com raio {r}: {areaCirc}");
                    }    
                } else {
                    Console.WriteLine("Os valores informados para o raio são inválidos.");
                }

            } catch (Exception e) {
                Console.WriteLine("Os valores informados para o raio são inválidos.");
                Console.WriteLine(e);
            }

        }
    }
}
