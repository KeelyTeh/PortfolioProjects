use healthysnacks;

Drop trigger if exists healthysnacks.update_quantity;

/* This trigger updates the AvailableQuantity in Products every time an order is made via the update in the Quantity column
in OrderedItems (via matching productid in Products and OrderedItems). */

DELIMITER $$

CREATE TRIGGER tr_update_quantity
AFTER INSERT ON ordereditems FOR EACH ROW
BEGIN
  UPDATE products
    SET products.availablequantity = products.availablequantity - new.quantity
    WHERE products.productid = NEW.productid;
    
	END$$

DELIMITER ;

/* This trigger shows an error message if someone attempts to place an order for one or more products when the available quantity is 
insufficient to fulfill the order. */

DELIMITER $$

CREATE TRIGGER tr_insufficient_quantity
BEFORE INSERT ON ordereditems FOR EACH ROW
BEGIN
  IF (NEW.Quantity > 
   (SELECT AvailableQuantity FROM Products WHERE Products.ProductID = NEW.ProductID)) THEN
	CALL ErrorMsg ('Insufficient quantity to cover order.');
    
END IF;
    
	END$$

DELIMITER ;

Drop trigger if exists tr_insufficient_quantity;


/* This trigger displays an error message if an attempted order is made that does not meet MOQ (minimum order quantity) 
for one or more products. */

DELIMITER $$

CREATE TRIGGER tr_MOQ_not_met
BEFORE INSERT ON ordereditems FOR EACH ROW
BEGIN
  IF (NEW.Quantity < 
   (SELECT MOQUnits FROM Products WHERE Products.ProductID = NEW.ProductID)) THEN
	CALL ErrorMsg ('This order does not meet MOQs for one or more products.');
    
END IF;
    
	END$$

DELIMITER ;



DELIMITER ;

Drop trigger if exists tr_MOQ_not_met;

/* The following trigger restores the available quantity in the products table when an orders/ordereditems pair is deleted. */

DELIMITER $$

CREATE TRIGGER tr_update_quantity_order_delete
AFTER DELETE ON ordereditems FOR EACH ROW
BEGIN
	UPDATE products
    SET products.availablequantity = products.availablequantity + old.quantity
    WHERE products.productid = old.productid;
    
	END$$

DELIMITER ;

