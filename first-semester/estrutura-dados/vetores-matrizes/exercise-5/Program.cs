using System;

namespace exercise_5
{
    class Program
    {
        static void Main(string[] args)
        {
            /*

                Exercício 5: 
                Faça um programa que possa cadastrar o nome e o telefone de 5 funcionários de uma empresa. 
                Depois dos dados serem informados o programa deve conter uma opção 
                que sirva para o usuário pesquisar sequencialmente um funcionário e encontrar o seu telefone.
            
            */

            string[,] dataEmployees = new string[5, 2];

            // Linha - nome
            // Coluna - telefone

            for (int x = 0; x < 5; x++) {
                
                Console.WriteLine();
                Console.WriteLine("Digite o seu nome: ");
                string name = Console.ReadLine();
                dataEmployees[x, 0] = name;

                Console.WriteLine();
                Console.WriteLine("Digite o seu telefone: ");
                string phone = Console.ReadLine();
                dataEmployees[x, 1] = phone;

                if (name.Length == 0 || phone.Length == 0) {
                    Console.WriteLine("Os dados informados são inválidos.");
                    break;
                }

                Console.WriteLine($"Funcionário {x + 1} - Nome: {dataEmployees[x, 0]}, Telefone: {dataEmployees[x, 1]}");
            }
        }
    }
}
