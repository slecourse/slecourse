package reversepolish;
public class Main  
{ 
  public static void main(String[] args)
  { 
    System.out.println();
    System.out.println("Demonstration of reverse-polish DSL:");
    System.out.println(2 * (3 + 4) + " = 2 3 4 + *");
    System.out.println(2 * (3 + 4) + " = 2 * (3 + 4)");
    System.out.println();
    System.out.println(1 + 2 * (3 + 4 * (5 + 6)) + " = 1 2 3 4 5 6 + * + * +");
    System.out.println(((5 + 6) * 4 + 3) * 2 + 1 + " = 5 6 + 4 * 3 + 2 * 1 +");
    System.out.println(1 + 2 * (3 + 4 * (5 + 6)) + " = 1 + 2 * (3 + 4 * (5 + 6))");
    System.out.println();
    System.out.println((1 + 2) * (2 + 3) + " = 1 2 3 4 5 6 + * + * +");
    System.out.println(1 + 2 * (3 + 4 * (5 + 6)) + " = 1 + 2 * (3 + 4 * (5 + 6))");
    System.out.println();
    int x = 3;
    System.out.println("int x = 3");
    System.out.println(x * x + " = x x *");
    System.out.println(x * x + " = x * x");
    System.out.println();
    System.out.println(Math.max(1, 2) * 2 + " = Math.max(1, 2) 2 * ");
    System.out.println(Math.max(1, 2) * 2 + " = Math.max(1, 2) * 2");
    System.out.println();
  }
}