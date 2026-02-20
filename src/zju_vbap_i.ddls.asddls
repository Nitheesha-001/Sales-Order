@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Item Interface entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZJU_VBAP_I
  as select from ZJU_VBAP
  association to parent ZJU_VBAK_I as _VBAK on $projection.VbelnUuid = _VBAK.VbelnUuid
{
  key posnr_uuid            as PosnrUuid,
      parent_uuid           as VbelnUuid,
      posnr_id              as PosnrId,
      matnr                 as Matnr,
      arktx                 as Arktx,
      @Semantics.amount.currencyCode: 'Currencycode'
      netwr                 as Netwr,
      currency_code         as CurrencyCode,
      erdat                 as Erdat,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _VBAK // Make association public
}
