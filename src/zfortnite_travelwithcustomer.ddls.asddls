@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel with Customer'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZFORTNITE_TravelWithCustomer
  as select from ZFORTNITE_Customer as c
    inner join   ZFORTNITE_Travel   as t on c.CustomerId = t.CustomerId
{
  key t.TravelId,
  c.FirstName,
  c.LastName,
  c.Title,
  c.Street,
  c.PostalCode,
  c.City,
  c.CountryCode,
  t.AgencyId,
  t.CustomerId,
  t.BeginDate,
  t.EndDate,
  t.BookingFee,
  t.TotalPrice,
  t.CurrencyCode,
  t.Description,
  t.Status,
  
  dats_days_between(t.BeginDate, t.EndDate) + 1 as Duration 
  
 
}
where
  c.CountryCode = 'DE'
