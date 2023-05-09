/*
 * Neste exercício, você implementará a classe Temperatura, 
 * conforme os dados deste diagrama. Crie um novo projeto no Netbeans, 
 * crie a classe Temperatura (esta não terá um método “main”). 
 * 
 * Implemente o atributo celsius e os três métodos: getCelsius(), getFahrenheit() 
 * e getKelvin(). Estes métodos retornarão as temperaturas respectivamente em Celsius 
 * (basta retornar o valor da variável celsius), 
 * Fahrenheit (dica: fahrenheit =1,8celsius + 32) e 
 * Kelvin (dica: kelvin =celsius + 273).
 * 
 * Então, crie uma outra classe chamada TestaTemperatura. 
 * Nesta classe você implementará o método “main”. 
 * Instancie sua classe temperatura e defina um valor qualquer para a variável celsius. 
 * Então imprima sua temperatura em Celsius, Fahrenheit e Kelvin, 
 * utilizando os métodos que você criou. 

 */

public class TestaTemperatura {
    public static void main(String[] args) throws Exception {
        Temperatura temperatura = new Temperatura();
        temperatura.celsius = 169.95842;

        System.out.println("Temperatura - Celsius: " + temperatura.getCelsius() + " C");
        System.out.println("Temperatura - Fahrenheit: " + temperatura.getFahrenheit() + " F");
        System.out.println("Temperatura - Kelvin: " + temperatura.getKelvin() + " K");
    }
}
