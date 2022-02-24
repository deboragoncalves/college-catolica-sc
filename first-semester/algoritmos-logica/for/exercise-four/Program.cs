using System;

namespace exercise_four
{
    class Program
    {
        static void Main(string[] args)
        {
            /* 
            Exercício 04: Faça um programa que calcule a área das circunferências com raio variando entre 1 e 
            15.
            */

            Double PI = Math.PI;
            int r;

            for (int i = 1; i <= 15; i++) {
                r = i;
                Double areaCirc = Math.Round(PI * Math.Pow(r, 2), 2);
                Console.WriteLine($"Área da circunferência com raio {r}: {areaCirc}");
            }
        }
    }
}
