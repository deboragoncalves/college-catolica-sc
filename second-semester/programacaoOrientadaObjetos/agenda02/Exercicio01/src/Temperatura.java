public class Temperatura {
    double celsius;

    double getCelsius() {
        return this.celsius;
    }

    double getFahrenheit() {
        return this.celsius * 1.8 + 32;
    }

    double getKelvin() {
        return this.celsius + 273;
    }
}
