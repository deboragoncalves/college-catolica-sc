public class Quadrado extends Retangulo {
    public Quadrado() {

    }

    public Quadrado(double lado) {
        this.altura = lado;
    }

    public Quadrado(double lado, String cor, boolean preenchido) {
        this.altura = lado;
        this.cor = cor;
        this.preenchido = preenchido;
    }

    public double getLado() {
        return this.altura;
    }

    public void setLado(double lado) {
        this.altura = lado;
    }

    public String toString() {
        return "Quadrado: Lado " + this.altura + ", Cor: " + this.cor + ", Preenchido: " + this.preenchido;
    }
    
}
