---
title: Getting Started
permalink: /jekyllhowto-getting-started.html
product: Jekyll How-to Guide
sidebar: jekyllhowto
---

## Documentation Theme for Jekyll -- Multi-output Version

This theme is intended for technical documentation projects (e.g., user guides and manuals for software or hardware). The theme uses pages exclusively and features robust multi-level navigation as well as both web and PDF output. This version of the theme delivers the theme files through RubyGems.

## Installation

1.  Install Jekyll:
    * [Install Jekyll on Mac][jekyllhowto-install-jekyll-on-mac]
    * [Install Jekyll on Windows][jekyllhowto-install-jekyll-on-windows]
2.  Install [Bundler](http://bundler.io/):

    ```
    gem install bundler
    ```

3.  Download the gem-based theme from the  [documentation-theme-jekyll-multioutput-gem](https://github.com/tomjohnson1492/documentation-theme-jekyll-multioutput-gem) repo.
4.  Use Bundler to install or update the gem-theme's files:

    ```
    bundle update
    ```

5.  Configure the values in the **\_config.yml** file based on the inline code comments in that file.

## The Location of the Theme Files

This is a gem-based theme, which means that most of the theme's files are stored in a gem instead of inside the Jekyll project. The gem is called [documentation-theme-jekyll-multioutput](https://rubygems.org/gems/documentation-theme-jekyll-multioutput). By storing the files in a gem, the theme files become available (and easy to update) across many different repos.  Without the gem, the theme files would be hard-coded in each repo, making it difficult to apply updates.

The theme files in the gem contain four folders: \_includes, \_assets, \_layouts, and \_sass.

To see which version of the gem you have, `cd` to your project's directory and run:

```
bundle show documentation-theme-jekyll-multioutput
```

The response will indicate the version in the path. For example, `/usr/local/lib/ruby/gems/2.3.0/gems/documentation-theme-jekyll-multioutput-0.1.0`. This is version 0.1.0 of the gem. You can compare this version against the version listed on the [gem's RubyGem page](https://rubygems.org/gems/documentation-theme-jekyll-multioutput).

The `show` command tells you where the gem files are stored. On a Mac, you can run `open <path>`, replacing `<path>` with the `/usr/local/...` path returned above to open a Finder window showing the gem's files. On Windows, you can run `explorer <path>` to open an Explorer window.

To update the gem:

```
bundle update documentation-theme-jekyll-multioutput
```

Or just run `bundle update` to update all gems.

When you run this command, any updates to the theme will be pulled into your gem.

## Source and gem repos

There are two repos related to this theme:

* The source repo: [documentation-theme-jekyll-multioutput](https://github.com/tomjohnson1492/documentation-theme-jekyll-multioutput)
* The gem-based theme repo: [documentation-theme-jekyll-multioutput-gem](https://github.com/tomjohnson1492/documentation-theme-jekyll-multioutput-gem)

The source repo (documentation-theme-jekyll-multioutput) contains the theme files (including the \_layout, \_includes, \_sass, and \_assets folders) hard-coded into the Jekyll theme, without making use of the gem. This is the project source from which the gemspec is generated that powers the gem-based theme. You shouldn't work with the documentation-theme-jekyll-multioutput repo directly unless you never want updates for your theme or don't want to use a gem-based theme.

The gem-based theme repo (documentation-theme-jekyll-multioutput-gem) is generated from the source theme's files. This repo does not include the \_layout, \_includes, \_sass, and \_assets folders because these folders are instead delivered through the gem. This repo also contains a Gemfile that specifies the documentation-theme-jekyll-multioutput gem.


## Overwriting Gem Files

You can [overwrite any gem-based files](http://jekyllrb.com/docs/themes/#overriding-theme-defaults) by adding a file by a similar name in your project. (You can also add additional files not in the gem as well.)

For example, suppose you want to overwrite the content in \_includes/logo.html. Add a directory called \_includes in your project, and create a file called "logo.html". Any adjustments you make will overwrite the original. (Most likely you would copy the content from the \_includes/logo.html file in the gem as a basis for your modification.)

If you want to get rid of the theme entirely and make all files local, see [Converting gem-based themes to regular themesPermalink](http://jekyllrb.com/docs/themes/#converting-gem-based-themes-to-regular-themes).

## Pages

This theme uses pages exclusively. Organize your pages inside the \_docs folder. You can store your pages in any folder structures you want, with any level of folder nesting. Assuming you have the permalink property correctly configured in the page's frontmatter, the site output will pull all of those pages out of their folders and put them into the root directory.

Check out the \_site folder, which is where Jekyll is generated, to see the difference between your project’s structure and the resulting site output. Having all files flattened in the root directory on site build is essential for relative linking to work and for all paths to JS and CSS files to be valid. Relative links allow you to view the built site offline or to push it from one environment or directory structure to the next without worrying about valid paths to theme assets or other links.

## Frontmatter

Make sure each page has frontmatter at the top like this:

```yaml
---
title: "Sample 1: The Beginning"
permalink: sample.html
sidebar: generic
product: Generic Product
---
```

<table>
   <colgroup>
      <col width="30%" />
      <col width="70%" />
   </colgroup>
   <thead>
      <tr>
         <th markdown="span">Property</th>
         <th markdown="span">Description</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td markdown="span">title</td>
         <td markdown="span">The title for the page. If you want to use a colon in your page title, you must enclose the title’s value in quotation marks. Note that titles in your pages' frontmatter are not synced with the titles in your sidebar data file. If you change it in one place, remember to change it in the other too.</td>
      </tr>
      <tr>
         <td markdown="span">permalink</td>
         <td markdown="span">Use the same name as your file name, but use ".html" instead of ".md" in the permalink property. Do not put forward slashes around the permalink (this makes Jekyll put the file inside a folder in the output). When Jekyll builds the site, it will put the page into the root directory rather than leaving it in a subdirectory or putting it inside a folder and naming the file index.html. </td>
      </tr>
      <tr>
         <td markdown="span">sidebar</td>
         <td markdown="span">The name of the sidebar that this page should use (don't include ".yml" in the name). You can also specify the sidebar as a default property in your configuration file.</td>
      </tr>
      <tr>
         <td markdown="span">product</td>
         <td markdown="span">The product for this content. This appears in search and will be used as a faceted search filter at some point in the future.</td>
      </tr>
      <tr>
         <td markdown="span">toc-style: kramdown</td>
         <td markdown="span">Tells the theme you want to use the kramdown-built on-page TOC. See [On-Page Table of Contents"][jekyllhowto-content-and-formatting#kramdowntoc] in the Formatting topic for details how to insert the TOC using kramdown markup. This property is applied as a default in the \_config.yml file. If you prefer the JS-generated on-page TOC instead, remove this default from your \_config.yml file.</td>
      </tr>
   </tbody>
</table>

## Sidebar

To configure the sidebar, copy the format shown in \_data/generic.yml into a new sidebar file. Keep generic.yml as an example, because YAML syntax can be extremely picky and sometimes frustrating to get right. Generic.yml shows an example of content at every level.

Each of your pages should reference the appropriate sidebar either in the page's frontmatter. You could also define the sidebar using defaults in your \_config.yml file.

{% include links.html %}
