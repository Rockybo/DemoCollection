/**
 全 O(1) 的数据结构
 请你实现一个数据结构支持以下操作：

 Inc(key) - 插入一个新的值为 1 的 key。或者使一个存在的 key 增加一，保证 key 不为空字符串。
 Dec(key) - 如果这个 key 的值是 1，那么把他从数据结构中移除掉。否则使一个存在的 key 值减一。如果这个 key 不存在，这个函数不做任何事情。key 保证不为空字符串。
 GetMaxKey() - 返回 key 中值最大的任意一个。如果没有元素存在，返回一个空字符串"" 。
 GetMinKey() - 返回 key 中值最小的任意一个。如果没有元素存在，返回一个空字符串""。
 */
import Foundation

class AllOne {

    class Node {
        Node pre, next;
        int val;
        ArrayList<String> content;

        public Node(int val, boolean isData) {
            this.val = val;
            if (isData) this.content = new ArrayList<>();
        }
    }

    class DoubleLinkedList {
        Node head, tail;

        public DoubleLinkedList() {
            head = new Node(0, false);
            tail = new Node(0, false);
            head.next = tail;
            tail.pre = head;
        }

        /**
         * 在base前插入节点
         *
         * @param base
         * @param node
         */
        public void insertNodeAtPre(Node base, Node node) {
            node.pre = base.pre;
            base.pre.next = node;
            node.next = base;
            base.pre = node;
        }

        /**
         * 在base后插入节点
         *
         * @param base
         * @param node
         */
        public void insertNodeAtNext(Node base, Node node) {
            node.next = base.next;
            base.next.pre = node;
            base.next = node;
            node.pre = base;
        }

        public void deleteNode(Node node) {
            node.pre.next = node.next;
            node.next.pre = node.pre;
        }

        public void deleteTail() {
            tail.pre = tail.pre.pre;
            tail.pre.next = tail;
        }
    }

    HashMap<String, Node> dict;
    DoubleLinkedList list;

    /**
     * Initialize your data structure here.
     */
    public AllOne() {
        dict = new HashMap<>();
        list = new DoubleLinkedList();
    }

    /**
     * Inserts a new key <Key> with value 1. Or increments an existing key by 1.
     */
    public void inc(String key) {
        int num = 0;
        if (dict.containsKey(key)) {
            num = dict.get(key).val;
            Node base = dict.get(key);
            if (base.content.size() == 1 && base.next.val != num + 1) {
                base.val = num + 1;
            } else {
                base.content.remove(key);
                if (base.next.val == num + 1) {
                    base.next.content.add(key);
                    dict.put(key, base.next);
                } else {
                    Node node = new Node(num + 1, true);
                    node.content.add(key);
                    list.insertNodeAtNext(base, node);
                    dict.put(key, node);
                }
                if (base.content.isEmpty()) list.deleteNode(base);
            }
        } else {
            if (list.head.next.val == 1) {
                dict.put(key, list.head.next);
                list.head.next.content.add(key);
            } else {
                Node node = new Node(num + 1, true);
                dict.put(key, node);
                node.content.add(key);
                list.insertNodeAtNext(list.head, node);
            }
        }
    }

    /**
     * Decrements an existing key by 1. If Key's value is 1, remove it from the data structure.
     */
    public void dec(String key) {
        if (!dict.containsKey(key)) return;
        Node base = dict.get(key);
        int num = base.val;
        if (base.content.size() == 1) {
            num--;
            if (num == 0) {
                list.deleteNode(base);
                dict.remove(key);
            } else {
                if (base.pre.val == num) {
                    base.pre.content.add(key);
                    list.deleteNode(base);
                    dict.put(key, base.pre);
                } else {
                    base.val = num;
                }
            }
        } else {
            base.content.remove(key);
            num--;
            if (num == 0) {
                dict.remove(key);
            } else {
                if (base.pre.val == num) {
                    base.pre.content.add(key);
                    dict.put(key, base.pre);
                } else {
                    Node node = new Node(num, true);
                    node.content.add(key);
                    list.insertNodeAtPre(base, node);
                    dict.put(key, node);
                }
            }

        }
    }

    /**
     * Returns one of the keys with maximal value.
     */
    public String getMaxKey() {
        return list.tail.pre.content == null ? "" : list.tail.pre.content.get(0);
    }

    /**
     * Returns one of the keys with Minimal value.
     */
    public String getMinKey() {
        return list.head.next.content == null ? "" : list.head.next.content.get(0);
    }
}



