import java.util.Scanner;

public class giai_thuat {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n;
        System.out.println("Nhập n");
        n = Integer.parseInt(scanner.nextLine());
        for (int i = n; i >= 1; i = i-2) {
            for (int j = 1; j <= i ; j++) {
                System.out.print("* ");
            }
            System.out.println("");
        }
        for (int i = 2; i <= n ; i = i + 2) {
            for (int j = 1; j <= i ; j++) {
                System.out.print("* ");
            }
            System.out.println("");
        }
    }
}
