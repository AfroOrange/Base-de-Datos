import java.util.Scanner;

/* Importamos el scanner que utilizaremos previamente y
   crearemos la función de fibonacci recursiva */
class Main {
    public static int fibonacci(int valor, int v1, int v2) {
        if (v1 > valor) {
            System.out.println("Se termina la serie");
            return v1;
        } else {
            System.out.println(v1);
            return fibonacci(valor, v2, v1 + v2);
        }
    }

    /* En el main, solicitaremos el valor final de la serie
       al usuario y se imprimirá la función */
    public static void main (String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("INTRODUCIR EL VALOR FINAL DE LA SERIE:");
        int valor_final = scanner.nextInt();

        int v1 = 1;
        int v2 = 1;

        fibonacci(valor_final,v1,v2);
    }
}
