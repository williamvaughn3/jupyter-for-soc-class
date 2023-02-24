<p>Have you ever needed to find a old Jupyter Notebook file but forgot where you put it :grimacing: ?  Do you remember the packages you used :thinking: or maybe some of the terms you may have put in the markdown?  If so then this package will be a useful tool for you!  After learning the uses of this package you can even save valuable notebooks for later use by adding TODO tags.  This is all explained in detail below.</p>
<h3>High Level Description</h3>
<p>This is a package that can be used to search through jupyter notebooks at or below a specified directory.  There are many different ways to use the package to refine the search or visualize the notebooks.  I will go through most of them below.</p>
<h2>Installing <strong>nb_search</strong></h2>
<pre lang="bash">$ pip install nb_search
</pre>
<h2>Uses</h2>
<p>All of the uses below (except for fsearch) can be used in IPython console and in a Jupyter Notebook itself.  Using it in a Jupyter Notebook is straight forward.  To use it in a IPython console start by entering <code>%run nb_search.py</code> into the IPython console along with the optional arguments and directory (or list of files) you would like to search through.</p>
<h3>all</h3>
<p>This is the most basic argument and does not allow any further arguments with it.  It simply searches the desired directory for all of the notebook files and displays them as clickable HTML links to the notebooks.  The syntax for using this is shown below:</p>
<ul>
<li>
<p><strong>IPython Console</strong></p>
<pre lang="python3"> <span class="o">%</span><span class="n">run</span> <span class="n">nb_search</span><span class="o">.</span><span class="n">py</span> <span class="o">--</span><span class="nb">all</span>
</pre>
</li>
<li>
<p><strong>Jupyter Notebook</strong></p>
<pre lang="python3"> <span class="kn">from</span> <span class="nn">nb_search</span> <span class="kn">import</span> <span class="n">search_files</span>
 <span class="n">files</span> <span class="o">=</span> <span class="n">search_files</span><span class="p">(</span><span class="s1">'PATH_TO_DIRECTORY'</span><span class="p">)</span>
</pre>
<p>^^ You may simply run the function without any arguments.  This will recursively search through the current directory.</p>
</li>
</ul>
<h3>code</h3>
<p>This argument will allow you to search all of the code cells of the notebooks in your specified directory for a string given and will return the notebooks that have the string in one or more of their cells.  An example of using this to search for the variable "x" is shown below:</p>
<ul>
<li>
<p><strong>IPython Console</strong></p>
<pre lang="python3"> <span class="o">%</span><span class="n">run</span> <span class="n">nb_search</span><span class="o">.</span><span class="n">py</span> <span class="o">--</span><span class="n">code</span> <span class="s1">'.'</span> <span class="n">x</span>
</pre>
</li>
<li>
<p><strong>Jupyter Notebook</strong></p>
<pre lang="python3"> <span class="kn">from</span> <span class="nn">nb_search</span> <span class="kn">import</span> <span class="n">search_notebook</span>
 <span class="n">files</span> <span class="o">=</span> <span class="n">search_notebook</span><span class="p">(</span><span class="s1">'x'</span><span class="p">,</span><span class="s1">'code'</span><span class="p">,</span><span class="s1">'PATH_TO_DIRECTORY'</span><span class="p">)</span>
</pre>
</li>
</ul>
<h3>markdown</h3>
<p>This is the same concept as the code argument but in the markdown cells.<br>
An example of using this to search the markdown cells for the word "title" is shown below:</p>
<ul>
<li>
<p><strong>IPython Console</strong></p>
<pre lang="python3"> <span class="o">%</span><span class="n">run</span> <span class="n">nb_search</span><span class="o">.</span><span class="n">py</span> <span class="o">--</span><span class="n">markdown</span> <span class="s1">'.'</span> <span class="n">title</span>
</pre>
</li>
<li>
<p><strong>Jupyter Notebook</strong></p>
<pre lang="python3"> <span class="kn">from</span> <span class="nn">nb_search</span> <span class="kn">import</span> <span class="n">search_notebook</span>
 <span class="n">files</span> <span class="o">=</span> <span class="n">search_notebook</span><span class="p">(</span><span class="s1">'title'</span><span class="p">,</span><span class="s1">'markdown'</span><span class="p">,</span><span class="s1">'PATH_TO_DIRECTORY'</span><span class="p">)</span>
