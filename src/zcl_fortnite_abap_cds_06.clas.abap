CLASS zcl_fortnite_abap_cds_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fortnite_abap_cds_06 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA lv_city TYPE /dmo/city VALUE 'Berlin'.

  SELECT CustomerID,
  CustomerName,
  TotalRevenue
  FROM ZFORTNITE_CustomerKpis( p_city = @lv_city )
  ORDER BY TotalRevenue DESCENDING
  INTO TABLE @DATA(lt_customers).

  ENDMETHOD.
ENDCLASS.
