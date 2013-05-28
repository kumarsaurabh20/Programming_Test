import java.io.Serializable;

public class Operation implements Serializable  {

	private static final long serialVersionUID = 1L;
	//The type of operation can be add, subtract, multiply etc, add as much as you can
	String operator;
	Double operandLeft;
	Double operandRight;
	
	public Operation(String operator, Double operandLeft, Double operandRight) {
		
		this.operator = operator;
		this.operandLeft = operandLeft;
		this.operandRight = operandRight;		
	}
	
	public String toString() {
		
		return "[ operation = "+ operator +" , operandLeft = "+ operandLeft +", operandRight = "+ operandRight +"]";
				
		
	}
	
}
