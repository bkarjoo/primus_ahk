// Launch Rules
#define cd CurrentDate

#define eight_twenty_four (cd = .2015-08-24.)

#define buyback_exclude_day (cd = .2016-06-30. or cd = .2017-06-29. or cd = .2018-06-29. or cd = .2019-06-28.)

#define half_day (cd = .2011-11-25. or cd = .2012-07-03. or cd = .2012-11-23. or cd = .2012-12-24. or cd = .2013-07-03. or cd = .2013-11-29. or cd = .2013-12-24. or cd = .2014-07-03. or cd = .2014-11-28. or cd = .2014-12-24. or cd = .2014-12-25. or cd = .2015-11-27. or cd = .2015-12-24. or cd = .2016-11-25. or cd = .2017-07-03. or cd = .2017-11-24. or cd = .2018-07-03. or cd = .2018-11-23. or cd = .2018-12-24. or cd = .2019-07-03. or cd = .2019-11-29. or cd = .2019-12-24.)

#define fed_day (cd = .2013-03-20. or cd = .2013-05-01. or cd = .2013-06-19. or cd = .2013-07-31. or cd = .2013-09-18. or cd = .2013-10-30. or cd = .2013-12-18. or cd = .2014-01-29. or cd = .2014-03-19. or cd = .2014-04-30. or cd = .2014-06-18. or cd = .2014-07-30. or cd = .2014-09-17. or cd = .2014-10-29. or cd = .2014-12-17. or cd = .2015-01-28. or cd = .2015-03-18. or cd = .2015-04-29. or cd = .2015-06-17. or cd = .2015-07-29. or cd = .2015-09-17. or cd = .2015-10-28. or cd = .2015-12-16. or cd = .2016-01-27. or cd = .2016-03-16. or cd = .2016-04-27. or cd = .2016-06-15. or cd = .2016-07-27. or cd = .2016-09-21. or cd = .2016-11-02. or cd = .2016-12-14. or cd = .2017-02-01. or cd = .2017-03-15. or cd = .2017-05-03. or cd = .2017-06-14. or cd = .2017-07-26. or cd = .2017-09-20. or cd = .2017-11-01. or cd = .2017-12-13. or cd = .2018-01-31. or cd = .2018-03-21. or cd = .2018-05-02. or cd = .2018-06-13. or cd = .2018-08-01. or cd = .2018-09-26. or cd = .2018-11-08. or cd = .2018-12-19. or cd = .2019-01-30. or cd = .2019-03-20. or cd = .2019-05-01. or cd = .2019-06-19. or cd = .2019-07-31. or cd = .2019-09-18. or cd = .2019-10-30.)

#define opex_day (cd = .2011-03-18. OR cd = .2011-04-15. OR cd = .2011-05-20. OR cd = .2011-06-17. OR cd = .2011-07-15. OR cd = .2011-08-19. OR cd = .2011-09-16. OR cd = .2011-10-21. OR cd = .2011-11-18. OR cd = .2011-12-16. OR cd = .2012-01-20. OR cd = .2012-02-17. OR cd = .2012-03-16. OR cd = .2012-04-20. OR cd = .2012-05-18. OR cd = .2012-06-15. OR cd = .2012-07-20. OR cd = .2012-08-17. OR cd = .2012-09-21. OR cd = .2012-10-19. OR cd = .2012-11-16. OR cd = .2012-12-21. OR cd = .2013-01-18. OR cd = .2013-02-15. OR cd = .2013-03-15. OR cd = .2013-04-19. OR cd = .2013-05-17. OR cd = .2013-06-21. OR cd = .2013-07-19. OR cd = .2013-08-16. OR cd = .2013-09-20. OR cd = .2013-10-18. OR cd = .2013-11-15. OR cd = .2013-12-20. OR cd = .2014-01-17. OR cd = .2014-02-21. OR cd = .2014-03-21. OR cd = .2014-04-18. OR cd = .2014-05-16. OR cd = .2014-06-20. OR cd = .2014-07-18. OR cd = .2014-08-15. OR cd = .2014-09-19. OR cd = .2014-10-17. OR cd = .2014-11-21. OR cd = .2014-12-19. OR cd = .2015-01-16. OR cd = .2015-02-20. OR cd = .2015-03-20. OR cd = .2015-04-17. OR cd = .2015-05-15. OR cd = .2015-06-19. OR cd = .2015-07-17. OR cd = .2015-08-21. OR cd = .2015-09-18. OR cd = .2015-10-16. OR cd = .2015-11-20. OR cd = .2015-12-18. OR cd = .2016-01-15. OR cd = .2016-02-19. OR cd = .2016-03-18. OR cd = .2016-04-15. OR cd = .2016-05-20. OR cd = .2016-06-17. OR cd = .2016-07-15. OR cd = .2016-08-19. OR cd = .2016-09-16. OR cd = .2016-10-21. OR cd = .2016-11-18. OR cd = .2016-12-16. OR cd = .2017-01-20. OR cd = .2017-02-17. OR cd = .2017-03-17. OR cd = .2017-04-21. OR cd = .2017-05-19. OR cd = .2017-06-16. OR cd = .2017-07-21. OR cd = .2017-08-18. OR cd = .2017-09-15. OR cd = .2017-10-20. OR cd = .2017-11-17. OR cd = .2017-12-15. OR cd = .2018-01-19. OR cd = .2018-02-16. OR cd = .2018-03-16. OR cd = .2018-04-20. OR cd = .2018-05-18. OR cd = .2018-06-15. OR cd = .2018-07-20. OR cd = .2018-08-17. OR cd = .2018-09-21. OR cd = .2018-10-19. OR cd = .2018-11-16. OR cd = .2018-12-21. OR cd = .2019-01-18. OR cd = .2019-02-15. OR cd = .2019-03-15. OR cd = .2019-04-18. OR cd = .2019-05-17. OR cd = .2019-06-21. OR cd = .2019-07-19. OR cd = .2019-08-16. OR cd = .2019-09-20. OR cd = .2019-10-18. OR cd = .2019-11-15. OR cd = .2019-12-20. OR cd = .2020-01-17. OR cd = .2020-02-21. OR cd = .2020-03-20. OR cd = .2020-04-17. OR cd = .2020-05-15. OR cd = .2020-06-19. OR cd = .2020-07-17. OR cd = .2020-08-21. OR cd = .2020-09-18. OR cd = .2020-10-16. OR cd = .2020-11-20. OR cd = .2020-12-18. OR cd = .2021-01-15. OR cd = .2021-02-19. OR cd = .2021-03-19. OR cd = .2021-04-16. OR cd = .2021-05-21. OR cd = .2021-06-18. OR cd = .2021-07-16. OR cd = .2021-08-20. OR cd = .2021-09-17. OR cd = .2021-10-15. OR cd = .2021-11-19. OR cd = .2021-12-17. OR cd = .2022-01-21. OR cd = .2022-02-18. OR cd = .2022-03-18. OR cd = .2022-04-15. OR cd = .2022-05-20. OR cd = .2022-06-17. OR cd = .2022-07-15. OR cd = .2022-08-19. OR cd = .2022-09-16. OR cd = .2022-10-21. OR cd = .2022-11-18. OR cd = .2022-12-16. OR cd = .2023-01-20. OR cd = .2023-02-17. OR cd = .2023-03-17. OR cd = .2023-04-21. OR cd = .2023-05-19. OR cd = .2023-06-16. OR cd = .2023-07-21. OR cd = .2023-08-18. OR cd = .2023-09-15. OR cd = .2023-10-20. OR cd = .2023-11-17. OR cd = .2023-12-15. OR cd = .2024-01-19. OR cd = .2024-02-16. OR cd = .2024-03-15. OR cd = .2024-04-19. OR cd = .2024-05-17. OR cd = .2024-06-21. OR cd = .2024-07-19. OR cd = .2024-08-16. OR cd = .2024-09-20. OR cd = .2024-10-18. OR cd = .2024-11-15. OR cd = .2024-12-20. OR cd = .2025-01-17. OR cd = .2025-02-21. OR cd = .2025-03-21. OR cd = .2025-04-18. OR cd = .2025-05-16. OR cd = .2025-06-20. OR cd = .2025-07-18. OR cd = .2025-08-15. OR cd = .2025-09-19. OR cd = .2025-10-17. OR cd = .2025-11-21. OR cd = .2025-12-19. OR cd = .2026-01-16. OR cd = .2026-02-20.)

