<<
# Scandoc template file.
#
# This is an example set of templates that is designed to create several 
# different kinds of index files. It generates a "master index" which intended 
# for use with a frames browser; A "package index" which is the root page of 
# the index, and then "package files" containing documentation for all of the 
# classes within a single package.

######################################################################

## For quick and superficial customization, 
## simply change these variables

$project_name     = '[Apache Portable RunTime]';
#$company_logo     = '<img src="../images/ScanDocBig.jpg">'; # change this to an image tag.
$copyright        = '&copy 2000 [Apache Software Foundation]';
$image_directory  = "../images/";
$bullet1_image    = $image_directory . "ball1.gif";
$bullet2_image    = $image_directory . "ball2.gif";
$bgcolor1         = "#FFFFFF";
$bgcolor2         = "#FFFFFF";

######################################################################

## Begin generating frame index file.

file "index.html";
>><html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; iso-8859-1">
    <title>$project_name</title>
  </head>
  <frameset cols="190,*">
    <frame src="master.html"  name="Master Index" noresize>
    <frame src="packages.html" name="Documentation">
    <noframes>
      <body bgcolor="$bgcolor2" stylesrc="index.html">
        <p>Some Documentation</p>
      </body>
    </noframes>
  </frameset>
</html>
<<

######################################################################

## Begin generating master index file (left-hand frame).

file "master.html";
>><html>
  <head>
    <title>Master Index</title>
  </head>
  <body bgcolor="$bgcolor1" text=#0000ff link=#0020ff vlink=#0020ff>
    <center><img src="${image_directory}ScanDocSmall.jpg" border="0" /></center>
    <p>
    <a href="packages.html" target="Documentation">Master Index</a>
    </p>
    <p>
      <font size="2">
        <nobr>
<<

## For each package, generate an index entry.

foreach $p (packages()) {
  $_ = $p->url;
  s/\s/_/g;
  >><a href="$_" target="Documentation"><b>$(p.name)</b></a><br>
    <dir>
  <<
  foreach $e ($p->classes()) {
    $_ = $e->url;
    s/\s/_/g;
    >><li><a href="$_" target="Documentation">$(e.fullname)</a>
    <<
  }
  foreach $e ($p->globals()) {
    $_ = $e->url;
    s/\s/_/g;
    >><li><a href="$_" target="Documentation">$(e.fullname)</a>
    <<
  }
  >></dir><<
}

>>
          <a href="to-do.html" target="Documentation"><b>To-Do List</b></a><br>
        </nobr>
      </font>
    </p>
  </body>
</html>
<<

######################################################################

## Begin generating package index file

file "packages.html";
>><html>
  <head>
    <title>$project_name -- Packages</title>
  </head>
  <body bgcolor="$bgcolor2">

    <center>$company_logo
    <h1>Documentation for $project_name</h1>
    </center>
    <h2>Package List</h2>
<<

## For each package, generate an index entry.

foreach $p (packages()) {
  $_ = $p->url;
  s/\s/_/g;
  >><a href = "$_">$(p.name)</a><br>
  <<
}

>>
    <p>
    <hr size=4>
    $copyright<br>
    Generated by <a href="$scandocURL"><b>ScanDoc $majorVersion.$minorVersion</b></a><br>
    Last Updated: $date<br>
  </body>
</html>

<<

######################################################################

## Generate "To-do list"

file "to-do.html";
>><html>
  <head>
    <title>$project_name -- To-Do list</title>
  </head>
  <body bgcolor="$bgcolor2">

    $company_logo

    <h1>To-do list for $project_name</h1>
<<

if (&todolistFiles()) {
  >><hr size=4><p>
  <<
  foreach $f (&todolistFiles()) {
    my @m = &todolistEntries( $f );
    if ($f =~ /([^\/]+)$/) { $f = $1; }
    >><b>$f:</b><ul>
    <<
    foreach $text (@m) {
      if ($text) {
        print "<li>", &processDescription( $text ), "\n";
      }
    }
    >></ul>
    <<
  }
}

>>
    <hr size=4>
    $copyright<br>
    Generated by <a href="$scandocURL"><b>ScanDoc $majorVersion.$minorVersion</b></a><br>
    Last Updated: $date<br>
  </body>
