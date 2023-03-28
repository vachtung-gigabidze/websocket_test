import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deleteDuplicates is: 1', () {
    ListNode? head = ListNode(1, ListNode(1, ListNode(2, null)));
    expect(deleteDuplicates(head)?.val, 1);
  });
  test('mergeTwoLists', () {
    ListNode? list1 = ListNode(1, ListNode(1, ListNode(2, null)));
    ListNode? list2 = ListNode(1, ListNode(1, ListNode(2, null)));

    expect(mergeTwoLists(list1, list2)?.val, 1);
  });
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

printListNode(ListNode? head) {
  ListNode? temp = head;
  while (temp != null) {
    print('${temp.val.toString()} ');
    temp = temp.next;
  }
}

ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
  ListNode? merge = ListNode(0);
  var result = merge;

  while (list1 != null && list2 != null) {
    if (list1.val < list2.val) {
      merge?.next = ListNode(list1.val);
      list1 = list1.next;
    } else {
      merge?.next = ListNode(list2.val);
      list2 = list2.next;
    }
    merge = merge?.next;
  }

  while (list1 != null) {
    merge?.next = ListNode(list1.val);
    list1 = list1.next;
    merge = merge?.next;
  }
  while (list2 != null) {
    merge?.next = ListNode(list2.val);
    list1 = list2.next;
    merge = merge?.next;
  }

  return result.next;
}

// class ListNodeFunc {
//   ListNode? _head = null;
//   ListNode? get head => _head;

//   ListNode? reverse(ListNode? node) {
//     if (node == null) return null;

//     if (node.next == null) {
//       _head = node;
//       return node;
//     }

//     var node1 = reverse(node.next);
//     node1?.next = node;
//     node.next = null;
//     return node;
//   }

//   ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
//     if (list1 == null && list2 == null) {
//       return null;
//     }

//     if (list1 != null && list2 != null) {
//       ListNode? head = (l1, l2) {
//         if (l1.val < list2.val) {
//           list1.next = mergeTwoLists(list1.next, list2);
//           return list1;
//         } else {
//           list2.next = mergeTwoLists(list1, list2.next);
//           return list2;
//         }
//       }(list1, list2);
//     }

//     if (list1 == null && list2 != null) {
//       ListNode? head = list2;
//       list2.next = mergeTwoLists(list1, list2.next);
//       return head;
//     }
//     if (list1 != null && list2 == null) {
//       ListNode? head = list1;
//       list1.next = mergeTwoLists(list1.next, list2);
//       return head;
//     }

//     list1?.next = mergeTwoLists(list1.next, list2);

//     return head;
//   }
// }

// ListNode? next;
// while ((list1 != null || list2 != null)) {
//   next = list2;
//   list2 = list2?.next;
//   newList?.next = next;
//   newList = next;

//   next = list1;
//   list1 = list1?.next;
//   newList?.next = next;
//   newList = next;
// }

ListNode? deleteDuplicates(ListNode? head) {
  ListNode? pre = ListNode(-1, head);

  ListNode? cur = pre;

  while (pre != null) {
    if (pre.next?.val == pre.val) {
      ListNode? dub = pre;
      while (dub != null) {
        if (dub.next?.val != dub.val) {
          pre.next = dub.next;
          break;
        } else {
          dub = dub.next;
        }
      }
    } else {
      pre = pre.next;
    }
  }
  return cur.next;
}
