import java.text.DecimalFormat;
import java.util.Scanner;

// Escreva um programa em Java que receba do usuário uma temperatura em um valor inteiro, 
// em graus Celsius, converta-a para Fahrenheit e mostre o valor convertido para o usuário.

// Entre uma temperatura em graus Celsius: 100
// Conversão: 100 graus Celsius equivalem a 212 graus Fahrenheit. 

public class Exercicio02 {
    public static void main(String[] args) throws Exception {
        Scanner entradaDados = new Scanner(System.in);

        System.out.println("Entre uma temperatura em graus Celsius: ");
        int temperaturaCelsius = entradaDados.nextInt();

        double temperaturaFahrenheit = (1.8 * temperaturaCelsius) + 32;
        
        String tempFahrenheitFormatada = "0";

        if (temperaturaFahrenheit != 0) {
            // 2 casas decimais
            DecimalFormat decimalFormat = new DecimalFormat("#,###.00");
            tempFahrenheitFormatada = decimalFormat.format(temperaturaFahrenheit);
        }

        // imprimir
        System.out.print("Conversao: ");
        System.out.print(temperaturaCelsius); 
        System.out.print("  graus Celsius equivalem a "); 
        System.out.print(tempFahrenheitFormatada);
        System.out.print(" graus Fahrenheit.");
        
        entradaDados.close();
    }
}
