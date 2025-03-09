---
title: Contact
nav:
  order: 5
  tooltip: Email, address, and location
---

# {% include icon.html icon="fa-regular fa-envelope" %}Contact

Please email John if you are interested in a collaboration or if you would like to join the team at Roskilde University, Denmark!

{%
  include button.html
  type="email"
  text="johnsh@ruc.dk"
  link="johnsh@ruc.dk"
%}
{%
  include button.html
  type="address"
  tooltip="Our location on Google Maps for easy navigation"
  link="https://maps.app.goo.gl/NcSb5j6JLUGYFFnj7"
%}

{% include section.html %}

{% capture col1 %}

{%
  include figure.html
  image="images/101-scaled-1024x683-2449328099.jpg"
  caption="Roskilde Univerity student celebration at the lake"
%}

{% endcapture %}

{% capture col2 %}

{%
  include figure.html
  image="images/Campuskort_m-kommende-ladestandere_2025-02-28_0.jpg"
  caption="Campus map"
%}

{% endcapture %}

{% include cols.html col1=col1 col2=col2 %}

{% include section.html dark=true %}

{% capture col1 %}

{% endcapture %}

{% capture col2 %}

{% endcapture %}

{% capture col3 %}

{% endcapture %}

{% include cols.html col1=col1 col2=col2 col3=col3 %}
