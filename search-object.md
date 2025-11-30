---
title: 'Liquid objects: collection'
description: >-
  A [collection](https://help.shopify.com/manual/products/collections) in a
  store.
api_name: liquid
source_url:
  html: 'https://shopify.dev/docs/api/liquid/objects/collection'
  md: 'https://shopify.dev/docs/api/liquid/objects/collection.md'
---

# collection

A [collection](https://help.shopify.com/manual/products/collections) in a store.

## Properties

* * all\_​products\_​count

    [number](https://shopify.dev/docs/api/liquid/basics#number)

  * The total number of products in a collection.

    This includes products that have been filtered out of the current view.

    Tip

    To display the number of products in a filtered collection, use [`collection.products_count`](https://shopify.dev/docs/api/liquid/objects/collection#collection-products_count).

  * all\_​tags

    array of [string](https://shopify.dev/docs/api/liquid/basics#string)

  * All of the tags applied to the products in the collection.

    This includes tags for products that have been filtered out of the current view. A maximum of 1,000 tags can be returned.

    Tip

    To display the tags that are currently applied, use [`collection.tags`](https://shopify.dev/docs/api/liquid/objects/collection#collection-tags).

  * all\_​types

    array of [string](https://shopify.dev/docs/api/liquid/basics#string)

  * All of the product types in a collection.

    ExampleCreate links to product types

    Use the [`link_to_type`](https://shopify.dev/docs/api/liquid/filters/link_to_type) filter to create links to the product types in a collection.

    ##### Code

    ```liquid
    {% for product_type in collection.all_types -%}
      {{- product_type | link_to_type }}
    {%- endfor %}
    ```

    ##### Data

    ```json
    {
      "collection": {
        "all_types": [
          "Animals & Pet Supplies",
          "Baking Flavors & Extracts",
          "Cooking & Baking Ingredients",
          "Dried Flowers",
          "Fruits & Vegetables",
          "Seasonings & Spices",
          "Water"
        ]
      }
    }
    ```

    ##### Output

    ```html
    <a href="/collections/types?q=Animals%20%26%20Pet%20Supplies" title="Animals &amp; Pet Supplies">Animals & Pet Supplies</a>
    <a href="/collections/types?q=Baking%20Flavors%20%26%20Extracts" title="Baking Flavors &amp; Extracts">Baking Flavors & Extracts</a>
    <a href="/collections/types?q=Cooking%20%26%20Baking%20Ingredients" title="Cooking &amp; Baking Ingredients">Cooking & Baking Ingredients</a>
    <a href="/collections/types?q=Dried%20Flowers" title="Dried Flowers">Dried Flowers</a>
    <a href="/collections/types?q=Fruits%20%26%20Vegetables" title="Fruits &amp; Vegetables">Fruits & Vegetables</a>
    <a href="/collections/types?q=Seasonings%20%26%20Spices" title="Seasonings &amp; Spices">Seasonings & Spices</a>
    <a href="/collections/types?q=Water" title="Water">Water</a>
    ```

  * all\_​vendors

    array of [string](https://shopify.dev/docs/api/liquid/basics#string)

  * All of the product vendors in a collection.

    ExampleCreate links to vendors

    Use the [`link_to_vendor`](https://shopify.dev/docs/api/liquid/filters/link_to_vendor) filter to create links to the vendors in a collection.

    ##### Code

    ```liquid
    {% for product_vendor in collection.all_vendors %}
      {{- product_vendor | link_to_vendor }}
    {% endfor %}
    ```

    ##### Data

    ```json
    {
      "collection": {
        "all_vendors": [
          "Clover's Apothecary",
          "Polina's Potent Potions",
          "Ted's Apothecary Supply"
        ]
      }
    }
    ```

    ##### Output

    ```html
    <a href="/collections/vendors?q=Clover%27s%20Apothecary" title="Clover&#39;s Apothecary">Clover's Apothecary</a>

    <a href="/collections/vendors?q=Polina%27s%20Potent%20Potions" title="Polina&#39;s Potent Potions">Polina's Potent Potions</a>

    <a href="/collections/vendors?q=Ted%27s%20Apothecary%20Supply" title="Ted&#39;s Apothecary Supply">Ted's Apothecary Supply</a>
    ```

  * current\_​type

    [string](https://shopify.dev/docs/api/liquid/basics#string)

  * The product type on a product type collection page.

    You can query for products of a certain type at the `/collections/types` URL with a query parameter in the format of `?q=[type]`, where `[type]` is your desired product type.

    Tip

    The query value is case-insensitive, so `shirts` is equivalent to `Shirts` or `SHIRTS`.

  * current\_​vendor

    [string](https://shopify.dev/docs/api/liquid/basics#string)

  * The vendor name on a vendor collection page.

    You can query for products from a certain vendor at the `/collections/vendors` URL with a query parameter in the format of `?q=[vendor]`, where `[vendor]` is your desired product vendor.

    Tip

    The query value is case-insensitive, so `apparelco` is equivalent to `ApparelCo` or `APPARELCO`.

  * default\_​sort\_​by

    [string](https://shopify.dev/docs/api/liquid/basics#string) from a set of values

  * The default sort order of the collection.

    This is set on the collection's page in the Shopify admin.

    | Possible values |
    | - |
    | manual |
    | best-selling |
    | title-ascending |
    | price-ascending |
    | price-descending |
    | created-ascending |
    | created-descending |

  * description

    [string](https://shopify.dev/docs/api/liquid/basics#string)

  * The description of the collection.

  * featured\_​image

    [image](https://shopify.dev/docs/api/liquid/objects/image)

  * The featured image for the collection.

    The default is the [collection image](https://shopify.dev/docs/api/liquid/objects/collection#collection-image). If this image isn't available, then Shopify falls back to the featured image of the first product in the collection. If the first product in the collection doesn't have a featured image, then `nil` is returned.

  * filters

    array of [filter](https://shopify.dev/docs/api/liquid/objects/filter)

  * The [storefront filters](https://help.shopify.com/manual/online-store/themes/customizing-themes/storefront-filters) that have been set up on the collection.

    Only filters relevant to the current collection are returned. Filters will be empty for collections that contain over 5000 products.

    To learn about supporting filters in your theme, refer to [Support storefront filtering](https://shopify.dev/themes/navigation-search/filtering/storefront-filtering/support-storefront-filtering).

  * handle

    [string](https://shopify.dev/docs/api/liquid/basics#string)

  * The [handle](https://shopify.dev/docs/api/liquid/basics#handles) of the collection.

  * id

    [number](https://shopify.dev/docs/api/liquid/basics#number)

  * The ID of the collection.

  * image

    [image](https://shopify.dev/docs/api/liquid/objects/image)

  * The image for the collection.

    This image is added on the collection's page in the Shopify admin.

  * metafields

    array of [metafield](https://shopify.dev/docs/api/liquid/objects/metafield)

  * The [metafields](https://shopify.dev/docs/api/liquid/objects/metafield) applied to the collection.

    Tip

    To learn about how to create metafields, refer to [Create and manage metafields](https://shopify.dev/apps/metafields/manage) or visit the [Shopify Help Center](https://help.shopify.com/manual/metafields).

  * next\_​product

    [product](https://shopify.dev/docs/api/liquid/objects/product)

  * The next product in the collection. Returns `nil` if there's no next product.

    This property can be used on the [product page](https://shopify.dev/themes/architecture/templates/product) to output `next` links.

  * previous\_​product

    [product](https://shopify.dev/docs/api/liquid/objects/product)

  * The previous product in the collection. Returns `nil` if there's no previous product.

    This property can be used on the [product page](https://shopify.dev/themes/architecture/templates/product) to output `previous` links.

  * products

    array of [product](https://shopify.dev/docs/api/liquid/objects/product)

  * All of the products in the collection.

    Tip

    Use the [paginate](https://shopify.dev/docs/api/liquid/tags/paginate) tag to choose how many products to show per page, up to a limit of 50.

  * products\_​count

    [number](https://shopify.dev/docs/api/liquid/basics#number)

  * The total number of products in the current view of the collection.

  * published\_​at

    [string](https://shopify.dev/docs/api/liquid/basics#string)

  * A timestamp for when the collection was published.

    Tip

    Use the [`date` filter](https://shopify.dev/docs/api/liquid/filters/date) to format the timestamp.

  * sort\_​by

    [string](https://shopify.dev/docs/api/liquid/basics#string)

  * The sort order applied to the collection by the `sort_by` URL parameter.

    If there's no `sort_by` URL parameter, then the value is `nil`.

  * sort\_​options

    array of [sort\_option](https://shopify.dev/docs/api/liquid/objects/sort_option)

  * The available sorting options for the collection.

    ExampleOutput the sort options

    ##### Code

    ```liquid
    {%- assign sort_by = collection.sort_by | default: collection.default_sort_by -%}

    <select>
    {%- for option in collection.sort_options %}
      <option
        value="{{ option.value }}"
        {%- if option.value == sort_by %}
          selected="selected"
        {%- endif %}
      >
        {{ option.name }}
      </option>
    {% endfor -%}
    </select>
    ```

    ##### Data

    ```json
    {
      "collection": {
        "default_sort_by": "title-ascending",
        "sort_by": "",
        "sort_options": [
          "CollectionDrop::SortOptionDrop",
          "CollectionDrop::SortOptionDrop",
          "CollectionDrop::SortOptionDrop",
          "CollectionDrop::SortOptionDrop",
          "CollectionDrop::SortOptionDrop",
          "CollectionDrop::SortOptionDrop",
          "CollectionDrop::SortOptionDrop",
          "CollectionDrop::SortOptionDrop"
        ]
      }
    }
    ```

    ##### Output

    ```html
    <select>
      <option
        value="manual"
      >
        Featured
      </option>

      <option
        value="best-selling"
      >
        Best selling
      </option>

      <option
        value="title-ascending"
          selected="selected"
      >
        Alphabetically, A-Z
      </option>

      <option
        value="title-descending"
      >
        Alphabetically, Z-A
      </option>

      <option
        value="price-ascending"
      >
        Price, low to high
      </option>

      <option
        value="price-descending"
      >
        Price, high to low
      </option>

      <option
        value="created-ascending"
      >
        Date, old to new
      </option>

      <option
        value="created-descending"
      >
        Date, new to old
      </option>
    </select>
    ```

  * tags

    array of [string](https://shopify.dev/docs/api/liquid/basics#string)

  * The tags that are currently applied to the collection.

    This doesn't include tags for products that have been filtered out of the current view. Returns `nil` if no tags have been applied, or all products with tags have been filtered out of the current view.

  * template\_​suffix

    [string](https://shopify.dev/docs/api/liquid/basics#string)

  * The name of the [custom template](https://shopify.dev/themes/architecture/templates#alternate-templates) assigned to the collection.

    The name doesn't include the `collection.` prefix, or the file extension (`.json` or `.liquid`).

    If a custom template isn't assigned to the collection, then `nil` is returned.

  * title

    [string](https://shopify.dev/docs/api/liquid/basics#string)

  * The title of the collection.

  * url

    [string](https://shopify.dev/docs/api/liquid/basics#string)

  * The relative URL of the collection.

##### Example

```json
{
  "all_products_count": 10,
  "all_tags": [
    "Burning",
    "dried",
    "extracts",
    "fresh",
    "ingredients",
    "plant",
    "supplies"
  ],
  "all_types": [
    "Animals & Pet Supplies",
    "Baking Flavors & Extracts",
    "Cooking & Baking Ingredients",
    "Dried Flowers",
    "Fruits & Vegetables",
    "Seasonings & Spices",
    "Water"
  ],
  "all_vendors": [
    "Clover's Apothecary",
    "Polina's Potent Potions",
    "Ted's Apothecary Supply"
  ],
  "current_type": null,
  "current_vendor": null,
  "default_sort_by": "created-ascending",
  "description": "Brew your own potions at home using our fresh, ethically-sourced ingredients.",
  "featured_image": {},
  "filters": {},
  "handle": "ingredients",
  "id": 266168401985,
  "image": {},
  "metafields": {},
  "next_product": null,
  "previous_product": null,
  "products": {},
  "products_count": 1,
  "published_at": "2022-04-19 09:52:18 -0400",
  "sort_by": "",
  "sort_options": [],
  "tags": [
    "Burning"
  ],
  "template_suffix": "eight-products-per-page",
  "title": "Ingredients",
  "url": {}
}
```

## Templates using collection

[Theme architecture](https://shopify.dev/themes/architecture/templates/collection)

[collection template](https://shopify.dev/themes/architecture/templates/collection)