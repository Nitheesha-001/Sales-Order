@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZJU_VBAK_I
  as select from ZJU_VBAK
  composition [0..*] of ZJU_VBAP_I as _VBAP
{
  key vbeln_uuid            as VbelnUuid,
      vbeln_id              as VbelnId,
      erdat                 as Erdat,
      auart                 as Auart,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      netwr                 as Netwr,
      currency_code         as CurrencyCode,
      kunnr                 as Kunnr,
      bukrs_vf              as BukrsVf,
       @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,

      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,

      @Semantics.user.lastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      
      _VBAP // Make association public
}
