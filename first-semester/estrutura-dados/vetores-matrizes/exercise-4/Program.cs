using System;

namespace exercise_4
{
    class Program
    {
        static void Main(string[] args)
        {
            /* 
            
                Exercício 4: Um professor tem uma turma com 5 alunos, com 3 avaliações por semestre.
                Faça um programa que lance a nota de cada aluno nessas avaliações.

                a.    Mostre a nota total de cada aluno
                b.    Mostre a média da nota da turma em cada uma das provas

            */

            Random number = new Random();

            int[,] notes = new int[5, 3];

            for (int x = 0; x < 5; x++)
            {
                for (int y = 0; y < 3; y++)
                {
                    notes[x, y] = number.Next(1, 11);
                    Console.WriteLine();
                    Console.WriteLine("Aluno " + x + " - Prova " + y);
                    Console.WriteLine(notes[x, y]);
                }
            }

            totalNoteStudents(notes);
            averageExam(notes);
        }

        private static void totalNoteStudents(int[,] notes)
        {
            // 0, 0 - 1o aluno 1a prova
            // 0, 1 - 1o aluno 2a prova

            int sumFirstStudent = 0;
            int sumSecondStudent = 0;
            int sumThirdStudent = 0;
            int sumFourthStudent = 0;
            int sumFifthStudent = 0;

            for (int x = 0; x < 5; x++)
            {
                for (int y = 0; y < 3; y++)
                {
                    if (x == 0)
                    {
                        sumFirstStudent += notes[x, y];
                    }
                    else if (x == 1)
                    {
                        sumSecondStudent += notes[x, y];
                    }
                    else if (x == 2)
                    {
                        sumThirdStudent += notes[x, y];
                    }
                    else if (x == 3)
                    {
                        sumFourthStudent += notes[x, y];
                    }
                    else if (x == 4)
                    {
                        sumFifthStudent += notes[x, y];
                    }
                }
            }

            Console.WriteLine();
            Console.WriteLine($"Soma - Aluno 1: {sumFirstStudent}");
            Console.WriteLine($"Soma - Aluno 2: {sumSecondStudent}");
            Console.WriteLine($"Soma - Aluno 3: {sumThirdStudent}");
            Console.WriteLine($"Soma - Aluno 4: {sumFourthStudent}");
            Console.WriteLine($"Soma - Aluno 5: {sumFifthStudent}");
        }

        private static void averageExam(int[,] notes)
        {

            int sumFirstExam = 0;
            int sumSecondExam = 0;
            int sumThirdExam = 0;

            for (int x = 0; x < 5; x++)
            {
                for (int y = 0; y < 3; y++)
                {
                    if (y == 0)
                    {
                        sumFirstExam += notes[x, y];
                    }
                    else if (x == 1)
                    {
                        sumSecondExam += notes[x, y];
                    }
                    else if (x == 2)
                    {
                        sumThirdExam += notes[x, y];
                    }
                }
            }

            Console.WriteLine();
            Console.WriteLine($"Média - Exame 1: {sumFirstExam / 5}");
            Console.WriteLine($"Média - Exame 2: {sumSecondExam / 5}");
            Console.WriteLine($"Média - Exame 3: {sumThirdExam / 5}");
        }

    }
}
