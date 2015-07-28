import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;

class Main {
	public static void main(String[] args) throws java.lang.Exception {
		
		BufferedReader scan = new BufferedReader(new InputStreamReader(System.in));
		scan.readLine();

		String[] stringNumbers = scan.readLine().split(" ");
		int[] numbers = new int[stringNumbers.length];

		for(int idx = 0; idx < stringNumbers.length; idx++) {
			numbers[idx]=Integer.parseInt(stringNumbers[idx]);
		}

		SegmentTree st = new SegmentTree(numbers);
		int lines = Integer.parseInt(scan.readLine());
		PrintWriter out = new PrintWriter(System.out, true);
		
		for(;lines > 0; lines--) {
			String[] range = scan.readLine().split(" ");
			out.println(st.MaxSumQuery(Integer.parseInt(range[0]), 
					Integer.parseInt(range[1])));
		}

		scan.close();
	}	
}

class SegmentTree {
	private int[] nodeValues;
	public Node root;

	public SegmentTree(int[] nodeValues) {
		this.nodeValues = nodeValues;
		this.root = populateTree(0, nodeValues.length - 1);
	}

	private Node populateTree(int startIdx, int endIdx) {
		
		Node parent = new Node(startIdx, endIdx);
		
		if (startIdx == endIdx) {
			parent.totalSum = nodeValues[startIdx];
			parent.maxSumFromLeft = parent.maxSumUptoRight = parent.maxSum = parent.totalSum;
			return parent;
		}

		int mid = (startIdx+endIdx)/2;
		parent.addChildren(populateTree(startIdx, mid), populateTree(mid + 1, endIdx));
		
		return parent;
	}

	private Node findMaxSum(int rangeFrom, int rangeTo, Node currentNode) {
		
		if (currentNode.rangeFrom == rangeFrom && currentNode.rangeTo == rangeTo)
			return currentNode;
    		// optimization to circumvent recursive calls
		else if (currentNode.rangeTo - currentNode.rangeFrom == 1)
			return (rangeTo == currentNode.rangeTo) ? currentNode.rightNode : currentNode.leftNode;
    		// optimization to circumvent recursive calls
		else if (rangeTo == rangeFrom) {
			Node temp = currentNode;
			while (temp.rangeFrom != temp.rangeTo) {
			  temp = (rangeFrom <= (temp.rangeFrom + temp.rangeTo)/2) ? temp.leftNode : temp.rightNode;				
			}
			return temp;
		}

		int rangeMid = (currentNode.rangeFrom + currentNode.rangeTo)/2;

		if (rangeFrom >= rangeMid+1)
			return findMaxSum(rangeFrom, rangeTo, currentNode.rightNode);	
		else if (rangeTo <= rangeMid)
			return findMaxSum(rangeFrom, rangeTo, currentNode.leftNode);	
		else {
			return Node.computeSum(findMaxSum(rangeFrom, rangeMid, currentNode.leftNode),
					findMaxSum(rangeMid+1, rangeTo, currentNode.rightNode));
		}

	}

	public int MaxSumQuery(int rangeFrom, int rangeTo) {
		return findMaxSum(rangeFrom, rangeTo, root).maxSum;
	}

}

class Node {

	Node leftNode, rightNode, parent;
	public int rangeFrom, rangeTo;
	public int maxSumFromLeft, maxSumUptoRight, maxSum, totalSum;

	Node() {
		this.leftNode = null;
		this.rightNode = null;
		this.parent = null;
	};

	Node(int rangeFrom, int rangeTo) {
		this();
		this.rangeFrom = rangeFrom;
		this.rangeTo = rangeTo;	
	}

	public void addChildren(Node leftChild, Node rightChild) {
		addLeftChild(leftChild);
		addRightChild(rightChild);
		computeSum();
	}
	
	public static Node computeSum(Node leftChild, Node rightChild) {
		Node temp = new Node();
		temp.maxSumFromLeft = Integer.max(leftChild.maxSumFromLeft, leftChild.totalSum + rightChild.maxSumFromLeft);
		temp.maxSumUptoRight = Integer.max(rightChild.maxSumUptoRight, rightChild.totalSum + leftChild.maxSumUptoRight);
		temp.totalSum = rightChild.totalSum + leftChild.totalSum;
		temp.maxSum = Integer.max(rightChild.maxSumFromLeft + leftChild.maxSumUptoRight, 
							Integer.max(leftChild.maxSum, rightChild.maxSum));
		return temp;
	}

	private void addRightChild(Node rightChild) {
		rightChild.parent = this;
		this.rightNode = rightChild;	
	}

	private void addLeftChild(Node leftChild) {
		leftChild.parent = this;
		this.leftNode = leftChild;
	}	
	
	private void computeSum() {
		this.maxSumFromLeft = Integer.max(this.leftNode.maxSumFromLeft, this.leftNode.totalSum + this.rightNode.maxSumFromLeft);
		this.maxSumUptoRight = Integer.max(this.rightNode.maxSumUptoRight, this.rightNode.totalSum + this.leftNode.maxSumUptoRight);
		this.totalSum = this.rightNode.totalSum + this.leftNode.totalSum;
		this.maxSum = Integer.max(this.rightNode.maxSumFromLeft + this.leftNode.maxSumUptoRight, 
							Integer.max(this.leftNode.maxSum, this.rightNode.maxSum));
	}

}
