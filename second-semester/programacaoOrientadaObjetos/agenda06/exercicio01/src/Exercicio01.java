public class Exercicio01 {
    public static void main(String[] args) throws Exception {
        Pessoa p1 = new Aluno();
        Pessoa p2 = new AlunoPosGraduacao();
        Aluno a1 = new AlunoPosGraduacao();

        // classe filha não pode instanciar a classe Pai 
        // o contrário pode 
        // AlunoPosGraduacao apg = new Aluno();
        // Professor pr1 = new Pessoa(); 
    }
}
