using System.Numerics;
using System;

namespace exercise_1
{
    class Program
    {
        static void Main(string[] args)
        {
            /*
                Exercício 1: Faça um programa com um menu de opções que possa cadastrar o nome, o preço unitário, 
                a quantidade em estoque e a data de validade de 3 produtos. 
                Considere que a data de validade é de um tipo estruturado e formado pelos campos mês e ano.
                Depois dos dados serem informados, o programa deve conter uma opção que, por meio de uma função, 
                possa listar os produtos acima de um determinado valor fornecido pelo usuário.
            */

            getDataProduct();
        }

        public struct Product {
            public string name;
            public double price;
            public int quantity;
            public Date dateLimit;
        }

        public struct Date {
            public string month;
            public string year;
        }

        private static void getDataProduct() {
            
            try {
                // Nome: xSomething;
                // Vetor com elementos do tipo Product
                Product[] xProd = new Product[3];

                for (int y = 0; y <= 2; y++)
                {
                    Console.WriteLine();
                    Console.WriteLine("Digite o nome do produto: ");
                    string name = Console.ReadLine();

                    Console.WriteLine("Digite o preço do produto: ");
                    double price = double.Parse(Console.ReadLine());

                    Console.WriteLine("Digite a quantidade do produto: ");
                    int quantity = int.Parse(Console.ReadLine());

                    Console.WriteLine("Digite o mês de validade do produto: ");
                    string month = Console.ReadLine();

                    Console.WriteLine("Digite o ano de validade do produto: ");
                    string year = Console.ReadLine();

                    xProd[y].name = name;
                    xProd[y].price = price;
                    xProd[y].quantity = quantity;
                    xProd[y].dateLimit.month = month;
                    xProd[y].dateLimit.year = year;
                }

                showDataProduct(xProd);
            } catch (Exception e) {
                Console.WriteLine("Os dados informados são inválidos");
                Console.WriteLine(e);           
            }

        }

        private static void showDataProduct(Product[] xProd) {
            foreach(Product product in xProd) {
                Console.WriteLine();
                Console.WriteLine($"Nome do produto: {product.name}");
                Console.WriteLine($"Preço do produto: R$ {product.price}");
                Console.WriteLine($"Quantidade do produto: {product.quantity}");
                Console.WriteLine($"Validade do produto (MM/AA): {product.dateLimit.month}/{product.dateLimit.year}");
            }
        }
    }
}
