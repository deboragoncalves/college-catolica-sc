public class Exercicio03 {
    public static void main(String[] args) throws Exception {
        Ponto2D ponto2d = new Ponto2D();
        System.out.println("Ponto2D - X: " + ponto2d.getX());
        System.out.println("Ponto2D - Y: " + ponto2d.getY());

        // acessando atributos herdados da classe Ponto2D
        Ponto3D ponto3d = new Ponto3D();
        System.out.println("Ponto3D - X: " + ponto3d.getX());
        System.out.println("Ponto3D - Y: " + ponto3d.getY());
        System.out.println("Ponto3D - Z: " + ponto3d.getZ());
    }
}
