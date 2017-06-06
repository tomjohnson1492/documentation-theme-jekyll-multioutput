---
title: Troubleshooting
permalink: jekyllhowto-troubleshooting.html
sidebar: jekyllhowto
product: Jekyll How-to Guide
---

This page lists common errors and the steps needed to troubleshoot them.

## Issues building the site

### Address already in use

When you try to build the site, you get this error in iTerm:

```
jekyll 2.5.3 | Error:  Address already in use - bind(2)
```
This happens if a server is already in use. To fix this, edit your config file and change the port to a unique number.

If the previous server wasn't shut down properly, you can kill the server process using these commands:

`ps aux | grep jekyll`

Find the PID (for example, it  looks like "22298").

Then type `kill -9 22298` where "22298" is the PID.

Alternatively, type the following to stop all Jekyll servers:

```
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
```

### shell file not executable

If you run into permissions errors trying to run a shell script file (such as jekyllhowto-multibuild_web.sh), you may need to change the file permissions to make the sh file executable. Browse to the directory containing the shell script and run the following:

```
chmod +x build_writer.sh
```

## shell file not runnable

If you're using a PC, rename your shell files with a .bat extension.

### "page 0" cross references in the PDF

If you see "page 0" cross-references in the PDF, the URL doesn't exist. Check to make sure you actually included this page in the build.

If it's not a page but rather a file, you need to add a `noCrossRef` class to the file so that your print stylesheet excludes the counter from it. Add `class="noCrossRef"` as an attribute to the link. In the css/printstyles.css file, there is a style that should remove the counter from anchor elements with this class.

### The PDF is blank

Check the prince-list.txt file in the output to see if it contains links. If not, you have something wrong with the logic in the prince-list.txt file. Check the conditions.html file in your \_includes to see if the audience specified in your configuration file aligns with the buildAudience in the conditions.html file

### Sidebar not appearing

If you build your site but the sidebar doesn't appear, check the following:

Look in \_includes/custom/sidebarconfigs.html and make sure the conditional values there match up with values you're using in each page's frontmatter.

Make sure each TOC item has an output property that specifies web or pdf.

Understanding how the theme works can be helpful in troubleshooting. The \_includes/sidebar.html file loops through the values in the \_data/sidebar.yml file. There are `if` statements that check whether the conditions (as specified in the conditions.html file) are met. If the sidebar.yml item doesn't have the right output, then it won't get displayed in the sidebar. It would instead get skipped.

### Sidebar isn't collapsed

If the sidebar levels aren't collapsed, usually your JavaScript is broken somewhere. Open the JavaScript Console and look to see where the problem is. If one script breaks, then other scripts will break too, so troubleshooting it is a little tricky.

### Search isn't working

If the search isn't working, check the JSON validity in the search.json file in your output folder. Usually something is invalid. Identify the problematic line, fix the file, or put `search: exclude` in the frontmatter of the file to exclude it from search.


## Links not working

* Make sure you add `{%raw%}{% include links.html %}{%endraw%}` at the bottom of each page.
* Make sure your page's frontmatter has a `sidebar` property.
* Make sure in `_data/homepage_products.yml` your doc set is listed and includes a `shortname` property that matches your sidebar.


## Links include isn't working correctly

If you look at your HTML output and see that the links.html include at the bottom is leaving all the Markdown reference tags in the output, something is wrong with your Markdown or HTML syntax on the page. As a result, the Markdown might stop rendering.

For example, look at your HTML tables. If there is one tiny formatting issue (a tag not properly closed), kramdown will stop working on the file and won't convert any other content in the file. The Markdown reference tags are just evidence that the Markdown filter stopped converting the file to HTML at this point. Fix the HTML and the Markdown will properly convert to HTML.

## Building Someone Else's Project

When you build someone else's project, if the person has a Gem and Gemfile, you might get errors like this:

```
WARN: Unresolved specs during Gem::Specification.reset:
      rouge (~> 1.7)
      jekyll-watch (~> 1.1)
WARN: Clearing out unresolved specs.
```

This is because the person had different version of Ruby gems on their computer, which get packaged into a Gemfile.

First run bundler to make sure the gem versions on your computer match those of the project. From the project's directory, run the following:

```
bundle install
```

Then run this:

```
bundle exec jekyll serve --config configs/jekyll_english.yml
```

Now you can press **Ctrl+C** and run `. jekyll.sh` as usual.

## Checking the version of Jekyll

You can see what version of Jekyll you have by running the following:

```
jekyll -version
```

## Learn More

You can learn more about Jekyll generally here: [jekyllrb.com](https://jekyllrb.com/docs/home/). The Jekyll theme is a spinoff of the Jekyll theme I developed [here](http://idratherbewriting.com/documentation-theme-jekyll/). Some things are the same, and some are different.

To learn more about for loops, if statements, and more, read up on [Liquid from Shopify](https://help.shopify.com/themes/liquid/basics).

{% include links.html %}
