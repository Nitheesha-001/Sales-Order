@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Item Consumption Entity'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
define view entity ZJU_VBAP_C as projection on ZJU_VBAP_I
{
    key PosnrUuid,
    VbelnUuid,
    PosnrId,
    Matnr,
    Arktx,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Netwr,
    CurrencyCode,
    Erdat,
    LocalLastChangedAt,
    /* Associations */
    _VBAK: redirected to parent ZJU_VBAK_C
}