</html>
<<

######################################################################

## Generate individual files for each package.

my $p;
foreach $p (packages()) {
  $_ = $p->name;
  s/\s/_/g;
  file $_ . ".html";
  >><html>
  <head>
    <title>$project_name -- $(p.name)</title>
  </head>
  <body bgcolor="$bgcolor2">
    <center>
      <font size=6><b>$project_name</b></font>
      <hr size=4><p>
    </center>

    <h2>Package Name: $(p.name)</h2>
    <b>
<<

## Generate class and member index at the top of the file.

foreach $c ($p->classes()) {
  >><h3><img src="$bullet1_image" width=18 height=17 align=texttop>
    <a href="$(c.url)">$(c.fullname)</h3></a>
    <ul>
  <<
  foreach $m ($c->members()) {
    >><li><a href="$(m.url)">$(m.longname)</a>
    <<
  }
  >></ul>
  <<
}

>>
</b>
<<

## Generate detailed class documentation
foreach $c ($p->classes()) {
 ## Output searchable keyword list
 if ($c->keywords()) {
   print "<!-- ", $c->keywords(), " -->\n";
 }

 >><hr size="4">
   <a name="$(c.anchor)"></a>
   <h1>$(c.fullname)</h1>
   <table bgcolor="ffffff" border="0" cellspacing="4">
     <tr>
       <th align=center colspan=2>
       </th>
     </tr>
  <<
  
  # Output author tag
  if ($c->author()) {
    >><tr><th width=20% align=right>Author:</th><<
    >><td>$(c.author)</td></tr><<
  }

  # Output package version
  if ($c->version()) {
    >><tr><th width=20% align=right>Version:</th><<
    >><td>$(c.version)</td></tr><<
  }

  # Output Source file
  if ($c->sourcefile()) {
    >><tr><th width=20% align=right>Source:</th><<
    >><td>$(c.sourcefile)</td></tr><<
  }

  # Output base class list
  if ($c->baseclasses()) {
    >><tr><th width=20% align=right>Base classes:</th>
    <td><<
    my @t = ();
    foreach $b ($c->baseclasses()) {
      my $name = $b->name();
      if ($url = $b->url()) {
        push @t, "<a href=\"$url\">$name</a>";
      }
      else { push @t, $name; }
    }
    print join( ', ', @t );
    >></td></tr>
    <<
  }	

  # Output subclasses list
  if ($c->subclasses()) {
    >><tr><th width=20% align=right>Subclasses:</th>
      <td><<
    my @t = ();
    foreach $s ($c->subclasses()) {
      my $name = $s->name();
      if ($url = $s->url()) {
        push @t, "<a href=\"$url\">$name</a>";
      }
      else { push @t, $name; }
    }
    print join( ', ', @t );
    >></td></tr><<
  }

  # Output main class description
  >></tr>
  </table>
  <p>
  <<
  print &processDescription( $c->description() );
	
  # Output "see also" information
  if ($c->seealso()) {
    >><p><dt><b>See Also</b><dd>
    <<
    my @r = ();
    foreach $a ($c->seealso()) {
      my $name = $a->name();
      if ($url = $a->url()) {
        push @r, "<a href=\"$url\">$name</a>";
      }
      else { push @r, $name; }
    }
    print join( ',', @r );
    >><p>
    <<
  }

  # Output class member index
  if ($c->members()) {
    print "<h2>Member Index</h2>\n";
    print "<ul>";
    foreach $m ($c->members()) {
      >><li><a href="$(m.url)">$(m.fullname)</a>
	<<
    }
    >></ul><<
  }
 
  # Output class member variable documentation
  if ($c->membervars()) {
    print "<h2>Class Variables</h2>\n";
    print "<blockquote>\n";
    foreach $m ($c->membervars()) { &variable( $m ); }
    print "</blockquote>\n";
  }

  # Output class member function documentation
  if ($c->memberfuncs()) {
    print "<h2>Class Methods</h2>\n";
    print "<blockquote>\n";
    foreach $m ($c->memberfuncs()) { &function( $m ); }
    print "</blockquote>\n";
  }
}

# Output global variables
if ($p->globalvars()) {
  >><h2>Global Variables</h2>
    <blockquote>
  <<
  foreach $m ($p->globalvars()) { &variable( $m ); }
  print "</blockquote>\n";
}

# Output global functions
if ($p->globalfuncs()) {
  >><h2>Global Functions</h2>
    <blockquote>
  <<
  foreach $m ($p->globalfuncs()) { &function( $m ); }
  print "</blockquote>\n";
}

>>
    <hr size=4>
    $copyright<br>
    Generated by <a href="$scandocURL"><b>ScanDoc $majorVersion.$minorVersion</b></a><br>
    Last Updated: $date<br>
  </body>
</html>
<<
} # end of foreach (packages) loop

