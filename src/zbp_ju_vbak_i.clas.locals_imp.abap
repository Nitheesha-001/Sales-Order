CLASS lhc_VBAK DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR vbak RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR vbak RESULT result.
    METHODS setheaderid FOR DETERMINE ON SAVE
      IMPORTING keys FOR vbak~setheaderid.

ENDCLASS.

CLASS lhc_VBAK IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD setheaderid.

* Read entity of Sales order details
    READ ENTITIES OF zju_vbak_i IN LOCAL MODE
    ENTITY vbak
    FIELDS ( VbelnId )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_vbak).

*  Delete the record where already existing in Sales order table
    DELETE lt_vbak WHERE VbelnId IS NOT INITIAL.

    SELECT SINGLE FROM zju_vbak FIELDS MAX( vbeln_id ) INTO @DATA(lv_vbenlid_max).

* Modify Sales order Entities
    MODIFY ENTITIES OF zju_vbak_i IN LOCAL MODE
    ENTITY vbak
    UPDATE FIELDS ( VbelnId )
    WITH VALUE #( FOR ls_vbeln_id IN lt_vbak INDEX INTO lv_index
                   ( %tky = ls_vbeln_id-%tky
                    VbelnId = lv_vbenlid_max + lv_index ) ).

  ENDMETHOD.

ENDCLASS.
