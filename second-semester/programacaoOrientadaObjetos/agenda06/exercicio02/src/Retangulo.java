public class Retangulo extends Forma {
    protected double base = 1.0;
    protected double altura = 1.0;

    public Retangulo() {
    }
    
    public Retangulo(double base, double altura) {
        this.base = base;
        this.altura = altura;
    }

    // construtor com super
    public Retangulo(double base, double altura, String cor, boolean preenchido) {
        super(cor, preenchido);
        this.base = base;
        this.altura = altura;
    }

    public double getBase() {
        return this.base;
    }

    public void setBase(double base) {
        this.base = base;
    }

    public double getAltura() {
        return this.altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    @Override
    public double getArea() {
        return this.base * this.altura;
    }

    @Override
    public double getPerimetro() {
        return 2 * (this.base + this.altura);
    }
    
    public String toString() {
        return "Retangulo: Base " + this.base + ", Altura: " + this.altura + ", Cor: " + this.cor + ", Preenchido: " + this.preenchido;
    }
}
