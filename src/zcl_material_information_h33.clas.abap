CLASS zcl_material_information_H33 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING
        matnr               TYPE i_product-product
      RETURNING
        VALUE(material_art) TYPE i_product-producttype.
ENDCLASS.



CLASS zcl_material_information_H33 IMPLEMENTATION.


  METHOD get_material_art.
    DATA material TYPE i_product.
    DATA production_date TYPE datn.
    DATA bool_tmp TYPE boole_d.

    production_date = sy-datum.


* Quick Fix Replace 'OLD SQL' with NEW SQL.
* 09/30/2023 20:19:13 STUDENTH33
* Transport S4HK902734 Exercise H33 S4Hana Code migration to cloud
* Replaced Code:
*    SELECT SINGLE mtart FROM mara INTO CORRESPONDING FIELDS OF material WHERE matnr = matnr.

**SELECT SINGLE FROM MARA fields MTART WHERE MATNR = @MATNR INTO CORRESPONDING FIELDS OF @MATERIAL .
    SELECT SINGLE FROM i_product FIELDS producttype WHERE product = @matnr INTO CORRESPONDING FIELDS OF @material .
    material_art = material-producttype.


* End of Quick Fix



* Quick Fix Replace MOVE with an assignment.
* 09/30/2023 20:19:13 STUDENTH33
* Transport S4HK902734 Exercise H33 S4Hana Code migration to cloud
* Replaced Code:
*    MOVE material-mtart TO material_art.

    MATERIAL_ART = MATERIAL-producttype.

* End of Quick Fix


  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_information_H33.
    material_info = NEW zcl_material_information_H33(  ).
    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).
  ENDMETHOD.
ENDCLASS.