</pre>
</li>
</ul>
<h3>heading</h3>
<p>This is close to the markdown argument but instead of searching the entire markdown cell it only looks in the headings.  An example of using this to find the word "title" is shown below:</p>
<ul>
<li>
<p><strong>IPython Console</strong></p>
<pre lang="python3"> <span class="o">%</span><span class="n">run</span> <span class="n">nb_search</span><span class="o">.</span><span class="n">py</span> <span class="o">--</span><span class="n">heading</span> <span class="s1">'.'</span> <span class="n">title</span>
</pre>
</li>
<li>
<p><strong>Jupyter Notebook</strong></p>
<pre lang="python3"> <span class="kn">from</span> <span class="nn">nb_search</span> <span class="kn">import</span> <span class="n">search_heading</span>
 <span class="n">files</span> <span class="o">=</span> <span class="n">search_heading</span><span class="p">(</span><span class="s1">'title'</span><span class="p">,</span><span class="s1">'PATH_TO_DIRECTORY'</span><span class="p">)</span>
</pre>
</li>
</ul>
<h3>heading_pp</h3>
<p>Once you have found a jupyter notebook you want to know more about but don't want to open yet you can use <strong>heading_pp</strong>_ to get a pretty printed display of the headings in the file.  An example of how to do that is shown below:</p>
<ul>
<li>
<p><strong>IPython Console</strong></p>
<pre lang="python3"> <span class="o">%</span><span class="n">run</span> <span class="n">nb_search</span><span class="o">.</span><span class="n">py</span> <span class="o">--</span><span class="n">heading_pp</span> <span class="s1">'./notebook.ipynb'</span>
</pre>
</li>
<li>
<p><strong>Jupyter Notebook</strong></p>
<pre lang="python3"> <span class="kn">from</span> <span class="nn">nb_search</span> <span class="kn">import</span> <span class="n">heading_pprint</span>
 <span class="n">files</span> <span class="o">=</span> <span class="n">heading_pprint</span><span class="p">(</span><span class="s1">'PATH_TO_DIRECTORY'</span><span class="p">)</span>
</pre>
</li>
</ul>
<h3>property</h3>
<p>For my research groups HER project this is the most refined search.  You are able to search based on one to three things which must be seperated by an "and".</p>
<ol>
<li>Metal A - You can specify a metal to search the notebooks for.</li>
<li>Metal B - You can specify a second metal you would like the search for.</li>
<li>Max_H - You may specify the max Hydrogen to be below or above a certain value with the logical operators "&lt;" and "&gt;"</li>
</ol>
<p>The order in which you enter the metals or even the Max_H does not matter as long as each specification is seperated by an "and".</p>
<p>Below are 2 examples of using the property argument.  The first is just to find any notebook with the metal Mo in it.  The second is to find any notebook with Mo and a Max_H of below 8.0 micromoles.</p>
<ul>
<li>
<p><strong>IPython Console</strong></p>
<pre lang="python3"> <span class="o">%</span><span class="n">run</span> <span class="n">nb_search</span><span class="o">.</span><span class="n">py</span> <span class="o">--</span><span class="nb">property</span> <span class="s1">'.'</span> <span class="n">Mo</span>
</pre>
<pre lang="python3"> <span class="o">%</span><span class="n">run</span> <span class="n">nb_search</span><span class="o">.</span><span class="n">py</span> <span class="o">--</span><span class="nb">property</span> <span class="s1">'.'</span> <span class="n">Mo</span> <span class="ow">and</span> <span class="n">Max_H</span> <span class="o">&lt;</span> <span class="mf">8.0</span>
</pre>
</li>
<li>
<p><strong>Jupyter Notebook</strong></p>
<pre lang="python3"> <span class="kn">from</span> <span class="nn">nb_search</span> <span class="kn">import</span> <span class="n">search_data</span>
 <span class="n">files</span> <span class="o">=</span> <span class="n">search_data</span><span class="p">(</span><span class="s1">'Mo and Max_H &lt; 8.0'</span><span class="p">,</span><span class="s1">'PATH_TO_DIRECTORY'</span><span class="p">)</span>