#define nfp_day (cd = .2011-04-01. or cd = .2011-05-06. or cd = .2011-06-03. or cd = .2011-07-08. or cd = .2011-08-05. or cd = .2011-09-02. or cd = .2011-10-07. or cd = .2011-11-04. or cd = .2011-12-02. or cd = .2012-01-06. or cd = .2012-02-03. or cd = .2012-03-09. or cd = .2012-04-06. or cd = .2012-05-04. or cd = .2012-06-01. or cd = .2012-07-06. or cd = .2012-08-03. or cd = .2012-09-07. or cd = .2012-10-05. or cd = .2012-11-02. or cd = .2012-12-07. or cd = .2013-01-04. or cd = .2013-02-01. or cd = .2013-03-08. or cd = .2013-04-05. or cd = .2013-05-03. or cd = .2013-06-07. or cd = .2013-07-05. or cd = .2013-08-02. or cd = .2013-09-06. or cd = .2013-10-22. or cd = .2013-11-08. or cd = .2013-12-06. or cd = .2014-01-10. or cd = .2014-02-07. or cd = .2014-03-07. or cd = .2014-04-04. or cd = .2014-05-02. or cd = .2014-06-06. or cd = .2014-07-03. or cd = .2014-08-01. or cd = .2014-09-05. or cd = .2014-10-03. or cd = .2014-11-07. or cd = .2014-12-05. or cd = .2015-01-09. or cd = .2015-02-06. or cd = .2015-03-06. or cd = .2015-04-03. or cd = .2015-05-08. or cd = .2015-06-05. or cd = .2015-07-02. or cd = .2015-08-07. or cd = .2015-09-04. or cd = .2015-10-02. or cd = .2015-11-06. or cd = .2015-12-04. or cd = .2016-01-08. or cd = .2016-02-05. or cd = .2016-03-04. or cd = .2016-04-01. or cd = .2016-05-06. or cd = .2016-06-03. or cd = .2016-07-08. or cd = .2016-08-05. or cd = .2016-09-02. or cd = .2016-10-07. or cd = .2016-11-04. or cd = .2016-12-02. or cd = .2017-01-06. or cd = .2017-02-03. or cd = .2017-03-10. or cd = .2017-04-07. or cd = .2017-05-05. or cd = .2017-06-02. or cd = .2017-07-07. or cd = .2017-08-04. or cd = .2017-09-01. or cd = .2017-10-06. or cd = .2017-11-03. or cd = .2017-12-08. or cd = .2018-01-05. or cd = .2018-02-02. or cd = .2018-03-09. or cd = .2018-04-06. or cd = .2018-05-04. or cd = .2018-06-01. or cd = .2018-07-06. or cd = .2018-08-03. or cd = .2018-09-07. or cd = .2018-10-05. or cd = .2018-11-02. or cd = .2018-12-07. or cd = .2019-01-04. or cd = .2019-02-01. or cd = .2019-03-08. or cd = .2019-04-05. or cd = .2019-05-03. or cd = .2019-06-07. or cd = .2019-07-05. or cd = .2019-08-02. or cd = .2019-09-06. or cd = .2019-10-04. or cd = .2019-11-01. or cd = .2019-12-06. or cd = .2020-01-10.)

