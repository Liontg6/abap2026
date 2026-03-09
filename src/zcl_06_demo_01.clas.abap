CLASS zcl_06_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA travels TYPE TABLE OF /DMO/I_Travel_D.

  SELECT from /DMO/I_Travel_D
    FIELDS *
    into table @travels.

  out->write( travels ).

  ENDMETHOD.
ENDCLASS.
