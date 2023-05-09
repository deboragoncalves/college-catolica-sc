import java.text.DecimalFormat;
import java.util.Scanner;

// Entre uma temperatura em graus Fahrenheit: 32
// Conversão: 32 graus Fahrenheit equivalem a 0 graus Celsius.

public class Exercicio03 {
    public static void main(String[] args) throws Exception {
        Scanner entradaDados = new Scanner(System.in);

        System.out.println("Entre uma temperatura em graus Fahrenheit: ");
        int temperaturaFahrenheit = entradaDados.nextInt();

        double temperaturaCelsius = (temperaturaFahrenheit - 32) / 1.8;

        String tempCelsiusFormatada = "0";

        if (temperaturaCelsius != 0) {
            // 2 casas decimais
            DecimalFormat decimalFormat = new DecimalFormat("#,###.00");
            tempCelsiusFormatada = decimalFormat.format(temperaturaCelsius);
        }
        
        // imprimir
        System.out.print("Conversao: ");
        System.out.print(temperaturaFahrenheit); 
        System.out.print(" graus Fahrenheit equivalem a "); 
        System.out.print(tempCelsiusFormatada);
        System.out.print(" graus Celsius.");
        
        entradaDados.close();
    }
}