#define y11 (cd >= .2011-01-01. and cd <= .2011-12-31.)
#define y12 (cd >= .2012-01-01. and cd <= .2012-12-31.)
#define y13 (cd >= .2013-01-01. and cd <= .2013-12-31.)
#define y14 (cd >= .2014-01-01. and cd <= .2014-12-31.)
#define y15 (cd >= .2015-01-01. and cd <= .2015-12-31.)
#define y16 (cd >= .2016-01-01. and cd <= .2016-12-31.)
#define y17 (cd >= .2017-01-01. and cd <= .2017-12-31.)
#define y18 (cd >= .2018-01-01. and cd <= .2018-12-31.)

#define m1101 (cd >= .2011-01-01. and cd <= .2011-01-31.)
#define m1102 (cd >= .2011-02-01. and cd <= .2011-02-28.)
#define m1103 (cd >= .2011-03-01. and cd <= .2011-03-31.)
#define m1104 (cd >= .2011-04-01. and cd <= .2011-04-30.)
#define m1105 (cd >= .2011-05-01. and cd <= .2011-05-31.)
#define m1106 (cd >= .2011-06-01. and cd <= .2011-06-30.)
#define m1107 (cd >= .2011-07-01. and cd <= .2011-07-31.)
#define m1108 (cd >= .2011-08-01. and cd <= .2011-08-31.)
#define m1109 (cd >= .2011-09-01. and cd <= .2011-09-30.)
#define m1110 (cd >= .2011-10-01. and cd <= .2011-10-31.)
#define m1111 (cd >= .2011-11-01. and cd <= .2011-11-30.)
#define m1112 (cd >= .2011-12-01. and cd <= .2011-12-31.)

#define m1201 (cd >= .2012-01-01. and cd <= .2012-01-31.)
#define m1202 (cd >= .2012-02-01. and cd <= .2012-02-29.)
#define m1203 (cd >= .2012-03-01. and cd <= .2012-03-31.)
#define m1204 (cd >= .2012-04-01. and cd <= .2012-04-30.)
#define m1205 (cd >= .2012-05-01. and cd <= .2012-05-31.)
#define m1206 (cd >= .2012-06-01. and cd <= .2012-06-30.)
#define m1207 (cd >= .2012-07-01. and cd <= .2012-07-31.)
#define m1208 (cd >= .2012-08-01. and cd <= .2012-08-31.)
#define m1209 (cd >= .2012-09-01. and cd <= .2012-09-30.)
#define m1210 (cd >= .2012-10-01. and cd <= .2012-10-31.)
#define m1211 (cd >= .2012-11-01. and cd <= .2012-11-30.)
#define m1212 (cd >= .2012-12-01. and cd <= .2012-12-31.)

#define m1301 (cd >= .2013-01-01. and cd <= .2013-01-31.)
#define m1302 (cd >= .2013-02-01. and cd <= .2013-02-28.)
#define m1303 (cd >= .2013-03-01. and cd <= .2013-03-31.)
#define m1304 (cd >= .2013-04-01. and cd <= .2013-04-30.)
#define m1305 (cd >= .2013-05-01. and cd <= .2013-05-31.)
#define m1306 (cd >= .2013-06-01. and cd <= .2013-06-30.)
#define m1307 (cd >= .2013-07-01. and cd <= .2013-07-31.)
#define m1308 (cd >= .2013-08-01. and cd <= .2013-08-31.)
#define m1309 (cd >= .2013-09-01. and cd <= .2013-09-30.)
#define m1310 (cd >= .2013-10-01. and cd <= .2013-10-31.)
#define m1311 (cd >= .2013-11-01. and cd <= .2013-11-30.)
#define m1312 (cd >= .2013-12-01. and cd <= .2013-12-31.)

#define m1401 (cd >= .2014-01-01. and cd <= .2014-01-31.)
#define m1402 (cd >= .2014-02-01. and cd <= .2014-02-28.)
#define m1403 (cd >= .2014-03-01. and cd <= .2014-03-31.)
#define m1404 (cd >= .2014-04-01. and cd <= .2014-04-30.)
#define m1405 (cd >= .2014-05-01. and cd <= .2014-05-31.)
#define m1406 (cd >= .2014-06-01. and cd <= .2014-06-30.)
#define m1407 (cd >= .2014-07-01. and cd <= .2014-07-31.)
#define m1408 (cd >= .2014-08-01. and cd <= .2014-08-31.)
#define m1409 (cd >= .2014-09-01. and cd <= .2014-09-30.)
#define m1410 (cd >= .2014-10-01. and cd <= .2014-10-31.)
#define m1411 (cd >= .2014-11-01. and cd <= .2014-11-30.)
#define m1412 (cd >= .2014-12-01. and cd <= .2014-12-31.)

