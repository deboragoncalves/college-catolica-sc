public class Retangulo extends Geometria {
    private int largura;
    private int altura;

    public Retangulo(int numLados, int largura, int altura) {
        super(numLados);
        this.largura = largura;
        this.altura = altura;
    }

    @Override
    public double getArea() {
        return this.largura * this.altura;
    }

    @Override
    public double getPerimetro() {
        return 2 * (this.largura + this.altura);
    }
    
}
