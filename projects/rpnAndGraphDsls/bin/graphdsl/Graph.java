package graphdsl;
import java.util.*;
public class Graph  
{ 
  class Edge  
  { 
    public String from;

    public String to;

    public Edge (String from, String to) 
    { 
      this.from = from;
      this.to = to;
    }

    public String toString()
    { 
      return from + " -> " + to;
    }
  }

  public List<Edge> edges = new ArrayList<Edge>();

  public Graph addEdge(String a, String b)
  { 
    edges.add(new Edge(a, b));
    return this;
  }

  public String toString()
  { 
    StringBuilder sb = new StringBuilder();
    sb.append("(");
    for(Edge e : edges)
    { 
      if(sb.length() > 1)
        sb.append(", ");
      sb.append(e.toString());
    }
    sb.append(")");
    return sb.toString();
  }
}