#define m1501 (cd >= .2015-01-01. and cd <= .2015-01-31.)
#define m1502 (cd >= .2015-02-01. and cd <= .2015-02-28.)
#define m1503 (cd >= .2015-03-01. and cd <= .2015-03-31.)
#define m1504 (cd >= .2015-04-01. and cd <= .2015-04-30.)
#define m1505 (cd >= .2015-05-01. and cd <= .2015-05-31.)
#define m1506 (cd >= .2015-06-01. and cd <= .2015-06-30.)
#define m1507 (cd >= .2015-07-01. and cd <= .2015-07-31.)
#define m1508 (cd >= .2015-08-01. and cd <= .2015-08-31.)
#define m1509 (cd >= .2015-09-01. and cd <= .2015-09-30.)
#define m1510 (cd >= .2015-10-01. and cd <= .2015-10-31.)
#define m1511 (cd >= .2015-11-01. and cd <= .2015-11-30.)
#define m1512 (cd >= .2015-12-01. and cd <= .2015-12-31.)

#define m1601 (cd >= .2016-01-01. and cd <= .2016-01-31.)
#define m1602 (cd >= .2016-02-01. and cd <= .2016-02-29.)
#define m1603 (cd >= .2016-03-01. and cd <= .2016-03-31.)
#define m1604 (cd >= .2016-04-01. and cd <= .2016-04-30.)
#define m1605 (cd >= .2016-05-01. and cd <= .2016-05-31.)
#define m1606 (cd >= .2016-06-01. and cd <= .2016-06-30.)
#define m1607 (cd >= .2016-07-01. and cd <= .2016-07-31.)
#define m1608 (cd >= .2016-08-01. and cd <= .2016-08-31.)
#define m1609 (cd >= .2016-09-01. and cd <= .2016-09-30.)
#define m1610 (cd >= .2016-10-01. and cd <= .2016-10-31.)
#define m1611 (cd >= .2016-11-01. and cd <= .2016-11-30.)
#define m1612 (cd >= .2016-12-01. and cd <= .2016-12-31.)

#define m1701 (cd >= .2017-01-01. and cd <= .2017-01-31.)
#define m1702 (cd >= .2017-02-01. and cd <= .2017-02-28.)
#define m1703 (cd >= .2017-03-01. and cd <= .2017-03-31.)
#define m1704 (cd >= .2017-04-01. and cd <= .2017-04-30.)
#define m1705 (cd >= .2017-05-01. and cd <= .2017-05-31.)
#define m1706 (cd >= .2017-06-01. and cd <= .2017-06-30.)
#define m1707 (cd >= .2017-07-01. and cd <= .2017-07-31.)
#define m1708 (cd >= .2017-08-01. and cd <= .2017-08-31.)
#define m1709 (cd >= .2017-09-01. and cd <= .2017-09-30.)
#define m1710 (cd >= .2017-10-01. and cd <= .2017-10-31.)
#define m1711 (cd >= .2017-11-01. and cd <= .2017-11-30.)
#define m1712 (cd >= .2017-12-01. and cd <= .2017-12-31.)

#define m1801 (cd >= .2018-01-01. and cd <= .2018-01-31.)
#define m1802 (cd >= .2018-02-01. and cd <= .2018-02-28.)
#define m1803 (cd >= .2018-03-01. and cd <= .2018-03-31.)
#define m1804 (cd >= .2018-04-01. and cd <= .2018-04-30.)
#define m1805 (cd >= .2018-05-01. and cd <= .2018-05-31.)
#define m1806 (cd >= .2018-06-01. and cd <= .2018-06-30.)
#define m1807 (cd >= .2018-07-01. and cd <= .2018-07-31.)
#define m1808 (cd >= .2018-08-01. and cd <= .2018-08-31.)
#define m1809 (cd >= .2018-09-01. and cd <= .2018-09-30.)
#define m1810 (cd >= .2018-10-01. and cd <= .2018-10-31.)
#define m1811 (cd >= .2018-11-01. and cd <= .2018-11-30.)
#define m1812 (cd >= .2018-12-01. and cd <= .2018-12-31.)

#define m1901 (cd >= .2019-01-01. and cd <= .2019-01-31.)
#define m1902 (cd >= .2019-02-01. and cd <= .2019-02-28.)
#define m1903 (cd >= .2019-03-01. and cd <= .2019-03-31.)
#define m1904 (cd >= .2019-04-01. and cd <= .2019-04-30.)
#define m1905 (cd >= .2019-05-01. and cd <= .2019-05-31.)
#define m1906 (cd >= .2019-06-01. and cd <= .2019-06-30.)
#define m1907 (cd >= .2019-07-01. and cd <= .2019-07-31.)
#define m1908 (cd >= .2019-08-01. and cd <= .2019-08-31.)
#define m1909 (cd >= .2019-09-01. and cd <= .2019-09-30.)
#define m1910 (cd >= .2019-10-01. and cd <= .2019-10-31.)
#define m1911 (cd >= .2019-11-01. and cd <= .2019-11-30.)
#define m1912 (cd >= .2019-12-01. and cd <= .2019-12-31.)

#define m1101a (cd >= .2011-01-01. and cd <= .2011-01-14.)
#define m1102a (cd >= .2011-02-01. and cd <= .2011-02-14.)
#define m1103a (cd >= .2011-03-01. and cd <= .2011-03-14.)
#define m1104a (cd >= .2011-04-01. and cd <= .2011-04-14.)
#define m1105a (cd >= .2011-05-01. and cd <= .2011-05-14.)
#define m1106a (cd >= .2011-06-01. and cd <= .2011-06-14.)
#define m1107a (cd >= .2011-07-01. and cd <= .2011-07-14.)
#define m1108a (cd >= .2011-08-01. and cd <= .2011-08-14.)
#define m1109a (cd >= .2011-09-01. and cd <= .2011-09-14.)
#define m1110a (cd >= .2011-10-01. and cd <= .2011-10-14.)
#define m1111a (cd >= .2011-11-01. and cd <= .2011-11-14.)
#define m1112a (cd >= .2011-12-01. and cd <= .2011-12-14.)

