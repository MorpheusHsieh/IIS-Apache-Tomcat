import MenuItem;
import MenuItemNode;
import MenuItemList;

public class Test_LinkList
{
  public static void main(String[] args)
  {
    MenuItemList ll = new MenuItemList();
    ll.ListAllNode();
    System.out.println("");

    System.out.println("�W�[�`�I Node01");
    MenuItemNode node = new MenuItemNode("Node01");
    MenuItemList ll01 = ll.Insert(node);
    ll01.ListAllNode();
  }
}