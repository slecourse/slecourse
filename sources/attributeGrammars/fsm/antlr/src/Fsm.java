import java.util.Collection;
import java.util.LinkedList;

public class Fsm {

	private Collection<State> states;
	private Collection<Trans> transs;

	public Collection<State> getStates() {
    	if (states==null)
    		states = new LinkedList<State>();
    	return states;
    }
	
    public Collection<Trans> getTranss() {
    	if (transs==null)
    		transs = new LinkedList<Trans>();
    	return transs;
    }
    
    /**
     * Add a state for an id to the FSM.
     * @param id the id of the state.
     * @throws NameAnalysisException if id already maps to a state
     */
    public void addState(String id) {
    	for (State state : getStates())
    		if (state.getId().equals(id))
    			throw new NameAnalysisException();
    	State state = new State(id);
    	getStates().add(state);
    }
    
    /**
     * Add a transition to the FSM.
     * @param from the source id of the transition.
     * @param to the target id of the transition.
     * @throws NameAnalysisException if id already maps to a state
     */
    public void addTrans(String from, String to) {
    	State source = lookup(from);
    	State target = lookup(to);
    	Trans trans = new Trans(source, target);
    	getTranss().add(trans);
    }
    
    /**
     * @param id the id of a state.
     * @return state object for id.
     * @throws NameAnalysisException if id does not map to a state
     */
    public State lookup(String id) {
    	for (State state : getStates()) 
    		if (state.getId().equals(id))
    			return state;
    	throw new NameAnalysisException();
    }
}
