Write a comment here
*** Parameters: ***
{} # params 
*** Markdown input: ***
<http://www.aa.com>

 <http://www.bb.com>

  <http://www.cc.com>

   <http://www.dd.com>

    <http://www.dd.com>

<a@invalid.it>

 <a@invalid.it>

   <a@invalid.it>

    <a@invalid.it>
*** Output of inspect ***
md_el(:document,[
	md_par([md_url("http://www.aa.com")]),
	md_par([md_url("http://www.bb.com")]),
	md_par([md_url("http://www.cc.com")]),
	md_par([md_url("http://www.dd.com")]),
	md_el(:code,[],{:raw_code=>"<http://www.dd.com>"},[]),
	md_par([md_email("a@invalid.it")]),
	md_par([md_email("a@invalid.it")]),
	md_par([md_email("a@invalid.it")]),
	md_el(:code,[],{:raw_code=>"<a@invalid.it>"},[])
],{},[])
*** Output of to_html ***
<p><a href='http://www.aa.com'>http://www.aa.com</a></p>

<p><a href='http://www.bb.com'>http://www.bb.com</a></p>

<p><a href='http://www.cc.com'>http://www.cc.com</a></p>

<p><a href='http://www.dd.com'>http://www.dd.com</a></p>

<pre><code>&lt;http://www.dd.com&gt;</code></pre>

<p><a href='mailto:a@invalid.it'>&#097;&#064;&#105;&#110;&#118;&#097;&#108;&#105;&#100;&#046;&#105;&#116;</a></p>

<p><a href='mailto:a@invalid.it'>&#097;&#064;&#105;&#110;&#118;&#097;&#108;&#105;&#100;&#046;&#105;&#116;</a></p>

<p><a href='mailto:a@invalid.it'>&#097;&#064;&#105;&#110;&#118;&#097;&#108;&#105;&#100;&#046;&#105;&#116;</a></p>

<pre><code>&lt;a@invalid.it&gt;</code></pre>
*** Output of to_latex ***
\href{http://www.aa.com}{http\char58\char47\char47www\char46aa\char46com}

\href{http://www.bb.com}{http\char58\char47\char47www\char46bb\char46com}

\href{http://www.cc.com}{http\char58\char47\char47www\char46cc\char46com}

\href{http://www.dd.com}{http\char58\char47\char47www\char46dd\char46com}

\begin{verbatim}<http://www.dd.com>\end{verbatim}
\href{mailto:a@invalid.it}{a\char64invalid\char46it}

\href{mailto:a@invalid.it}{a\char64invalid\char46it}

\href{mailto:a@invalid.it}{a\char64invalid\char46it}

\begin{verbatim}<a@invalid.it>\end{verbatim}
*** Output of to_md ***

*** Output of to_s ***

*** EOF ***



	OK!



*** Output of Markdown.pl ***
<p><a href="http://www.aa.com">http://www.aa.com</a></p>

<p><a href="http://www.bb.com">http://www.bb.com</a></p>

<p><a href="http://www.cc.com">http://www.cc.com</a></p>

<p><a href="http://www.dd.com">http://www.dd.com</a></p>

<pre><code>&lt;http://www.dd.com&gt;
</code></pre>

<p><a href="&#x6D;&#x61;&#105;&#x6C;&#116;&#x6F;:&#x61;&#64;&#105;&#110;&#118;&#97;&#x6C;&#x69;d&#x2E;&#x69;&#x74;">&#x61;&#64;&#105;&#110;&#118;&#97;&#x6C;&#x69;d&#x2E;&#x69;&#x74;</a></p>

<p><a href="&#x6D;&#97;&#105;l&#116;&#111;:&#x61;&#64;&#105;&#x6E;&#118;&#97;&#x6C;&#x69;&#100;&#46;&#105;&#116;">&#x61;&#64;&#105;&#x6E;&#118;&#97;&#x6C;&#x69;&#100;&#46;&#105;&#116;</a></p>

<p><a href="&#x6D;&#x61;&#x69;&#x6C;&#116;&#x6F;:a&#64;&#x69;&#x6E;&#x76;&#97;&#108;&#x69;&#x64;&#46;i&#x74;">a&#64;&#x69;&#x6E;&#x76;&#97;&#108;&#x69;&#x64;&#46;i&#x74;</a></p>

<pre><code>&lt;a@invalid.it&gt;
</code></pre>

*** Output of Markdown.pl (parsed) ***
Error: #<NoMethodError: undefined method `write_children' for <div> ... </>:REXML::Element>
