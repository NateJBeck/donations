###Donation Processing

There are nearly two dozen charitable organizations that offer free residential
pickups of used goods in the Greater Boston area. This application is designed 
to make donating used goods like clothing, housewares, books and small furniture
as easy as possible.

My goal is to create a win-win situation; donors receive free pickups of their 
used goods (and can support their favorite charity) and charity administrators 
are able to track, schedule and map out confirmed donations with ease.

####Home Page

Users are brought to the landing page. No log-in is required, however you can
sign up to keep track of your past donations. Donations must be confirmed via
email and are limited to one per household (to help limit hoax donations).

Administrators log in and are brought to their dashboard, a GUI meant to provide 
information about routes, pickups and operations. They can create schedules and
have full access to maps for upcoming pickups, schedules and contact information
 in case they need help.

####APIs, Gems & More

This project integrates GoogleMaps Javascript V3 API to render dynamic markers 
based on confirmed pickups, as well as gems like monban (user verification) 
Select2 (cool form completion) dotENV (privatizing sensitive data) and SASS 
grid-design systems from thoughtbots bourbon & neat gems.

####Goals

My goals for this project include integrating automatic address verification 
from GoogleMaps or SmartyStreets API, a routing system capable of optimizing 
100+ pickups per route, and providing a framework for charities to work together
in partnership to reach more donors and receive more donations.
