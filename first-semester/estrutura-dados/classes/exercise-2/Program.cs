using System;

namespace exercise_2
{
    class Program
    {
        static void Main(string[] args)
        {
            /*
                Exercício 2: Faça um programa que defina de forma completa uma classe de nome “Veículo” 
                com os atributos “Nome”, “Marca”, “Ano de Fabricação” e “Placa”. 
                Crie métodos capazes de ler os dados de um veículo e mostrar uma listagem de todos os veículos.

                Cadastre em um vetor 3 veículos.
            */

            getDataCars();
        }

        private class Car {

            // Atributos privados iniciam com _
            private string _name;
            private string _mark;
            private string _year;
            private string _identification;

            // Getter e setter

            public string getCarName() {
                return this._name;
            }

            public void setCarName(string name) {
                this._name = name;
            }

            public string getCarMark() {
                return this._mark;
            }

            public void setCarMark(string mark) {
                this._mark = mark;
            }

            public string getCarYear() {
                return this._year;
            }

            public void setCarYear(string year) {
                this._year = year;
            }

            public string getCarIdentification() {
                return this._identification;
            }

            public void setCarIdentification(string identification) {
                this._identification = identification;
            }
        }

        private static void getDataCars() {
            Car[] cars = new Car[3];

            for (int x = 0; x <= 2; x++) {
                Console.WriteLine();
                Console.WriteLine("Digite o nome do carro: ");
                string name = Console.ReadLine();

                Console.WriteLine("Digite a marca do carro: ");
                string mark = Console.ReadLine();
            
                Console.WriteLine("Digite o ano do carro: ");
                string year = Console.ReadLine();
            
                Console.WriteLine("Digite a placa do carro: ");
                string identification = Console.ReadLine();

                Car car = new Car();
                car.setCarName(name);
                car.setCarMark(mark);
                car.setCarYear(year);
                car.setCarIdentification(identification);

                cars[x] = car;
            }

            showAllCars(cars);
        }

        private static void showAllCars(Car[] cars) {
            foreach(Car car in cars) {
                Console.WriteLine();
                Console.WriteLine($"Nome do carro: {car.getCarName()}");
                Console.WriteLine($"Marca do carro: {car.getCarMark()}");
                Console.WriteLine($"Ano do carro: {car.getCarYear()}");
                Console.WriteLine($"Placa do carro: {car.getCarIdentification()}");
            }
        }
    }
}