#define m1201a (cd >= .2012-01-01. and cd <= .2012-01-14.)
#define m1202a (cd >= .2012-02-01. and cd <= .2012-02-14.)
#define m1203a (cd >= .2012-03-01. and cd <= .2012-03-14.)
#define m1204a (cd >= .2012-04-01. and cd <= .2012-04-14.)
#define m1205a (cd >= .2012-05-01. and cd <= .2012-05-14.)
#define m1206a (cd >= .2012-06-01. and cd <= .2012-06-14.)
#define m1207a (cd >= .2012-07-01. and cd <= .2012-07-14.)
#define m1208a (cd >= .2012-08-01. and cd <= .2012-08-14.)
#define m1209a (cd >= .2012-09-01. and cd <= .2012-09-14.)
#define m1210a (cd >= .2012-10-01. and cd <= .2012-10-14.)
#define m1211a (cd >= .2012-11-01. and cd <= .2012-11-14.)
#define m1212a (cd >= .2012-12-01. and cd <= .2012-12-14.)

#define m1301a (cd >= .2013-01-01. and cd <= .2013-01-14.)
#define m1302a (cd >= .2013-02-01. and cd <= .2013-02-14.)
#define m1303a (cd >= .2013-03-01. and cd <= .2013-03-14.)
#define m1304a (cd >= .2013-04-01. and cd <= .2013-04-14.)
#define m1305a (cd >= .2013-05-01. and cd <= .2013-05-14.)
#define m1306a (cd >= .2013-06-01. and cd <= .2013-06-14.)
#define m1307a (cd >= .2013-07-01. and cd <= .2013-07-14.)
#define m1308a (cd >= .2013-08-01. and cd <= .2013-08-14.)
#define m1309a (cd >= .2013-09-01. and cd <= .2013-09-14.)
#define m1310a (cd >= .2013-10-01. and cd <= .2013-10-14.)
#define m1311a (cd >= .2013-11-01. and cd <= .2013-11-14.)
#define m1312a (cd >= .2013-12-01. and cd <= .2013-12-14.)

#define m1401a (cd >= .2014-01-01. and cd <= .2014-01-14.)
#define m1402a (cd >= .2014-02-01. and cd <= .2014-02-14.)
#define m1403a (cd >= .2014-03-01. and cd <= .2014-03-14.)
#define m1404a (cd >= .2014-04-01. and cd <= .2014-04-14.)
#define m1405a (cd >= .2014-05-01. and cd <= .2014-05-14.)
#define m1406a (cd >= .2014-06-01. and cd <= .2014-06-14.)
#define m1407a (cd >= .2014-07-01. and cd <= .2014-07-14.)
#define m1408a (cd >= .2014-08-01. and cd <= .2014-08-14.)
#define m1409a (cd >= .2014-09-01. and cd <= .2014-09-14.)
#define m1410a (cd >= .2014-10-01. and cd <= .2014-10-14.)
#define m1411a (cd >= .2014-11-01. and cd <= .2014-11-14.)
#define m1412a (cd >= .2014-12-01. and cd <= .2014-12-14.)

#define m1501a (cd >= .2015-01-01. and cd <= .2015-01-14.)
#define m1502a (cd >= .2015-02-01. and cd <= .2015-02-14.)
#define m1503a (cd >= .2015-03-01. and cd <= .2015-03-14.)
#define m1504a (cd >= .2015-04-01. and cd <= .2015-04-14.)
#define m1505a (cd >= .2015-05-01. and cd <= .2015-05-14.)
#define m1506a (cd >= .2015-06-01. and cd <= .2015-06-14.)
#define m1507a (cd >= .2015-07-01. and cd <= .2015-07-14.)
#define m1508a (cd >= .2015-08-01. and cd <= .2015-08-14.)
#define m1509a (cd >= .2015-09-01. and cd <= .2015-09-14.)
#define m1510a (cd >= .2015-10-01. and cd <= .2015-10-14.)
#define m1511a (cd >= .2015-11-01. and cd <= .2015-11-14.)
#define m1512a (cd >= .2015-12-01. and cd <= .2015-12-14.)

#define m1601a (cd >= .2016-01-01. and cd <= .2016-01-14.)
#define m1602a (cd >= .2016-02-01. and cd <= .2016-02-14.)
#define m1603a (cd >= .2016-03-01. and cd <= .2016-03-14.)
#define m1604a (cd >= .2016-04-01. and cd <= .2016-04-14.)
#define m1605a (cd >= .2016-05-01. and cd <= .2016-05-14.)
#define m1606a (cd >= .2016-06-01. and cd <= .2016-06-14.)
#define m1607a (cd >= .2016-07-01. and cd <= .2016-07-14.)
#define m1608a (cd >= .2016-08-01. and cd <= .2016-08-14.)
#define m1609a (cd >= .2016-09-01. and cd <= .2016-09-14.)
#define m1610a (cd >= .2016-10-01. and cd <= .2016-10-14.)
#define m1611a (cd >= .2016-11-01. and cd <= .2016-11-14.)
#define m1612a (cd >= .2016-12-01. and cd <= .2016-12-14.)

