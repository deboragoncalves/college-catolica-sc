using System;

namespace exercise_1
{
    class Program
    {
        static void Main(string[] args)
        {
            /*

                Exercício 1: Faça um programa que possa ser usado por uma clínica para cadastrar: 3 pacientes,
                a data da consulta, a hora de sua realização, o nome de um paciente e o nome do médico 
                que o atenderá. 
                Depois de os dados serem informados, o programa deve conter uma opção que, 
                o usuário fornecendo o nome do médico, liste toda a agenda dele.
                Considere que o atributo "Data da consulta" seja também estruturado, 
                formado pelos campos Dia, Mês e Ano.

            */

            getDataAppointment();
        }

        public class Appointment
        {
            public string namePatient;
            public DateAppointment dateAppointment;
            public string hourAppointment;
            public string doctorName;
        }

        public class DateAppointment
        {
            public string dayAppointment;
            public string monthAppointment;
            public string yearAppointment;
        }

        private static void getDataAppointment()
        {
            try
            {
                Appointment[] dataAppointment = new Appointment[3];

                for (int x = 0; x < 3; x++)
                {

                    Console.WriteLine();
                    Console.WriteLine("Digite o nome do paciente: ");
                    string namePatient = Console.ReadLine();

                    Console.WriteLine("Digite a data da consulta (DD/MM/AA): ");
                    string dateAppoinment = Console.ReadLine();

                    Console.WriteLine("Digite a hora da consulta (HH:MM): ");
                    string hourAppointment = Console.ReadLine();

                    Console.WriteLine("Digite o nome do médico: ");
                    string doctorName = Console.ReadLine();

                    // Objeto
                    Appointment appointment = new Appointment();
                    appointment.doctorName = doctorName;
                    appointment.namePatient = namePatient;
                    appointment.hourAppointment = hourAppointment;

                    string[] datePartsAppointment = dateAppoinment.Split("/");

                    DateAppointment dateAppointment = new DateAppointment();
                    dateAppointment.dayAppointment = datePartsAppointment[0];
                    dateAppointment.monthAppointment = datePartsAppointment[1];
                    dateAppointment.yearAppointment = datePartsAppointment[2];

                    appointment.dateAppointment = dateAppointment;

                    dataAppointment[x] = appointment;
                }

                showDoctorAppointments(dataAppointment);

            }
            catch (Exception e)
            {
                Console.WriteLine("Os dados informados são inválidos");
                Console.WriteLine(e);
            }
        }

        private static void showDoctorAppointments(Appointment[] dataAppointment)
        {
            bool findDoctor = false;

            Console.WriteLine();
            Console.WriteLine("Informe o nome do médico: ");
            string doctorName = Console.ReadLine();

            foreach (Appointment appointment in dataAppointment)
            {
                if (doctorName == appointment.doctorName)
                {
                    findDoctor = !findDoctor;

                    Console.WriteLine();
                    Console.WriteLine($"Nome do paciente: {appointment.namePatient}");
                    Console.WriteLine($"Data e hora da consulta (DD/MM/AA HH:MM): {appointment.dateAppointment.dayAppointment}/{appointment.dateAppointment.monthAppointment}/{appointment.dateAppointment.yearAppointment} {appointment.hourAppointment}");
                    break;
                }
            }

            if (!findDoctor)
            {
                Console.WriteLine();
                Console.WriteLine($"O médico {doctorName} não foi encontrado.");
            }
        }
    }
}
