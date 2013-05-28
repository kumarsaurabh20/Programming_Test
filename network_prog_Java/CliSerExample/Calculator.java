

public class Calculator {

	public Double evaluateOperation(Operation op) {
		
		if(op.operator.equals("add")) {return op.operandLeft + op.operandRight;}
		else if(op.operator.equals("subtraction")) {return op.operandLeft - op.operandRight;}
		return null;
				
	}
	
}