#define m1701a (cd >= .2017-01-01. and cd <= .2017-01-14.)
#define m1702a (cd >= .2017-02-01. and cd <= .2017-02-14.)
#define m1703a (cd >= .2017-03-01. and cd <= .2017-03-14.)
#define m1704a (cd >= .2017-04-01. and cd <= .2017-04-14.)
#define m1705a (cd >= .2017-05-01. and cd <= .2017-05-14.)
#define m1706a (cd >= .2017-06-01. and cd <= .2017-06-14.)
#define m1707a (cd >= .2017-07-01. and cd <= .2017-07-14.)
#define m1708a (cd >= .2017-08-01. and cd <= .2017-08-14.)
#define m1709a (cd >= .2017-09-01. and cd <= .2017-09-14.)
#define m1710a (cd >= .2017-10-01. and cd <= .2017-10-14.)
#define m1711a (cd >= .2017-11-01. and cd <= .2017-11-14.)
#define m1712a (cd >= .2017-12-01. and cd <= .2017-12-14.)

#define m1801a (cd >= .2018-01-01. and cd <= .2018-01-14.)
#define m1802a (cd >= .2018-02-01. and cd <= .2018-02-14.)
#define m1803a (cd >= .2018-03-01. and cd <= .2018-03-14.)
#define m1804a (cd >= .2018-04-01. and cd <= .2018-04-14.)
#define m1805a (cd >= .2018-05-01. and cd <= .2018-05-14.)
#define m1806a (cd >= .2018-06-01. and cd <= .2018-06-14.)
#define m1807a (cd >= .2018-07-01. and cd <= .2018-07-14.)
#define m1808a (cd >= .2018-08-01. and cd <= .2018-08-14.)
#define m1809a (cd >= .2018-09-01. and cd <= .2018-09-14.)
#define m1810a (cd >= .2018-10-01. and cd <= .2018-10-14.)
#define m1811a (cd >= .2018-11-01. and cd <= .2018-11-14.)
#define m1812a (cd >= .2018-12-01. and cd <= .2018-12-14.)

#define m1901a (cd >= .2019-01-01. and cd <= .2019-01-14.)
#define m1902a (cd >= .2019-02-01. and cd <= .2019-02-14.)
#define m1903a (cd >= .2019-03-01. and cd <= .2019-03-14.)
#define m1904a (cd >= .2019-04-01. and cd <= .2019-04-14.)
#define m1905a (cd >= .2019-05-01. and cd <= .2019-05-14.)
#define m1906a (cd >= .2019-06-01. and cd <= .2019-06-14.)
#define m1907a (cd >= .2019-07-01. and cd <= .2019-07-14.)
#define m1908a (cd >= .2019-08-01. and cd <= .2019-08-14.)
#define m1909a (cd >= .2019-09-01. and cd <= .2019-09-14.)
#define m1910a (cd >= .2019-10-01. and cd <= .2019-10-14.)
#define m1911a (cd >= .2019-11-01. and cd <= .2019-11-14.)
#define m1912a (cd >= .2019-12-01. and cd <= .2019-12-14.)

#define m1101b (cd >= .2011-01-15. and cd <= .2011-01-31.)
#define m1102b (cd >= .2011-02-15. and cd <= .2011-02-28.)
#define m1103b (cd >= .2011-03-15. and cd <= .2011-03-31.)
#define m1104b (cd >= .2011-04-15. and cd <= .2011-04-30.)
#define m1105b (cd >= .2011-05-15. and cd <= .2011-05-31.)
#define m1106b (cd >= .2011-06-15. and cd <= .2011-06-30.)
#define m1107b (cd >= .2011-07-15. and cd <= .2011-07-31.)
#define m1108b (cd >= .2011-08-15. and cd <= .2011-08-31.)
#define m1109b (cd >= .2011-09-15. and cd <= .2011-09-30.)
#define m1110b (cd >= .2011-10-15. and cd <= .2011-10-31.)
#define m1111b (cd >= .2011-11-15. and cd <= .2011-11-30.)
#define m1112b (cd >= .2011-12-15. and cd <= .2011-12-31.)

#define m1201b (cd >= .2012-01-15. and cd <= .2012-01-31.)
#define m1202b (cd >= .2012-02-15. and cd <= .2012-02-29.)
#define m1203b (cd >= .2012-03-15. and cd <= .2012-03-31.)
#define m1204b (cd >= .2012-04-15. and cd <= .2012-04-30.)
#define m1205b (cd >= .2012-05-15. and cd <= .2012-05-31.)
#define m1206b (cd >= .2012-06-15. and cd <= .2012-06-30.)
#define m1207b (cd >= .2012-07-15. and cd <= .2012-07-31.)
#define m1208b (cd >= .2012-08-15. and cd <= .2012-08-31.)
#define m1209b (cd >= .2012-09-15. and cd <= .2012-09-30.)
#define m1210b (cd >= .2012-10-15. and cd <= .2012-10-31.)
#define m1211b (cd >= .2012-11-15. and cd <= .2012-11-30.)
#define m1212b (cd >= .2012-12-15. and cd <= .2012-12-31.)

#define m1301b (cd >= .2013-01-15. and cd <= .2013-01-31.)
#define m1302b (cd >= .2013-02-15. and cd <= .2013-02-28.)
#define m1303b (cd >= .2013-03-15. and cd <= .2013-03-31.)
#define m1304b (cd >= .2013-04-15. and cd <= .2013-04-30.)
#define m1305b (cd >= .2013-05-15. and cd <= .2013-05-31.)
#define m1306b (cd >= .2013-06-15. and cd <= .2013-06-30.)
#define m1307b (cd >= .2013-07-15. and cd <= .2013-07-31.)
#define m1308b (cd >= .2013-08-15. and cd <= .2013-08-31.)
#define m1309b (cd >= .2013-09-15. and cd <= .2013-09-30.)
#define m1310b (cd >= .2013-10-15. and cd <= .2013-10-31.)
#define m1311b (cd >= .2013-11-15. and cd <= .2013-11-30.)
#define m1312b (cd >= .2013-12-15. and cd <= .2013-12-31.)

