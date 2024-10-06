import 'package:wendys/features/menu/data/model/menu_item_model.dart';
import 'package:wendys/features/menu/data/model/sub_menu_model.dart';
import 'package:wendys/features/order/data/model/order_item_model.dart';

final getSiteMenu = {
  "serviceStatus": "SUCCESS",
  "menuLists": {
    "subMenus": [
      {
        "name": "Hamburgers",
        "baseImageName": "121",
        "menuItems": [
          31535,
          30000,
          31704,
        ],
      },
    ],
    "menuItems": [
      {
        "name": "Dave's Single®",
        "description":
            "A quarter-pound* of fresh beef, American cheese, crisp lettuce, tomato, pickle, ketchup, mayo, and onion on a toasted bun — just the way Dave intended.",
        "menuItemId": 30000,
        "priceRange": "\$3.59",
        "calorieRange": "590 Cal",
      }
    ]
  },
};

SubMenuModel subMenuModel = SubMenuModel(
  name: 'Hamburgers',
  baseImageName: '121',
  menuItems: const [
    31535,
    30000,
    31704,
  ],
);

const MenuItemModel menuItemModel = MenuItemModel(
  name: "Dave's Single®",
  description:
      'A quarter-pound* of fresh beef, American cheese, crisp lettuce, tomato, pickle, ketchup, mayo, and onion on a toasted bun — just the way Dave intended.',
  menuItemId: 30000,
  calorieRange: '590 Cal',
  priceRange: '\$3.59',
);

const OrderItemModel orderItemModel = OrderItemModel(
  name: "Dave's Single®",
  menuItemId: 30000,
  priceRange: '\$3.59',
  quantity: 1,
);
