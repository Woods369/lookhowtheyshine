---
title: Support storefront filtering
description: Learn how to support storefront filtering in themes.
source_url:
  html: >-
    https://shopify.dev/docs/storefronts/themes/navigation-search/filtering/storefront-filtering/support-storefront-filtering
  md: >-
    https://shopify.dev/docs/storefronts/themes/navigation-search/filtering/storefront-filtering/support-storefront-filtering.md
---

ExpandOn this page

* [Resources](https://shopify.dev/docs/storefronts/themes/navigation-search/filtering/storefront-filtering/support-storefront-filtering.md#resources)
* [Implementing storefront filtering](https://shopify.dev/docs/storefronts/themes/navigation-search/filtering/storefront-filtering/support-storefront-filtering.md#implementing-storefront-filtering)
* [The filter display](https://shopify.dev/docs/storefronts/themes/navigation-search/filtering/storefront-filtering/support-storefront-filtering.md#the-filter-display)

# Support storefront filtering

Storefront filtering allows merchants to [easily create filters](https://help.shopify.com/manual/online-store/themes/customizing-themes/storefront-filters#add-filters) for filtering collection and search results pages. Filters are based on existing product data, like availability, price, variant options, and more.

In this tutorial, you'll learn how to support storefront filtering in your theme.

***

## Resources

To implement storefront filtering, you'll use the following:

* The [`filter` object](https://shopify.dev/docs/api/liquid/objects/filter)

* One of the following, depending on the page you're working with:

  * The [`collection` object](https://shopify.dev/docs/api/liquid/objects/collection)
  * The [`search` object](https://shopify.dev/docs/api/liquid/objects/search)

***

## Implementing storefront filtering

To support storefront filtering, you need to implement a [filter display](#the-filter-display) for customers to interact with.

Applied filters are reflected through URL parameters, so you should also familiarize yourself with the structure of [filter URL parameters](https://shopify.dev/docs/storefronts/themes/navigation-search/filtering/storefront-filtering#filter-url-parameters).

Note

Before filters can be applied, they need to be created in the Shopify admin.

***

## The filter display

Note

Collections that contain over 5,000 products don't display filters.

The following sections outline a basic [collection](#collection-filter-display) and [search results](#search-results-filter-display) filter implementation. Each implementation uses a form to host the filter inputs with "submit" buttons to apply the associated filters. However, you can use JavaScript to automatically submit the form based on input changes. When the form is submitted, the page is refreshed with the filters applied.

For a more in-depth solution, refer to [Dawn's implementation](https://github.com/Shopify/dawn/blob/main/sections/main-collection-product-grid.liquid).

Tip

Refer to [Storefront filtering UX guidelines](https://shopify.dev/docs/storefronts/themes/navigation-search/filtering/storefront-filtering/storefront-filtering-ux) for more information on UX best practices when building a filter display.

### Collection filter display

The collection filter display should be included in the [`collection` template](https://shopify.dev/docs/storefronts/themes/architecture/templates/collection), or a section that's included as part of the `collection` template.

The following example implementation contains two main components:

* A list of filter groups and values.

* A list of active filters, if there are any.

  Each of these components are output through the `filters` attribute of the `collection` object, and the associated `filter` objects.

## Example collection filter display

```liquid
<form>
  {%- for filter in collection.filters -%}
    <details>
      <summary>
        <div>
          <span>{{ filter.label }}</span>


          {%- if filter.active_values.size > 0 -%}
            <span>({{ filter.active_values.size }})</span>
          {%- endif -%}
        </div>
      </summary>


      <div>
        <div>
          <p>{{ filter.active_values.size }} selected</p>
          {%- if filter.active_values.size > 0 -%}
            <p><a href="{{ filter.url_to_remove }}">Reset</a></p>
          {%- endif -%}
        </div>
        {%- case filter.type -%}
          {%- when 'boolean' -%}
            <ul>
                <li>
                  <label for="Filter-{{ filter.param_name }}-{{ filter.true_value.value }}">
                  <input type="checkbox"
                    name="{{ filter.param_name }}"
                    value="{{ filter.true_value.value }}"
                    id="Filter-{{ filter.param_name }}"
                    {% if filter.true_value.active -%}checked{%- endif %}
                    {% if filter.true_value.count == 0 and filter.true_value.active == false -%}disabled{%- endif -%}
                   />{{ filter.true_value.label }}</label>
                </li>
                <li>
                  <label for="Filter-{{ filter.param_name }}-{{ filter.false_value.value }}">
                  <input type="checkbox"
```

### Search results filter display

Note

Search results that exceed 1,000 products don't display filters.

The search results filter display should be included in the [`search` template](https://shopify.dev/docs/storefronts/themes/architecture/templates/search), or in a section that's included as part of the `search` template.

The following example implementation contains two main components:

* A list of filter groups and values.

* A list of active filters, if there are any.

  Each of these components are output through the `filters` attribute of the `search` object, and the associated `filter` objects.

  If you apply filters on the search results page, then all non-product results are filtered out.

## Example search results filter display

```liquid
<form>
  <input type="hidden" name="q" value="{{ search.terms }}" />


  {%- for filter in search.filters -%}
    <details>
      <summary>
        <div>
          <span>{{ filter.label }}</span>


          {%- if filter.active_values.size > 0 -%}
            <span>({{ filter.active_values.size }})</span>
          {%- endif -%}
        </div>
      </summary>


      <div>
        <div>
          <p>{{ filter.active_values.size }} selected</p>
          {%- if filter.active_values.size > 0 -%}
            <p><a href="{{ filter.url_to_remove }}">Reset</a></p>
          {%- endif -%}
        </div>
        {%- case filter.type -%}
          {%- when 'boolean' -%}
            <ul>
                <li>
                  <label for="Filter-{{ filter.param_name }}-{{ filter.true_value.value }}">
                  <input type="checkbox"
                    name="{{ filter.param_name }}"
                    value="{{ filter.true_value.value }}"
                    id="Filter-{{ filter.param_name }}"
                    {% if filter.true_value.active -%}checked{%- endif %}
                    {% if filter.true_value.count == 0 and filter.true_value.active == false -%}disabled{%- endif -%}
                   />{{ filter.true_value.label }}</label>
                </li>
                <li>
```

***

* [Resources](https://shopify.dev/docs/storefronts/themes/navigation-search/filtering/storefront-filtering/support-storefront-filtering.md#resources)
* [Implementing storefront filtering](https://shopify.dev/docs/storefronts/themes/navigation-search/filtering/storefront-filtering/support-storefront-filtering.md#implementing-storefront-filtering)
* [The filter display](https://shopify.dev/docs/storefronts/themes/navigation-search/filtering/storefront-filtering/support-storefront-filtering.md#the-filter-display)