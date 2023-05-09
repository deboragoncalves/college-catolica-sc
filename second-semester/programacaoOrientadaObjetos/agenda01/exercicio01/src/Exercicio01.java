public class Exercicio01 {
    public static void main(String[] args) throws Exception {
        int linha;
        String asteriscos = "*";
        
        for (linha = 1; linha <= 6; linha++) {
            System.out.println(asteriscos);
            asteriscos += "*";
        }
    }
}
