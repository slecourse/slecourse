public class Trans {
	private State source;
	private State target;
	public Trans(State source, State target) { this.source = source; this.target = target; }
	public State getSource() { return source; }
	public State getTarget() { return target; }
}
