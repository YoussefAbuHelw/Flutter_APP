import java.util.List;
import java.util.ArrayList;

class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;

    TreeNode() {
    }

    TreeNode(int val) {
        this.val = val;
    }

    TreeNode(int val, TreeNode left, TreeNode right) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}


public class Main {
    public static TreeNode findNode(TreeNode root, int target) {
        if (root == null || root.val == target) {
            return root;
        }

        if (target < root.val) {
            return findNode(root.left, target);
        } else {
            return findNode(root.right, target);
        }
    }

    public static void main(String[] args) {
        int x = 10;
        int y = 0;
        try {
            System.out.println(x / y);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }finally {
            System.out.println("finally");
        }
        System.out.println("hello");
//        TreeNode root = new TreeNode(5);
//        root.left = new TreeNode(3);
//        root.right = new TreeNode(6);
//        root.left.left = new TreeNode(2);
//        root.left.right = new TreeNode(4);
//        root.right.right = new TreeNode(7);
//        System.out.println(root.val);
//        List<Integer> re = traverse(root);
//        System.out.println(re);
//        print(root);
    }

    static boolean findTarget(TreeNode root, int k) {
        boolean result = false;

        if (k <= root.val) {
            TreeNode node1 = findNode(root, root.val);
            TreeNode node2 = findNode(root, root.left.val);
            int sum = node1.val + node2.val;
            if (sum == k) {
                result = true;
            } else if (sum < k) {
                findTarget(root.right, k);
            } else {
                findTarget(root.left, k);
            }
        } else {

        }
        return result;
    }

    static List<Integer> traverse(TreeNode root) {

        List<Integer> result = new ArrayList<>();
        traverseHelper(root, result);
        return result;
    }

    static void traverseHelper(TreeNode root, List<Integer> result) {
        if (root == null) {
            return;
        }
        traverseHelper(root.left, result);
        result.add(root.val);
        traverseHelper(root.right, result);
    }
}