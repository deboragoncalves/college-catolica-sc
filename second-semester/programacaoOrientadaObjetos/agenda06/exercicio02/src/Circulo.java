public class Circulo extends Forma {
    protected double raio = 1.0;

    public Circulo() {
    }
    
    public Circulo(double raio) {
        this.raio = raio;
    }

    // construtor com super
    public Circulo(double raio, String cor, boolean preenchido) {
        super(cor, preenchido);
        this.raio = raio;
    }

    public double getRaio() {
        return this.raio;
    }

    public void setRaio(double raio) {
        this.raio = raio;
    }

    @Override
    public double getArea() {
        double pi = 3.14;
        return raio * raio * pi;
    }

    @Override
    public double getPerimetro() {
        double pi = 3.14;
        return 2 * raio * pi;
    }

    public String toString() {
        return "Circulo: Raio " + this.raio + ", Cor: " + this.cor + ", Preenchido: " + this.preenchido;
    }
    
}
