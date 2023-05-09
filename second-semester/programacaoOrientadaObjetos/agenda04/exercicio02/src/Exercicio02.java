public class Exercicio02 {
    public static void main(String[] args) throws Exception {
        CalculaArea calculaArea = new CalculaArea();
        int areaQuadrado = calculaArea.calculaArea(4);
        System.out.println("Area quadrado: " + areaQuadrado);

        int areaRetangulo = calculaArea.calculaArea(2, 4);
        System.out.println("Area retangulo: " + areaRetangulo);
    }
}
