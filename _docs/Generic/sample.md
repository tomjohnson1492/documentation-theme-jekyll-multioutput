---
title: Sample 1
permalink: sample.html
sidebar: generic
tags: [navigation, content-types]
product: Generic
toc-style: kramdown
---
this is a test..   .

The wilderness follows a {% include tooltips.html term="riparian" %} landscape.

{% assign glossaryTerms = site.data.tooltips %}

<dl>
    {% for entry in glossaryTerms %}
    <dt id="{{entry.term}}">{{entry.term}}</dt>
    <dd>{{entry.def}}</dd>
    {% endfor %}
</dl>



{% include links.html %}
