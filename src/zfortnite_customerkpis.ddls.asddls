@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer KPIs'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZFORTNITE_CustomerKpis
  with parameters P_City : abap.char( 40 )
  as select from ZFORTNITE_TravelWithCustomer as t
{
  key CustomerId,
      CustomerName,
      Street,
      PostalCode,
      City,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(BookingFee + TotalPrice)    as TotalRevenue,
      CurrencyCode,
      avg(Duration as abap.dec(16,0)) as AverageDuration,
      count(distinct AgencyId)        as NumberOfDifferentAgencys
}
where City = $parameters.P_City
group by
  CustomerId,
  CustomerName,
  Street,
  PostalCode,
  City,
  CurrencyCode
having
  sum(BookingFee + TotalPrice) >= 5000
