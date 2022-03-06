using System;

namespace exercise_3
{
    class Program
    {
        static void Main(string[] args)
        {
            /* 
                Exercício 3:

                Desenvolva uma classe que, por meio de métodos, realize as seguintes operações 
                dentro de um vetor de números inteiros:

                    1. Criação de um vetor de dimensões fornecidas pelo usuário segundo um método construtor. 
                    Se não for fornecido pelo usuário o tamanho deverá ser, por padrão, 10;

                    2. Criação de um vetor de dimensões fornecidas pelo usuário e inserção automática de 
                    valores aleatórios nesse vetor, segundo um método construtor, 
                    fornecidos os limites mínimo e máximo; Se não fornecido o tamanho do vetor pelo usuário 
                    o tamanho deverá ser 10;

                    3. Listagem de todos os elementos do vetor;
                    4. Inserção de um valor em uma dada posição do vetor;
                    5. Recuperação de um valor indicado por uma posição fornecida pelo usuário;
                    6. Localização do Maior e do Menor número dentro do vetor.
            */

            // Vetor com tamanho 10
            Numbers numbersSize10 = new Numbers();
            numbersSize10.setNumber(10, 2);
            numbersSize10.showAllNumbers(numbersSize10.getArrayNumbers());
            numbersSize10.getMinValue();
            numbersSize10.getMaxValue();

            Console.WriteLine();

            // Vetor com tamanho 10, minimo 1 e maximo 10
            Numbers numbersSize10Min = new Numbers(1, 10);
            numbersSize10Min.setNumber(5, 12);
            numbersSize10Min.showAllNumbers(numbersSize10Min.getArrayNumbers());
            numbersSize10Min.getMinValue();
            numbersSize10Min.getMaxValue();

            Console.WriteLine();

            // Vetor com tamanho 5, minimo 1 e maximo 10
            Numbers numbersSize5 = new Numbers(5, 1, 10);
            numbersSize5.showAllNumbers(numbersSize5.getArrayNumbers());
            numbersSize5.setNumber(10);
            numbersSize5.getNumber(1);
            numbersSize5.getMinValue();
            numbersSize5.getMaxValue();
        }

        class Numbers {
            private int[] _arrayNumbers;

            // Construtor
            public Numbers() {
                this._arrayNumbers = new int[10];
            }

            public Numbers(int arraySize) {
                this._arrayNumbers = new int[arraySize];
            }

            public Numbers(int minValue, int maxValue) {
                this._arrayNumbers = new int[10];

                Random number = new Random();

                for (int x = 0; x < 10; x++) {
                    this._arrayNumbers[x] = number.Next(minValue, maxValue + 1);
                }
            }
            public Numbers(int arraySize,int minValue, int maxValue) {
                this._arrayNumbers = new int[arraySize];

                Random number = new Random();

                for (int x = 0; x < arraySize; x++) {
                    this._arrayNumbers[x] = number.Next(minValue, maxValue + 1);
                }
            }

            // Getter
            public int[] getArrayNumbers() {
                return this._arrayNumbers;
            }
            public void showAllNumbers(int[] arrayNumbers) {
                Console.Write("Números:");

                foreach (int number in arrayNumbers) {
                    Console.Write($" {number}");
                }

                Console.WriteLine();
            }

            public void setNumber(int number = 0, int position = 0) {
                try {
                    this._arrayNumbers[position] = number;
                } catch (Exception e) {
                    Console.WriteLine($"A posição {position} não existe no vetor.");
                    Console.WriteLine(e);
                    Console.WriteLine();
                }
            }
            public void getNumber(int position = 0) {
                try {
                    Console.WriteLine($"Número na posição {position}: {this._arrayNumbers[position]}");
                } catch (Exception e) {
                    Console.WriteLine($"A posição {position} não existe no vetor.");
                    Console.WriteLine(e);
                }                
            } 
            public void getMaxValue() {
                Array.Sort(this._arrayNumbers);
                Console.WriteLine($"Valor máximo: {this._arrayNumbers[this._arrayNumbers.Length - 1]}");
            }
            public void getMinValue() {
                Array.Sort(this._arrayNumbers);
                Console.WriteLine($"Valor mínimo: {this._arrayNumbers[0]}");
            }
        }
    }
}
