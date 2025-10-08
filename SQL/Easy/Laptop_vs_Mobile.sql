SELECT
  COUNT(*) FILTER(
    WHERE
      device_type = 'tablet'
      OR device_type = 'phone'
  ) as mobile_views,
  COUNT(*) FILTER(
    WHERE
      device_type = 'laptop'
  ) as laptop_views
FROM
  viewership;