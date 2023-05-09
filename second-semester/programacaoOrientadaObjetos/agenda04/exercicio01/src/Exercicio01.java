public class Exercicio01 {
    public static void main(String[] args) throws Exception {
        DisplayComSobrecarga display = new DisplayComSobrecarga();
        // chama o método e printa a string
        display.disp('a');
        // chama o método e printa a string e o numero
        display.disp('a',10);
    }
}
