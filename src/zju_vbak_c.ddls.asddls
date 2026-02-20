@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Consumption Entity'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZJU_VBAK_C
provider contract transactional_query
  as projection on ZJU_VBAK_I
{
  key VbelnUuid,
      VbelnId,
      Erdat,
      Auart,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Netwr,
      CurrencyCode,
      Kunnr,
      BukrsVf,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _VBAP:redirected to composition child ZJU_VBAP_C
}