#define m1401b (cd >= .2014-01-15. and cd <= .2014-01-31.)
#define m1402b (cd >= .2014-02-15. and cd <= .2014-02-28.)
#define m1403b (cd >= .2014-03-15. and cd <= .2014-03-31.)
#define m1404b (cd >= .2014-04-15. and cd <= .2014-04-30.)
#define m1405b (cd >= .2014-05-15. and cd <= .2014-05-31.)
#define m1406b (cd >= .2014-06-15. and cd <= .2014-06-30.)
#define m1407b (cd >= .2014-07-15. and cd <= .2014-07-31.)
#define m1408b (cd >= .2014-08-15. and cd <= .2014-08-31.)
#define m1409b (cd >= .2014-09-15. and cd <= .2014-09-30.)
#define m1410b (cd >= .2014-10-15. and cd <= .2014-10-31.)
#define m1411b (cd >= .2014-11-15. and cd <= .2014-11-30.)
#define m1412b (cd >= .2014-12-15. and cd <= .2014-12-31.)

#define m1501b (cd >= .2015-01-15. and cd <= .2015-01-31.)
#define m1502b (cd >= .2015-02-15. and cd <= .2015-02-28.)
#define m1503b (cd >= .2015-03-15. and cd <= .2015-03-31.)
#define m1504b (cd >= .2015-04-15. and cd <= .2015-04-30.)
#define m1505b (cd >= .2015-05-15. and cd <= .2015-05-31.)
#define m1506b (cd >= .2015-06-15. and cd <= .2015-06-30.)
#define m1507b (cd >= .2015-07-15. and cd <= .2015-07-31.)
#define m1508b (cd >= .2015-08-15. and cd <= .2015-08-31.)
#define m1509b (cd >= .2015-09-15. and cd <= .2015-09-30.)
#define m1510b (cd >= .2015-10-15. and cd <= .2015-10-31.)
#define m1511b (cd >= .2015-11-15. and cd <= .2015-11-30.)
#define m1512b (cd >= .2015-12-15. and cd <= .2015-12-31.)

#define m1601b (cd >= .2016-01-15. and cd <= .2016-01-31.)
#define m1602b (cd >= .2016-02-15. and cd <= .2016-02-29.)
#define m1603b (cd >= .2016-03-15. and cd <= .2016-03-31.)
#define m1604b (cd >= .2016-04-15. and cd <= .2016-04-30.)
#define m1605b (cd >= .2016-05-15. and cd <= .2016-05-31.)
#define m1606b (cd >= .2016-06-15. and cd <= .2016-06-30.)
#define m1607b (cd >= .2016-07-15. and cd <= .2016-07-31.)
#define m1608b (cd >= .2016-08-15. and cd <= .2016-08-31.)
#define m1609b (cd >= .2016-09-15. and cd <= .2016-09-30.)
#define m1610b (cd >= .2016-10-15. and cd <= .2016-10-31.)
#define m1611b (cd >= .2016-11-15. and cd <= .2016-11-30.)
#define m1612b (cd >= .2016-12-15. and cd <= .2016-12-31.)

#define m1701b (cd >= .2017-01-15. and cd <= .2017-01-31.)
#define m1702b (cd >= .2017-02-15. and cd <= .2017-02-28.)
#define m1703b (cd >= .2017-03-15. and cd <= .2017-03-31.)
#define m1704b (cd >= .2017-04-15. and cd <= .2017-04-30.)
#define m1705b (cd >= .2017-05-15. and cd <= .2017-05-31.)
#define m1706b (cd >= .2017-06-15. and cd <= .2017-06-30.)
#define m1707b (cd >= .2017-07-15. and cd <= .2017-07-31.)
#define m1708b (cd >= .2017-08-15. and cd <= .2017-08-31.)
#define m1709b (cd >= .2017-09-15. and cd <= .2017-09-30.)
#define m1710b (cd >= .2017-10-15. and cd <= .2017-10-31.)
#define m1711b (cd >= .2017-11-15. and cd <= .2017-11-30.)
#define m1712b (cd >= .2017-12-15. and cd <= .2017-12-31.)

#define m1801b (cd >= .2018-01-15. and cd <= .2018-01-31.)
#define m1802b (cd >= .2018-02-15. and cd <= .2018-02-28.)
#define m1803b (cd >= .2018-03-15. and cd <= .2018-03-31.)
#define m1804b (cd >= .2018-04-15. and cd <= .2018-04-30.)
#define m1805b (cd >= .2018-05-15. and cd <= .2018-05-31.)
#define m1806b (cd >= .2018-06-15. and cd <= .2018-06-30.)
#define m1807b (cd >= .2018-07-15. and cd <= .2018-07-31.)
#define m1808b (cd >= .2018-08-15. and cd <= .2018-08-31.)
#define m1809b (cd >= .2018-09-15. and cd <= .2018-09-30.)
#define m1810b (cd >= .2018-10-15. and cd <= .2018-10-31.)
#define m1811b (cd >= .2018-11-15. and cd <= .2018-11-30.)
#define m1812b (cd >= .2018-12-15. and cd <= .2018-12-31.)

