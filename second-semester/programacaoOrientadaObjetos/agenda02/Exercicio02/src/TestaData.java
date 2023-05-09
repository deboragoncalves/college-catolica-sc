/*
 * Crie um novo projeto no Netbeans; neste projeto, crie uma classe chamada Data 
 * que contenha três atributos: dia, mes e ano, todos de tipo int. 
 * Crie, nesta classe, um método chamado mostraData, que mostrará a data 
 * no formato DD/MM/AAAA (por exemplo 15/07/2018),  separada por “/” (barras de divisão). 
 * 
 * Crie também uma classe chamada TestaData, que possuirá um método main e 
 * testará a sua data. Instancie um objeto de Data, 
 * inicialize as variáveis de dia, mes e ano e imprima a data formatada.
 */

public class TestaData {
    public static void main(String[] args) throws Exception {
        Data data = new Data();
        data.dia = 18;
        data.mes = 12;
        data.ano = 2023;

        String dataFormada = data.mostraData();
        System.out.println("Data formada: " + dataFormada);
    }
}
