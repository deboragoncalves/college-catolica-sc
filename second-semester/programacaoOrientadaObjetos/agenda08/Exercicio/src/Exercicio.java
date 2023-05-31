import java.util.ArrayList;

public class Exercicio {
    public static ArrayList<Integer> trocarElementos(ArrayList<Integer> lista, int posicaoPrimeiroElemento,
            int posicaoSegundoElemento) {
        
        if (lista != null) {
            int primeiroNumero = lista.get(posicaoPrimeiroElemento);
            int segundoNumero = lista.get(posicaoSegundoElemento);
            lista.set(posicaoPrimeiroElemento, segundoNumero);
            lista.set(posicaoSegundoElemento, primeiroNumero);
            return lista;
        } else {
            return new ArrayList<Integer>();
        }
    }

    public static void main(String[] args) throws Exception {
        /*
         * Escreva um método genérico para trocar a posição de dois elementos em um vetor.
            Seu método vai receber por parâmetros:  
            o vetor com um tipo genérico T, 
            a posição do primeiro elemento 
            e a posição do segundo elemento.
         */
        ArrayList<Integer> lista = new ArrayList<Integer>();
        lista.add(1);
        lista.add(10);
        lista.add(100);
        lista.add(50);
        System.out.println("Antes da troca: ");
        System.out.println(lista.get(0));
        System.out.println(lista.get(3));
        trocarElementos(lista, 0, 3);
        System.out.println("=====================");
        System.out.println("Depois da troca: ");
        System.out.println(lista.get(0));
        System.out.println(lista.get(3));
    }
}
