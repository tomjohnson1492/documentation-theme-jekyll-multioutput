---
title: Sidebar Navigation
permalink: jekyllhowto-sidebar-navigation.html
sidebar: jekyllhowto
product: Jekyll How-to Guide
---

Both themes generate the data for the sidebar navigation from the sidebar.yml in the \_data folder. YAML files don't use markup tags but rather spacing to create syntax. Look carefully at the YAML syntax in this file. The syntax for your YAML content must be correct in order for the files to be valid.

* TOC
{:toc}

## Sidebars for Both Themes

For the Jekyll theme, the \_includes/sidebar.html file uses "for" loops to iterate through the items in this YAML file and push the content into an HTML format. When Jekyll builds your site, the sidebar gets included into each page. This means each page has its own copy of the sidebar code when the site builds.

For the Hippo theme, the sidebars are not pushed into each page. Instead, you manually create a separate sidebar file (Jekyll doesn't create it for you) in the hippomenus directory. You will upload this sidebar file into a directory on Media Central. Then each Hippo page will reference and pull in this same sidebar file.

With the Hippo layout (in \_layouts/hippolayout.html), code at the top of each page references a sidebar file, like this:

```html
{%raw%}<script type="text/javascript" src="https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal/includescript.min._TTH_.js"></script>
<div class="rightMenu"> <span class="inc:https://images-na.ssl-images-amazon.com/images/G/01/mobile-apps/devportal/menus/{{page.sidebar}}._TTH_.html"> </span></div>{%endraw%}
```

The `includedescript.min.js` file is a script that pulls in an HTML file. The HTML file is dynamically specified by the {% raw %}{{page.sidebar}}{% endraw %} variable in the file reference.

The file in the hippo_menus folder contains the standalone sidebar for your project on the Hippo site. When you're ready to publish your content, you will upload this sidebar into a Media Central folder, as explained in [Publishing][jekyllhowto-publishing].

## Entries in the Sidebar

Each entry in the sidebar files includes four properties &mdash; `title`, `jurl`, `hurl`, and `ref`. These properties stand for the page title, Jekyll URL, Hippo URL, and the Markdown referent for linking. Here's an example:

```yaml
    - title: Sample1
      jurl: /sample.html
      hurl: /solutions/devices/fire-tv/docs/sample
      ref: sample1
```

Note that the `hurl` property does not use file extensions (such as .html), whereas the `jurl` property does. This is because Hippo is on a web server with Apache (which can handle this routing) whereas the Jekyll theme must be able to run locally without a server.

## Sidebar Object Hierarchy

In addition to the properties required for each entry, sidebar entries must appear in the following hierarchy:

``` yaml

folders:
- title: Theme documentation
  folderitems:

  - title: Homepage
    jurl: /index.html
    hurl: https://developer.amazon.com/index
    ref: home

- title: Sample Folder Title
  folderitems:

  - title: Sample1 level1
    jurl: /sample.html
    hurl: https://developer.amazon.com/i/solutions/devices/fire-tv/docs/sample1-level1
    ref: sample1

    subfolders:
    - title: Another level deep
      output: web
      subfolderitems:

      - title: Some content
        jurl: /sublevel1.html
        hurl: https://developer.amazon.com/i/solutions/devices/fire-tv/docs/sample1-level2
        ref: sublevel1

        subsubfolders:
        - title: Last level deep
          output: web
          subsubfolderitems:

          - title: Some content last level
            jurl: /sublevel1.html
            hurl: https://developer.amazon.com/i/solutions/devices/fire-tv/docs/sample1-level3
            ref: sample

```

That is, there's a `folders` object contains `folderitems`. Inside `folderitems` is another level called `subfolders`, which contains `subfolderitems`. Below `subfolders` is another level called `subsubfolders`, which contains `subssubfolderitems`. Each new level begins on a new line two spaces out from the previous one. The hierarchy looks like this:

```
folders:
  folderitems:
    subfolders:
      subfolderitems:
```

Don't change any of these object names that indicate the levels. The theme's template files use a `for` loop to iterate through this structure based on these object names.

You must have items at each level. If you want to have a folder contain other folders and no individual items, you must add a `-` at that level. For example:

``` yaml

folders:

- title: My parent folder
  folderitems:

  -

    subfolders:
    - title: My child folder
      output: web
      subfolderitems:

      - title: Some content
        jurl: /sublevel1.html
        hurl: https://developer.amazon.com/i/solutions/devices/fire-tv/docs/sample1-level2
        ref: sublevel1

    - title: My child folder
      output: web
      subfolderitems:

      - title: Some content
        jurl: /sublevel1.html
        hurl: https://developer.amazon.com/i/solutions/devices/fire-tv/docs/sample1-level2
        ref: sublevel1

```

{% include tip.html content="When you're creating new levels, it's easiest to copy the right formatting and then adjust the values. Use the sample formatting included in the sidebar.yml file to copy and paste new levels. If you get the spacing wrong, when Jekyll builds the project, it will usually throw an error and note a mapping problem in your YAML file." %}

## Required properties for `folderitems` items

Each item that appears appears under `folderitems` must have these properties:

| Property | Description |
|-----|-------|
| `title` | The page title. |
| `hurl` | The Hippo URL to your content.|
| `jurl` | The Jekyll URL. Use a relative link that begins with a `/` and includes only page's filename, not the folders. Use the ".html" file extension (even if your file has an .md extension in the source). |
| `ref` | The shortname used to create the Markdown link references. This is a friendly way to refer to the page. You use this value as the Markdown referent when inserting links in your content. |

Why not just have one link? Why include both `hurl` and `jurl`? Here's the reason:

*  Links in Hippo must be *absolute*, not relative. (Because the creators of Hippo were insane.)
*  Links in a standalone Jekyll site that is viewed locally on your computer and on other locations (like Corp Drive) must be *relative*.

Ideally, we would just have relative links all around. But Hippo's absolute URL requires us to specify another property. Hence the need for two URLs. The `ref` property is like a variable used to refer to either the `hurl` or `jurl` property, depending on which configuration file you use when building your Jekyll project. More detail is provided in [Links][content-and-formatting#automatedlinks].

## Adding Additional Resources

If you want to add some additional resources, such as to forums or other documentation, you can add them in a Related Resources section below the sidebar.

Here's an example:


```yaml
###########################

related_resources_title: Other Resources

related_resources_list:

- title: Forums
  hurl: https://forums.developer.amazon.com/

- title: AWS Documentation
  hurl: https://aws.amazon.com/documentation/

- title: Developer Portal
  hurl: https://developer.amazon.com
```

## Note that if you have a folder with no items (just other subfolders), you must include at least one item outside the folder.
## For the obligatory item, just use a single "-" with no other properties.


{% include links.html %}