</pre>
</li>
</ul>
<h3>todo</h3>
<p>If you have a specific notebook you would like to tag as TODO then you can search for it with this.  You can also put an optional description and due date (in brackets) that will be displayed above the notebook link.  The syntax for this is shown below and can be put in any code cell in a notebook:</p>
<pre lang="python3"><span class="o">%</span><span class="n">TODO</span> <span class="p">[</span><span class="n">YEAR</span><span class="o">-</span><span class="n">MONTH</span><span class="o">-</span><span class="n">DAY</span><span class="p">]</span> <span class="n">Optional</span> <span class="n">Description</span>
</pre>
<p>The todo option is simple and only requires the user input the directory they would like to search through or '.' for the current one as shown below:</p>
<ul>
<li>
<p><strong>IPython Console</strong></p>
<pre lang="python3"> <span class="o">%</span><span class="n">run</span> <span class="n">nb_search</span><span class="o">.</span><span class="n">py</span> <span class="o">--</span><span class="n">todo</span> <span class="s1">'.'</span>
</pre>
</li>
<li>
<p><strong>Jupyter Notebook</strong></p>
<pre lang="python3"> <span class="kn">from</span> <span class="nn">nb_search</span> <span class="kn">import</span> <span class="n">search_todo</span>
 <span class="n">files</span> <span class="o">=</span> <span class="n">search_todo</span><span class="p">(</span><span class="s1">'PATH_TO_DIRECTORY'</span><span class="p">)</span>
</pre>
</li>
</ul>
<h3>fsearch</h3>
<p>This is the exact same concept as the property option but can allow for more complicated queries of the three properties.  The user must input a function that returns True for the files he would like to view.  An example of the syntax of this function is shown below:</p>
<pre lang="python3"><span class="k">def</span> <span class="nf">f</span><span class="p">(</span><span class="n">NB</span><span class="p">):</span>
    <span class="n">p1</span> <span class="o">=</span> <span class="n">NB</span><span class="o">.</span><span class="n">property</span><span class="p">[</span><span class="s1">'Metal_A'</span><span class="p">]</span> <span class="o">==</span> <span class="s1">'Pt'</span>
    <span class="n">p2</span> <span class="o">=</span> <span class="n">NB</span><span class="o">.</span><span class="n">property</span><span class="p">[</span><span class="s1">'Metal_B'</span><span class="p">]</span> <span class="o">==</span> <span class="s1">'Pt'</span>
    <span class="n">p3</span> <span class="o">=</span> <span class="n">NB</span><span class="o">.</span><span class="n">property</span><span class="p">[</span><span class="s1">'Max_H'</span><span class="p">]</span> <span class="o">&gt;</span> <span class="mi">47</span>
    <span class="k">return</span> <span class="p">(</span><span class="n">p1</span> <span class="ow">or</span> <span class="n">p2</span><span class="p">)</span> <span class="ow">and</span> <span class="n">p3</span>
</pre>
<p>Then the user can search for files in the current directory that have 'Pt' as either metal A or metal B, as well as, a max_H greater that 47 micromoles by using the function as shown below:</p>
<pre lang="python3"><span class="kn">from</span> <span class="nn">nb_search</span> <span class="kn">import</span> <span class="n">fsearch</span>
<span class="n">files</span> <span class="o">=</span> <span class="n">fsearch</span><span class="p">(</span><span class="n">f</span><span class="p">,</span><span class="s1">'.'</span><span class="p">)</span>
</pre>
<h2>Demonstration of Use</h2>
<p>Most of the search functions output a list of the files that can then be used instead of a directory path to refine a search.  That capability along with the TODO search are shown below:</p>

<p>To install nb_search, along with the tools you need to develop and run tests, run the following in your virtualenv:</p>
<pre lang="bash">$ pip install -e .<span class="o">[</span>dev<span class="o">]</span>
</pre>

          