#define m1901b (cd >= .2019-01-15. and cd <= .2019-01-31.)
#define m1902b (cd >= .2019-02-15. and cd <= .2019-02-28.)
#define m1903b (cd >= .2019-03-15. and cd <= .2019-03-31.)
#define m1904b (cd >= .2019-04-15. and cd <= .2019-04-30.)
#define m1905b (cd >= .2019-05-15. and cd <= .2019-05-31.)
#define m1906b (cd >= .2019-06-15. and cd <= .2019-06-30.)
#define m1907b (cd >= .2019-07-15. and cd <= .2019-07-31.)
#define m1908b (cd >= .2019-08-15. and cd <= .2019-08-31.)
#define m1909b (cd >= .2019-09-15. and cd <= .2019-09-30.)
#define m1910b (cd >= .2019-10-15. and cd <= .2019-10-31.)
#define m1911b (cd >= .2019-11-15. and cd <= .2019-11-30.)
#define m1912b (cd >= .2019-12-15. and cd <= .2019-12-31.)

#define is111 (m1101b or m1102a or m1102b)
#define os111 (m1103a or m1103b or m1104a)
#define is112 (m1104b or m1105a)
#define os112 (m1105b or m1106a or m1106b or m1107a)
#define is113 (m1107b or m1108a)
#define os113 (m1108b or m1109a or m1109b or m1110a)
#define is114 (m1110b or m1111a)
#define os114 (m1111b or m1112a or m1112b or m1201a)

#define is121 (m1201b or m1202a or m1202b)
#define os121 (m1203a or m1203b or m1204a)
#define is122 (m1204b or m1205a)
#define os122 (m1205b or m1206a or m1206b or m1207a)
#define is123 (m1207b or m1208a)
#define os123 (m1208b or m1209a or m1209b or m1210a)
#define is124 (m1210b or m1211a)
#define os124 (m1211b or m1212a or m1212b or m1301a)

#define is131 (m1301b or m1302a or m1302b)
#define os131 (m1303a or m1303b or m1304a)
#define is132 (m1304b or m1305a)
#define os132 (m1305b or m1306a or m1306b or m1307a)
#define is133 (m1307b or m1308a)
#define os133 (m1308b or m1309a or m1309b or m1310a)
#define is134 (m1310b or m1311a)
#define os134 (m1311b or m1312a or m1312b or m1401a)

#define is141 (m1401b or m1402a or m1402b)
#define os141 (m1403a or m1403b or m1404a)
#define is142 (m1404b or m1405a)
#define os142 (m1405b or m1406a or m1406b or m1407a)
#define is143 (m1407b or m1408a)
#define os143 (m1408b or m1409a or m1409b or m1410a)
#define is144 (m1410b or m1411a)
#define os144 (m1411b or m1412a or m1412b or m1501a)

#define is151 (m1501b or m1502a or m1502b)
#define os151 (m1503a or m1503b or m1504a)
#define is152 (m1504b or m1505a)
#define os152 (m1505b or m1506a or m1506b or m1507a)
#define is153 (m1507b or m1508a)
#define os153 (m1508b or m1509a or m1509b or m1510a)
#define is154 (m1510b or m1511a)
#define os154 (m1511b or m1512a or m1512b or m1601a)

#define is161 (m1601b or m1602a or m1602b)
#define os161 (m1603a or m1603b or m1604a)
#define is162 (m1604b or m1605a)
#define os162 (m1605b or m1606a or m1606b or m1607a)
#define is163 (m1607b or m1608a)
#define os163 (m1608b or m1609a or m1609b or m1610a)
#define is164 (m1610b or m1611a)
#define os164 (m1611b or m1612a or m1612b or m1701a)

#define is171 (m1701b or m1702a or m1702b)
#define os171 (m1703a or m1703b or m1704a)
#define is172 (m1704b or m1705a)
#define os172 (m1705b or m1706a or m1706b or m1707a)
#define is173 (m1707b or m1708a)
#define os173 (m1708b or m1709a or m1709b or m1710a)
#define is174 (m1710b or m1711a)
#define os174 (m1711b or m1712a or m1712b or m1801a)

#define is181 (m1801b or m1802a or m1802b)
#define os181 (m1803a or m1803b or m1804a)
#define is182 (m1804b or m1805a)
#define os182 (m1805b or m1806a or m1806b or m1807a)
#define is183 (m1807b or m1808a)
#define os183 (m1808b or m1809a or m1809b or m1810a)
#define is184 (m1810b or m1811a)
#define os184 (m1811b or m1812a or m1812b or m1901a)

#define is191 (m1901b or m1902a or m1902b)
#define os191 (m1903a or m1903b or m1904a)
#define is192 (m1904b or m1905a)
#define os192 (m1905b or m1906a or m1906b or m1907a)
#define is193 (m1907b or m1908a)
#define os193 (m1908b or m1909a or m1909b or m1910a)
#define is194 (m1910b or m1911a)
#define os194 (m1911b or m1912a or m1912b or m2001a)

#define is2011 is111 or is112 or is113 or is114
#define os2011 os111 or os112 or os113 or os114
#define is2012 is121 or is122 or is123 or is124
#define os2012 os121 or os122 or os123 or os124
#define is2013 is131 or is132 or is133 or is134
#define os2013 os131 or os132 or os133 or os134
#define is2014 is141 or is142 or is143 or is144
#define os2014 os141 or os142 or os143 or os144
#define is2015 is151 or is152 or is153 or is154
#define os2015 os151 or os152 or os153 or os154
#define is2016 is161 or is162 or is163 or is164
#define os2016 os161 or os162 or os163 or os164
#define is2017 is171 or is172 or is173 or is174
#define os2017 os171 or os172 or os173 or os174
#define is2018 is181 or is182 or is183 or is184
#define os2018 os181 or os182 or os183 or os184
#define is2019 is191 or is192 or is193 or is194
#define os2019 os191 or os192 or os193 or os194
