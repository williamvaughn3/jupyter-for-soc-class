
<h1>Snippets Menu Magic</h1>
<br>
<h1>Introduction</h1>
<p>SnippetsMenuMagic is an IPython extension that let's you easily create menu directly from the notebook.</p>
<p>The menu elements can be snippets of code, internal/external links, markdown documents etc.</p>
<p>Is meant to be used with <a href="https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tree/master/src/jupyter_contrib_nbextensions/nbextensions/snippets_menu" rel="nofollow">Snippet Menu</a> that is part of <a href="https://github.com/ipython-contrib/jupyter_contrib_nbextensions" rel="nofollow">jupyter contrib nbextensions.</a></p>
<h1>Installation</h1>
<p>The package can be installed as follows:</p>
<pre><code>pip install snippets_menu_magic
</code></pre>
<p>After installation, the extension may be loaded within an IPython
session with :</p>
<pre><code>%load_ext snippets_menu_magic
</code></pre>
<p>This extension rely on <a href="https://github.com/akesterson/dpath-python" rel="nofollow">dpath</a> to traverse the dictionary with xpath syntax. (it should be pulled automatically by pip)</p>
<p>It helps to also enable <a href="https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tree/master/src/jupyter_contrib_nbextensions/nbextensions/snippets_menu" rel="nofollow">Snippet Menu</a> extension to later see the results</p>
<h1>Quick usage how-to</h1>
<p>Add a menu and a sub-menu</p>
<pre><code>%%snip_add usage/how-to
this content will be pasted when the menu is clicked
can be multiple lines too
</code></pre>
<p>Add a link</p>
<pre><code>%%snip_add bookmarks nbextensions -link
https://github.com/ipython-contrib/jupyter_contrib_nbextensions    
</code></pre>
<p>Rename and place it as a top menu</p>
<pre><code>%snip_mv bookmarks/nbextensions top/bookmarks/nbextensions 
</code></pre>
<p>Search</p>
<pre><code>s=%snip_search "**/*extensions"
</code></pre>
<p>Remove it</p>
<pre><code>%snip_rm usage/how-to
</code></pre>
<p>Please take a moment to read the <a href="GUIDE.md" rel="nofollow">Guide</a> or better run the <a href="GUIDE.ipynb" rel="nofollow">GUIDE notebook</a> locally and play with it</p>
<h1>Development</h1>
<p>The latest release of the package may be obtained from
<a href="https://github.com/diramazioni/snippets_menu_magic/" rel="nofollow">GitHub</a>.</p>
<h1>Author</h1>
<p>This software was written and packaged by Eli Spizzichino</p>
<h1>License</h1>
<p>This software is licensed under the</p>
<p><a href="https://www.apache.org/licenses/LICENSE-2.0" rel="nofollow">Apache 2.0
License</a>.</p>

          