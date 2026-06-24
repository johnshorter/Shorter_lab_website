---
title: Team
nav:
  order: 3
  tooltip: About our team
---

# {% include icon.html icon="fa-solid fa-users" %}Team

We are a small but growing team!

{% include section.html %}

{% include list.html data="members" component="portrait" filter="role == 'principal-investigator'" %}
{% include list.html data="members" component="portrait" filter="role != 'principal-investigator' && group != 'alum'" %}
{% include list.html data="members" component="portrait" filter="group == 'alum'" %}

{% include section.html background="images/background.jpg" dark=true %}


{% include section.html %}


