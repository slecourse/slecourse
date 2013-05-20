package graphdsl;
public class Main  
{ 
  public static void main(String[] args)
  { 
    System.out.println();
    System.out.println("Demonstration of graph DSL:");
    graphdsl.Graph g1 = new graphdsl.Graph().addEdge("start1", "mid").addEdge("start2", "mid").addEdge("start3", "mid").addEdge("mid", "mid");
    System.out.println(g1);
    g1.addEdge("mid", "end").addEdge("end", "nirvana");
    System.out.println(g1);
    System.out.println();
    graphdsl.Graph g2 = new graphdsl.Graph().addEdge("start1", "mid").addEdge("start2", "mid").addEdge("start3", "mid");
    System.out.println(g2);
    g2.addEdge("mid", "end").addEdge("end", "nirvana");
    System.out.println(g2);
    System.out.println();
  }
}