{% extends "base.tpl" %}
{%- block head %}
    {{- super() }}
    <link rel="next" href="{{ comic_base_dir }}/comic/{{ next_id }}/">
{%- endblock %}
{%- block content %}
    <div class="comic-page">
        {%- for image in images %}
        <div class="comic-image-container" id="comic-image-{{ loop.index }}">
            <a href="{{ comic_base_dir }}/comic/{{ next_id }}/#{{ next_anchor }}">
                <img class="comic-image" src="{{ base_dir }}/{{ image.web_path | e }}" alt="{{ image.alt_text | e }}"/>
            </a>
        </div>
        {%- endfor %}
    </div>

    <div id="navigation-bar">
    {% if first_id == current_id %}
        <a class="navigation-button-disabled">‹‹ First</a>
        <a class="navigation-button-disabled">‹ Previous</a>
    {% else %}
        <a class="navigation-button" href="{{ comic_base_dir }}/comic/{{ first_id }}/#{{ first_anchor }}">‹‹ First</a>
        <a class="navigation-button" href="{{ comic_base_dir }}/comic/{{ previous_id }}/#{{ previous_anchor }}">‹ Previous</a>
    {% endif %}
    {# The block below is the same as the one above, except it checks if you're on the last page. #}
    {% if last_id == current_id %}
        <a class="navigation-button-disabled">Next ›</a>
        <a class="navigation-button-disabled">Last ››</a>
    {% else %}
        <a class="navigation-button" href="{{ comic_base_dir }}/comic/{{ next_id }}/#{{ next_anchor }}">Next ›</a>
        <a class="navigation-button" href="{{ comic_base_dir }}/comic/{{ last_id }}/#{{ last_anchor }}">Last ››</a>
    {% endif %}
    </div>

    <h1 id="post-title">{{ _title }}</h1>
    <h3 id="post-date">Posted on: {{ _post_date }}</h3>
    {%- if _storyline %}
        <div id="storyline">
            {# `| replace(" ", "-")` takes the value in the variable, in this case `storyline`, and replaces all
               spaces with hyphens. This is important when building links to other parts of the site. #}
            Storyline: <a href="{{ comic_base_dir }}/archive/#archive-section-{{ _storyline | replace(' ', '-') }}">{{ _storyline }}</a>
        </div>
    {%- endif %}
    {%- if _characters %}
        <div id="characters">
        Characters:
        {# For loops let you take a list of a values and do something for each of those values. In this case,
           it runs through list of all the characters in this page, as defined by your info.ini file for this page,
           and it generates a link for each of those characters connecting to the `tagged` page for that
           character. #}
        {%- for character in _characters %}
            {# The `if not loop.last` block at the end of the next line means that the ", " string will be added
               after every character link EXCEPT the last one. #}
            <a href="{{ comic_base_dir }}/tagged/{{ character }}/">{{ character }}</a>{% if not loop.last %}, {% endif %}
        {%- endfor %}
        </div>
    {%- endif %}
    {%- if _tags %}
        <div id="tags">
        Tags:
        {%- for tag in _tags %}
            <a class="tag-link" href="{{ comic_base_dir }}/tagged/{{ tag }}/">{{ tag }}</a>{% if not loop.last %}, {% endif %}
        {%- endfor %}
        </div>
    {%- endif %}
    <hr id="post-body-break">
    <div id="post-body">
{{ post_html }}
    </div>
{%- endblock %}
{%- block script %}
{% if transcripts %}
<script type="module">
    import { init_transcript } from "{{ base_dir }}/comic_git_engine/js/transcript.js";
    init_transcript();
</script>
{% endif %}
{%- endblock %}
