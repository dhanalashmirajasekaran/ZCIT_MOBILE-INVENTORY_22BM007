CLASS zcit_inv_22bm007 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcit_inv_22bm007 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: gv_mobile_id TYPE i,
          gv_brand     TYPE string.
    CONSTANTS: gc_tax TYPE i VALUE 18.

    " --- STEP 2: Structure (Local Structure) ---
    TYPES: BEGIN OF ty_mobile,
             id    TYPE i,
             brand TYPE string,
             price TYPE i,
           END OF ty_mobile.

    " --- STEP 3: Internal Table
    DATA: gt_mobiles TYPE STANDARD TABLE OF ty_mobile,
          gs_mobile  TYPE ty_mobile.

    " --- STEP 4: Insert Records (APPEND)
    gs_mobile-id    = 501.
    gs_mobile-brand = 'Samsung'.
    gs_mobile-price = 15000.
    APPEND gs_mobile TO gt_mobiles.

    gs_mobile-id    = 502.
    gs_mobile-brand = 'iPhone'.
    gs_mobile-price = 80000.
    APPEND gs_mobile TO gt_mobiles.

    " --- STEP 5: Display Table Data ---
    out->write( '--- Full Mobile Inventory ---' ).
    out->write( gt_mobiles ).

    " --- STEP 6: READ TABLE Example ---
    READ TABLE gt_mobiles INTO gs_mobile WITH KEY id = 503.

    " --- STEP 7: Use SY-SUBRC ---
    IF sy-subrc = 0.
      out->write( |Mobile Found: { gs_mobile-brand }| ).
    ELSE.
      out->write( 'Mobile Not Found' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
