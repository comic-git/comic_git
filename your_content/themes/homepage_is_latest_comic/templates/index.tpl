{#
This template extends the comic.tpl template without making any changes to it, which is the same as just doing
   the exact same thing the comic.tpl template does. This is useful when you want one page to duplicate the
   functionality of another page. In the case of index.tpl, it lets the main landing page for the website be the
   same as the comic page for the latest page that's been uploaded.
The reason it will become the latest comic page and not any other page is that the Python script that generates
    the HTML files from these templates passes only the information for the latest comic page into this file.
    See comic.tpl for a better idea about what values are passed in and how it's built.
#}
{% extends "comic.tpl" %}
{# `block head` means that the next two lines go where the `head` block is defined in base.tpl #}
{%- block head %}
    {# We define the comic.css here because base.tpl will try to load latest.css #}
    <link rel="stylesheet" type="text/css" href="{{ base_dir }}/comic_git_engine/css/comic.css">
    {# `super()` means that everything that's currently in the `head` block in base.tpl is added first, and then the
       next line is added to the end. #}
    {{- super() }}
    {# We define the comic.css in your theme here so it takes priority over other CSS files. #}
    <link rel="stylesheet" type="text/css" href="{{ base_dir }}/your_content/themes/{{ theme }}/css/comic.css">
{%- endblock %}