######################################################################

## Subroutine to generate documentation for a member function or global function

sub function {
  local ($f) = @_;
  
  if ($f->keywords()) {
    >><!-- $(f.keywords) -->
      <<
  }
  >>
  <a name="$(f.anchor)"></a>
  <dl>
    <dt>
     <b><img src="$bullet2_image" width=19 height=17 align=texttop>$(f.fullname);</b>
    <dd>
  <<
  print &processDescription( $f->description() );
  >>
  <p><dl>
  <<
  if ($f->params()) {
    >>
      <dt><b>Parameters</b><dd>
	<table width="85%">
    <<
    foreach $a ($f->params()) {
      >><tr valign=top><th align=right>
	$(a.name)</th><td><<
      print &processDescription( $a->description() );
      >></td></tr>
      <<
    }
    >></table>
      <<
  }
	
  if ($f->returnValue()) {
    >><dt><b>Return Value</b>
      <dd><<
    print &processDescription( $f->returnValue() );
    >><p><<
  }
  
  if ($f->exceptions()) {
    >><dt><b>Exceptions</b><dd>
      <table width=85%><tr><td colspan=2><hr size=3></td></tr>
    <<
    foreach $a ($f->exceptions()) {
      >><tr valign=top><th align=right>
	$(a.name)</th><td><<
	  print &processDescription( $a->description() );
      >></td></tr>
      <<
    }
    >><tr><td colspan=2><hr size=3></td></tr></table>
    <<
  }
	
  if ($f->seealso()) {
    >><dt><b>See Also</b><dd>
      <<
    my @r = ();
    foreach $a ($f->seealso()) {
      my $name = $a->name();
      if ($url = $a->url()) {
	push @r, "<a href=\"$url\">$name</a>";
      }
      else { push @r, $name; }
    }
    print join( ',', @r );
    >><p><<
  }
  >></dl></dl>
  <<
}

######################################################################

## Subroutine to generate documentation for a member variable or global variable.

sub variable {
  local ($v) = @_;
  
  if ($v->keywords()) {
    print "<!-- $(v.keywords) -->";
  }

  >>
    <a name="$(v.name)"></a>
      <dl><dt>
	<b><img src="$bullet2_image" width=19 height=17 align=texttop>$(v.fullname);</b>
  <dd>
  <<print &processDescription( $v->description() );>>
  <p><dl>
  <<
  if ($v->seealso()) {
    >><dt><b>See Also</b><dd>
      <<
	$comma = 0;
    foreach $a ($v->seealso()) {
      if ($comma) { print ","; }
      $comma = 1;
      >><a href="$(a.url)">$(a.name)</a>
	<<
    }
    >><p>
    <<
  }
  >></dl></dl>
  <<
}

######################################################################

sub processDescription {
  local ($_) = @_;
  
  s/^\s+//;				# Remove whitespace from beginning
  s/\s+$/\n/;				# Remove whitespace from end
  s/\n\n/<p>\n/g;			# Replace multiple CR's with paragraph markers
  s:\@heading(.*)\n:<p><h2>$1</h2>:;	# Handle heading text
  
  # Handle embedded image tags
  s:\@caution:<p><img src=\"${image_directory}/caution.gif\" align=left>:;
  s:\@warning:<p><img src=\"${image_directory}/warning.gif\" align=left>:;
  s:\@bug:<p><img src=\"${image_directory}/bug.gif\">:;
  s:\@tip:<p><img src=\"${image_directory}/tip.gif\">:;

  return $_;
}
