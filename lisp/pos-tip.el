<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: pos-tip.el</title><link rel="alternate" type="application/wiki" title="Редактировать" href="http://www.emacswiki.org/emacs?action=edit;id=pos-tip.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: pos-tip.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=pos-tip.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for pos-tip.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=pos-tip.el" /><meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  // https://stackoverflow.com/questions/280634/endswith-in-javascript
  if (typeof String.prototype.endsWith !== 'function') {
    String.prototype.endsWith = function(suffix) {
      return this.indexOf(suffix, this.length - suffix.length) !== -1;
    };
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;

	items = toc.getElementsByTagName('a');
	for (var i = 0; i < items.length; i++) {
	  while (items[i].textContent.endsWith('â')) {
            var text = items[i].childNodes[0].nodeValue;
	    items[i].childNodes[0].nodeValue = text.substring(0, text.length - 1);
	  }
	}
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://emacswiki.org/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><div class="menu"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/%d0%9a%d0%b0%d1%80%d1%82%d0%b0%d0%a1%d0%b0%d0%b9%d1%82%d0%b0">КартаСайта</a> <a class="local" href="http://www.emacswiki.org/emacs/%d0%9f%d0%be%d1%81%d0%bb%d0%b5%d0%b4%d0%bd%d0%b8%d0%b5%d0%98%d0%b7%d0%bc%d0%b5%d0%bd%d0%b5%d0%bd%d0%b8%d1%8f">ПоследниеИзменения</a> <a class="local" href="http://www.emacswiki.org/emacs/%d0%a2%d0%b5%d1%80%d1%80%d0%b8%d1%82%d0%be%d1%80%d0%b8%d1%8f%d0%95%d0%bc%d0%b0%d0%ba%d1%81%d0%9b%d0%b8%d1%81%d0%bf%d0%b0">ТерриторияЕмаксЛиспа</a> <a class="local" href="http://www.emacswiki.org/emacs/%d0%9a%d0%b0%d0%ba%d0%98%d1%87%d1%82%d0%be">КакИчто</a> <a class="local" href="http://www.emacswiki.org/emacs/%d0%98%d0%b7%d0%b2%d0%b5%d1%81%d1%82%d0%b8%d1%8f">Известия</a> </span><form method="get" action="http://www.emacswiki.org/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search"><p><label for="search">Поиск:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Язык:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Вперед!" /></p></form></div><h1><a href="http://www.emacswiki.org/emacs?search=%22pos-tip%5c.el%22" rel="nofollow" title="Щелкните для поиска ссылок на эту страницу">pos-tip.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/pos-tip.el">Download</a></p><pre><span class="comment">;;; pos-tip.el --- Show tooltip at point -*- coding: utf-8 -*-</span>

<span class="comment">;; Copyright (C) 2010 S. Irie</span>

<span class="comment">;; Author: S. Irie</span>
<span class="comment">;; Maintainer: S. Irie</span>
<span class="comment">;; Keywords: Tooltip</span>

(<span class="keyword">defconst</span> <span class="variable">pos-tip-version</span> <span class="string">"0.4.5"</span>)

<span class="comment">;; This program is free software; you can redistribute it and/or</span>
<span class="comment">;; modify it under the terms of the GNU General Public License as</span>
<span class="comment">;; published by the Free Software Foundation; either version 2, or</span>
<span class="comment">;; (at your option) any later version.</span>

<span class="comment">;; It is distributed in the hope that it will be useful, but WITHOUT</span>
<span class="comment">;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY</span>
<span class="comment">;; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public</span>
<span class="comment">;; License for more details.</span>

<span class="comment">;; You should have received a copy of the GNU General Public</span>
<span class="comment">;; License along with this program; if not, write to the Free</span>
<span class="comment">;; Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,</span>
<span class="comment">;; MA  02110-1301 USA</span>

<span class="comment">;;; Commentary:</span>

<span class="comment">;; The standard library tooltip.el provides the function for displaying</span>
<span class="comment">;; a tooltip at mouse position which allows users to easily show it.</span>
<span class="comment">;; However, locating tooltip at arbitrary buffer position in window</span>
<span class="comment">;; is not easy. This program provides such function to be used by other</span>
<span class="comment">;; frontend programs.</span>

<span class="comment">;; This program is tested on GNU Emacs 22, 23 under X window system and</span>
<span class="comment">;; Emacs 23 for MS-Windows.</span>

<span class="comment">;;</span>
<span class="comment">;; Installation:</span>
<span class="comment">;;</span>
<span class="comment">;; First, save this file as pos-tip.el and byte-compile in</span>
<span class="comment">;; a directory that is listed in load-path.</span>
<span class="comment">;;</span>
<span class="comment">;; Put the following in your .emacs file:</span>
<span class="comment">;;</span>
<span class="comment">;;   (<span class="keyword">require</span> '<span class="constant">pos-tip</span>)</span>
<span class="comment">;;</span>
<span class="comment">;; To use the full features of this program on MS-Windows,</span>
<span class="comment">;; put the additional setting in .emacs file:</span>
<span class="comment">;;</span>
<span class="comment">;;   (pos-tip-w32-max-width-height)   ; Maximize frame temporarily</span>
<span class="comment">;;</span>
<span class="comment">;; or</span>
<span class="comment">;;</span>
<span class="comment">;;   (pos-tip-w32-max-width-height t) ; Keep frame maximized</span>

<span class="comment">;;</span>
<span class="comment">;; Examples:</span>
<span class="comment">;;</span>
<span class="comment">;; We can display a tooltip at the current position by the following:</span>
<span class="comment">;;</span>
<span class="comment">;;   (pos-tip-show <span class="string">"foo bar"</span>)</span>
<span class="comment">;;</span>
<span class="comment">;; If you'd like to specify the tooltip color, use an expression as:</span>
<span class="comment">;;</span>
<span class="comment">;;   (pos-tip-show <span class="string">"foo bar"</span> '(<span class="string">"white"</span> . <span class="string">"red"</span>))</span>
<span class="comment">;;</span>
<span class="comment">;; Here, <span class="string">"white"</span> and <span class="string">"red"</span> are the foreground color and background</span>
<span class="comment">;; color, respectively.</span>


<span class="comment">;;; History:</span>
<span class="comment">;; 2010-09-27  S. Irie</span>
<span class="comment">;;         * Simplified implementation of `<span class="constant important">pos-tip-window-system</span>'</span>
<span class="comment">;;         * Version 0.4.5</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-08-20  S. Irie</span>
<span class="comment">;;         * Changed to use `<span class="constant important">window-line-height</span>' to calculate tooltip position</span>
<span class="comment">;;         * Changed `<span class="constant important">pos-tip-string-width-height</span>' to ignore last empty line</span>
<span class="comment">;;         * Version 0.4.4</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-07-25  S. Irie</span>
<span class="comment">;;         * Bug fix</span>
<span class="comment">;;         * Version 0.4.3</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-06-09  S. Irie</span>
<span class="comment">;;         * Bug fix</span>
<span class="comment">;;         * Version 0.4.2</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-06-04  S. Irie</span>
<span class="comment">;;         * Added support for text-scale-mode</span>
<span class="comment">;;         * Version 0.4.1</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-05-04  S. Irie</span>
<span class="comment">;;         * Added functions:</span>
<span class="comment">;;             `<span class="constant important">pos-tip-x-display-width</span>', `<span class="constant important">pos-tip-x-display-height</span>'</span>
<span class="comment">;;             `<span class="constant important">pos-tip-normalize-natnum</span>', `<span class="constant important">pos-tip-frame-relative-position</span>'</span>
<span class="comment">;;         * Fixed the supports for multi-displays and multi-frames</span>
<span class="comment">;;         * Version 0.4.0</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-04-29  S. Irie</span>
<span class="comment">;;         * Modified to avoid byte-compile warning</span>
<span class="comment">;;         * Bug fix</span>
<span class="comment">;;         * Version 0.3.6</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-04-29  S. Irie</span>
<span class="comment">;;         * Renamed argument MAX-HEIGHT of `<span class="constant important">pos-tip-fill-string</span>' to MAX-ROWS</span>
<span class="comment">;;         * Modified old FSF address</span>
<span class="comment">;;         * Version 0.3.5</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-04-29  S. Irie</span>
<span class="comment">;;         * Modified `<span class="constant important">pos-tip-show</span>' to truncate string exceeding display size</span>
<span class="comment">;;         * Added function `<span class="constant important">pos-tip-truncate-string</span>'</span>
<span class="comment">;;         * Added optional argument MAX-ROWS to `<span class="constant important">pos-tip-split-string</span>'</span>
<span class="comment">;;         * Added optional argument MAX-HEIGHT to `<span class="constant important">pos-tip-fill-string</span>'</span>
<span class="comment">;;         * Version 0.3.4</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-04-16  S. Irie</span>
<span class="comment">;;         * Changed `<span class="constant important">pos-tip-show</span>' not to fill paragraph unless exceeding WIDTH</span>
<span class="comment">;;         * Version 0.3.3</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-04-08  S. Irie</span>
<span class="comment">;;         * Bug fix</span>
<span class="comment">;;         * Version 0.3.2</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-31  S. Irie</span>
<span class="comment">;;         * Bug fix</span>
<span class="comment">;;         * Version 0.3.1</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-30  S. Irie</span>
<span class="comment">;;         * Added support for MS-Windows</span>
<span class="comment">;;         * Added option `<span class="constant important">pos-tip-use-relative-coordinates</span>'</span>
<span class="comment">;;         * Bug fixes</span>
<span class="comment">;;         * Version 0.3.0</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-23  S. Irie</span>
<span class="comment">;;         * Changed argument WORD-WRAP to JUSTIFY</span>
<span class="comment">;;         * Added optional argument SQUEEZE</span>
<span class="comment">;;         * Added function `<span class="constant important">pos-tip-fill-string</span>'</span>
<span class="comment">;;         * Added option `<span class="constant important">pos-tip-tab-width</span>' used to expand tab characters</span>
<span class="comment">;;         * Bug fixes</span>
<span class="comment">;;         * Version 0.2.0</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-22  S. Irie</span>
<span class="comment">;;         * Added optional argument WORD-WRAP to `<span class="constant important">pos-tip-split-string</span>'</span>
<span class="comment">;;         * Changed `<span class="constant important">pos-tip-show</span>' to perform word wrap or kinsoku shori</span>
<span class="comment">;;         * Version 0.1.8</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-20  S. Irie</span>
<span class="comment">;;         * Added optional argument DY</span>
<span class="comment">;;         * Bug fix</span>
<span class="comment">;;         * Modified docstrings</span>
<span class="comment">;;         * Version 0.1.7</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-18  S. Irie</span>
<span class="comment">;;         * Added/modifed docstrings</span>
<span class="comment">;;         * Changed working buffer name to <span class="string">" *xwininfo*"</span></span>
<span class="comment">;;         * Version 0.1.6</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-17  S. Irie</span>
<span class="comment">;;         * Fixed typos in docstrings</span>
<span class="comment">;;         * Version 0.1.5</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-16  S. Irie</span>
<span class="comment">;;         * Added support for multi-display environment</span>
<span class="comment">;;         * Bug fix</span>
<span class="comment">;;         * Version 0.1.4</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-16  S. Irie</span>
<span class="comment">;;         * Bug fix</span>
<span class="comment">;;         * Changed calculation for `<span class="constant important">x-max-tooltip-size</span>'</span>
<span class="comment">;;         * Modified docstring</span>
<span class="comment">;;         * Version 0.1.3</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-11  S. Irie</span>
<span class="comment">;;         * Modified commentary</span>
<span class="comment">;;         * Version 0.1.2</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-11  S. Irie</span>
<span class="comment">;;         * Re-implemented `<span class="constant important">pos-tip-string-width-height</span>'</span>
<span class="comment">;;         * Added indicator variable `<span class="constant important">pos-tip-upperside-p</span>'</span>
<span class="comment">;;         * Version 0.1.1</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-09  S. Irie</span>
<span class="comment">;;         * Re-implemented `<span class="constant important">pos-tip-show</span>' (*incompatibly changed*)</span>
<span class="comment">;;             - Use frame default font</span>
<span class="comment">;;             - Automatically calculate tooltip pixel size</span>
<span class="comment">;;             - Added optional arguments: TIP-COLOR, MAX-WIDTH</span>
<span class="comment">;;         * Added utility functions:</span>
<span class="comment">;;             `<span class="constant important">pos-tip-split-string</span>', `<span class="constant important">pos-tip-string-width-height</span>'</span>
<span class="comment">;;         * Bug fixes</span>
<span class="comment">;;         * Version 0.1.0</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-08  S. Irie</span>
<span class="comment">;;         * Added optional argument DX</span>
<span class="comment">;;         * Version 0.0.4</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-08  S. Irie</span>
<span class="comment">;;         * Bug fix</span>
<span class="comment">;;         * Version 0.0.3</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-08  S. Irie</span>
<span class="comment">;;         * Modified to move out mouse pointer</span>
<span class="comment">;;         * Version 0.0.2</span>
<span class="comment">;;</span>
<span class="comment">;; 2010-03-07  S. Irie</span>
<span class="comment">;;         * First release</span>
<span class="comment">;;         * Version 0.0.1</span>

<span class="comment">;; ToDo:</span>

<span class="comment">;;; Code:</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;; Settings</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(<span class="keyword">defvar</span> <span class="variable">pos-tip-border-width</span> 1
  <span class="string">"Outer border width of pos-tip's tooltip."</span>)

(<span class="keyword">defvar</span> <span class="variable">pos-tip-internal-border-width</span> 2
  <span class="string">"Text margin of pos-tip's tooltip."</span>)

(<span class="keyword">defvar</span> <span class="variable">pos-tip-foreground-color</span> <span class="string">"black"</span>
  <span class="string">"Default foreground color of pos-tip's tooltip."</span>)

(<span class="keyword">defvar</span> <span class="variable">pos-tip-background-color</span> <span class="string">"lightyellow"</span>
  <span class="string">"Default background color of pos-tip's tooltip."</span>)

(<span class="keyword">defvar</span> <span class="variable">pos-tip-tab-width</span> nil
  <span class="string">"Tab width used for `<span class="constant important">pos-tip-split-string</span>' and `<span class="constant important">pos-tip-fill-string</span>'
to expand tab characters. nil means use default value of `<span class="constant important">tab-width</span>'."</span>)

(<span class="keyword">defvar</span> <span class="variable">pos-tip-use-relative-coordinates</span> nil
  <span class="string">"Non-nil means tooltip location is calculated as a coordinates
relative to the top left corner of frame. In this case the tooltip
will always be displayed within the frame.

Note that this variable is automatically set to non-nil if absolute
coordinates can't be obtained by `<span class="constant important">pos-tip-compute-pixel-position</span>'."</span>)

<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="comment">;; Functions</span>
<span class="comment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

(<span class="keyword">defun</span> <span class="function">pos-tip-window-system</span> (<span class="type">&amp;optional</span> frame)
  <span class="string">"The name of the window system that FRAME is displaying through.
The value is a symbol---for instance, 'x' for X windows.
The value is nil if Emacs is using a text-only terminal.

FRAME defaults to the currently selected frame."</span>
  (<span class="keyword elisp">let</span> ((type (framep (or frame (selected-frame)))))
    (<span class="keyword elisp">if</span> type
	(and (not (eq type t))
	     type)
      (<span class="warning">signal</span> 'wrong-type-argument (list 'framep frame)))))

(<span class="keyword">defun</span> <span class="function">pos-tip-normalize-natnum</span> (object <span class="type">&amp;optional</span> n)
  <span class="string">"Return a Nth power of 2 if OBJECT is a positive integer.
Otherwise return 0. Omitting N means return 1 for a positive integer."</span>
  (ash (<span class="keyword elisp">if</span> (and (natnump object) (&gt; object 0)) 1 0)
       (or n 0)))

(<span class="keyword">defvar</span> <span class="variable">pos-tip-saved-frame-coordinates</span> '(0 . 0)
  <span class="string">"The latest result of `<span class="constant important">pos-tip-frame-top-left-coordinates</span>'."</span>)

(<span class="keyword">defvar</span> <span class="variable">pos-tip-frame-offset</span> nil
  <span class="string">"The latest result of `<span class="constant important">pos-tip-calibrate-frame-offset</span>'. This value
is used for non-X graphical environment."</span>)

(<span class="keyword">defvar</span> <span class="variable">pos-tip-frame-offset-array</span> [nil nil nil nil]
  <span class="string">"Array of the results of `<span class="constant important">pos-tip-calibrate-frame-offset</span>'. They are
recorded only when `<span class="constant important">pos-tip-frame-top-left-coordinates</span>' is called for a
non-X but graphical frame.

The 2nd and 4th elements are the values for frames having a menu bar.
The 3rd and 4th elements are the values for frames having a tool bar."</span>)

(<span class="keyword">defun</span> <span class="function">pos-tip-frame-top-left-coordinates</span> (<span class="type">&amp;optional</span> frame)
  <span class="string">"Return the pixel coordinates of FRAME as a cons cell (LEFT . TOP),
which are relative to top left corner of screen.

Return nil if failing to acquire the coordinates.

If FRAME is omitted, use selected-frame.

Users can also get the frame coordinates by referring the variable
`<span class="constant important">pos-tip-saved-frame-coordinates</span>' just after calling this function."</span>
  (<span class="keyword elisp">let</span> ((winsys (pos-tip-window-system frame)))
    (<span class="keyword elisp">cond</span>
     ((null winsys)
      (<span class="warning">error</span> <span class="string">"text-only frame: %S"</span> frame))
     ((eq winsys 'x)
      (<span class="keyword elisp">condition-case</span> nil
	  (<span class="keyword elisp">with-current-buffer</span> (get-buffer-create <span class="string">" *xwininfo*"</span>)
	    (<span class="keyword elisp">let</span> ((<span class="keyword cl">case</span>-fold-search nil))
	      (buffer-disable-undo)
	      (erase-buffer)
	      (call-process shell-file-name nil t nil shell-command-switch
			    (format <span class="string">"xwininfo -display %s -id %s"</span>
				    (frame-parameter frame 'display)
				    (frame-parameter frame 'window-id)))
	      (goto-char (point-min))
	      (search-forward <span class="string">"\n  Absolute"</span>)
	      (setq pos-tip-saved-frame-coordinates
		    (cons (string-to-number (buffer-substring-no-properties
					     (search-forward <span class="string">"X: "</span>)
					     (line-end-position)))
			  (string-to-number (buffer-substring-no-properties
					     (search-forward <span class="string">"Y: "</span>)
					     (line-end-position)))))))
	(<span class="warning">error</span> nil)))
     (t
      (<span class="keyword elisp">let</span>* ((index (+ (pos-tip-normalize-natnum
			(frame-parameter frame 'menu-bar-lines) 0)
		       (pos-tip-normalize-natnum
			(frame-parameter frame 'tool-bar-lines) 1)))
	     (offset (or (aref pos-tip-frame-offset-array index)
			 (aset pos-tip-frame-offset-array index
			       (pos-tip-calibrate-frame-offset frame)))))
	(<span class="keyword elisp">if</span> offset
	    (setq pos-tip-saved-frame-coordinates
		  (cons (+ (eval (frame-parameter frame 'left))
			   (car offset))
			(+ (eval (frame-parameter frame 'top))
			   (cdr offset))))))))))

(<span class="keyword">defun</span> <span class="function">pos-tip-frame-relative-position</span>
  (frame1 frame2 <span class="type">&amp;optional</span> w32-frame frame-coord1 frame-coord2)
  <span class="string">"Return the pixel coordinates of FRAME1 relative to FRAME2
as a cons cell (LEFT . TOP).

W32-FRAME non-nil means both of frames are under `w32' window system.

FRAME-COORD1 and FRAME-COORD2, if given, specify the absolute
coordinates of FRAME1 and FRAME2, respectively, which make the
calculations faster if the frames have different heights of menu bars
and tool bars."</span>
  (<span class="keyword elisp">if</span> (and (eq (pos-tip-normalize-natnum
		(frame-parameter frame1 'menu-bar-lines))
	       (pos-tip-normalize-natnum
		(frame-parameter frame2 'menu-bar-lines)))
	   (or w32-frame
	       (eq (pos-tip-normalize-natnum
		    (frame-parameter frame1 'tool-bar-lines))
		   (pos-tip-normalize-natnum
		    (frame-parameter frame2 'tool-bar-lines)))))
      (cons (- (eval (frame-parameter frame1 'left))
	       (eval (frame-parameter frame2 'left)))
	    (- (eval (frame-parameter frame1 'top))
	       (eval (frame-parameter frame2 'top))))
    (<span class="keyword cl">unless</span> frame-coord1
      (setq frame-coord1 (<span class="keyword elisp">let</span> (pos-tip-saved-frame-coordinates)
			   (pos-tip-frame-top-left-coordinates frame1))))
    (<span class="keyword cl">unless</span> frame-coord2
      (setq frame-coord2 (<span class="keyword elisp">let</span> (pos-tip-saved-frame-coordinates)
			   (pos-tip-frame-top-left-coordinates frame2))))
    (cons (- (car frame-coord1) (car frame-coord2))
	  (- (cdr frame-coord1) (cdr frame-coord2)))))

(<span class="keyword">defvar</span> <span class="variable">pos-tip-upperside-p</span> nil
  <span class="string">"Non-nil indicates the latest result of `<span class="constant important">pos-tip-compute-pixel-position</span>'
was upper than the location specified by the arguments."</span>)

(<span class="keyword">defvar</span> <span class="variable">pos-tip-w</span>32-saved-max-width-height nil
  <span class="string">"Display pixel size effective for showing tooltip in MS-Windows desktop.
This doesn't include the taskbar area, so isn't same as actual display size."</span>)

(<span class="keyword">defun</span> <span class="function">pos-tip-compute-pixel-position</span>
  (<span class="type">&amp;optional</span> pos window pixel-width pixel-height frame-coordinates dx dy)
  <span class="string">"Return pixel position of POS in WINDOW like (X . Y), which indicates
the absolute or relative coordinates of bottom left corner of the object.

Omitting POS and WINDOW means use current position and selected window,
respectively.

If PIXEL-WIDTH and PIXEL-HEIGHT are given, this function assumes these
values as the size of small window like tooltip which is located around the
object at POS. These values are used to adjust the location in order that
the tooltip won't disappear by sticking out of the display. By referring
the variable `<span class="constant important">pos-tip-upperside-p</span>' after calling this function, user can
examine whether the tooltip will be located above the specified position.

If FRAME-COORDINATES is omitted or nil, automatically obtain the absolute
coordinates of the top left corner of frame which WINDOW is on. Here,
`top left corner of frame' represents the origin of `<span class="constant important">window-pixel-edges</span>'
and its coordinates are essential for calculating the return value as
absolute coordinates. If a cons cell like (LEFT . TOP), specifies the
frame absolute location and makes the calculation slightly faster, but can
be used only when it's clear that frame is in the specified position. Users
can get the latest values of frame coordinates for using in the next call
by referring the variable `<span class="constant important">pos-tip-saved-frame-coordinates</span>' just after
calling this function. Otherwise, FRAME-COORDINATES `<span class="constant important">relative</span>' means return
pixel coordinates of the object relative to the top left corner of the frame.
This is the same effect as `<span class="constant important">pos-tip-use-relative-coordinates</span>' is non-nil.

DX specifies horizontal offset in pixel.

DY specifies vertical offset in pixel. This makes the calculations done
without considering the height of object at POS, so the object might be
hidden by the tooltip."</span>
  (<span class="keyword elisp">let</span>* ((frame (window-frame (or window (selected-window))))
	 (w32-frame (eq (pos-tip-window-system frame) 'w32))
	 (relative (or pos-tip-use-relative-coordinates
		       (eq frame-coordinates 'relative)
		       (and w32-frame
			    (null pos-tip-w32-saved-max-width-height))))
	 (frame-coord (or (and relative '(0 . 0))
			  frame-coordinates
			  (pos-tip-frame-top-left-coordinates frame)
			  (<span class="keyword elisp">progn</span>
			    (setq relative t
				  pos-tip-use-relative-coordinates t)
			  '(0 . 0))))
	 (posn (posn-at-point (or pos (window-point window)) window))
	 (line (cdr (posn-actual-col-row posn)))
	 (line-height (and line
			   (or (window-line-height line window)
			       (and (redisplay t)
				    (window-line-height line window)))))
	 (x-y (or (posn-x-y posn)
		  (<span class="keyword elisp">let</span> ((geom (pos-visible-in-window-p
			       (or pos (window-point window)) window t)))
		    (and geom (cons (car geom) (cadr geom))))
		  '(0 . 0)))
	 (x (+ (car frame-coord)
	       (car (window-inside-pixel-edges window))
	       (car x-y)
	       (or dx 0)))
	 (y0 (+ (cdr frame-coord)
		(cadr (window-pixel-edges window))
		(or (nth 2 line-height) (cdr x-y))))
	 (y (+ y0
	       (or dy
		   (car line-height)
		   (<span class="keyword elisp">with-current-buffer</span> (window-buffer window)
		     (<span class="keyword elisp">cond</span>
		      <span class="comment">;; `<span class="constant important">posn-object-width-height</span>' returns an incorrect value</span>
		      <span class="comment">;; when the header line is displayed (Emacs bug #4426).</span>
		      ((and posn
			    (null header-line-format))
		       (cdr (posn-object-width-height posn)))
		      ((and (bound-and-true-p text-scale-mode)
			    (not (zerop (<span class="keyword elisp">with-no-warnings</span>
					  text-scale-mode-amount))))
		       (round (* (frame-char-height frame)
				 (<span class="keyword elisp">with-no-warnings</span>
				   (expt text-scale-mode-step
					 text-scale-mode-amount)))))
		      (t
		       (frame-char-height frame)))))))
	 xmax ymax)
    (<span class="keyword elisp">cond</span>
     (relative
      (setq xmax (frame-pixel-width frame)
	    ymax (frame-pixel-height frame)))
     (w32-frame
      (setq xmax (car pos-tip-w32-saved-max-width-height)
	    ymax (cdr pos-tip-w32-saved-max-width-height)))
     (t
      (setq xmax (x-display-pixel-width frame)
	    ymax (x-display-pixel-height frame))))
    (setq pos-tip-upperside-p (&gt; (+ y (or pixel-height 0))
				 ymax))
    (cons (max 0 (min x (- xmax (or pixel-width 0))))
	  (max 0 (<span class="keyword elisp">if</span> pos-tip-upperside-p
		     (- (<span class="keyword elisp">if</span> dy ymax y0) (or pixel-height 0))
		   y)))))

(<span class="keyword">defun</span> <span class="function">pos-tip-cancel-timer</span> ()
  <span class="string">"Cancel timeout of tooltip."</span>
  (mapc (<span class="keyword elisp">lambda</span> (timer)
	  (<span class="keyword elisp">if</span> (eq (aref timer 5) 'x-hide-tip)
	      (cancel-timer timer)))
	timer-list))

(<span class="keyword">defun</span> <span class="function">pos-tip-avoid-mouse</span> (left right top bottom <span class="type">&amp;optional</span> frame)
  <span class="string">"Move out mouse pointer if it is inside region (LEFT RIGHT TOP BOTTOM)
in FRAME. Return new mouse position like (FRAME . (X . Y))."</span>
  (<span class="keyword cl">unless</span> frame
    (setq frame (selected-frame)))
  (<span class="keyword elisp">let</span>* ((mpos (<span class="keyword elisp">with-selected-window</span> (frame-selected-window frame)
		 (mouse-pixel-position)))
	 (mframe (pop mpos))
	 (mx (car mpos))
	 (my (cdr mpos)))
    (<span class="keyword cl">when</span> (and (eq mframe frame)
	       (numberp mx))
      (<span class="keyword elisp">let</span>* ((large-number (+ (frame-pixel-width frame) (frame-pixel-height frame)))
	     (dl (<span class="keyword elisp">if</span> (&gt; left 2)
		     (1+ (- mx left))
		   large-number))
	     (dr (<span class="keyword elisp">if</span> (&lt; (1+ right) (frame-pixel-width frame))
		     (- right mx)
		   large-number))
	     (dt (<span class="keyword elisp">if</span> (&gt; top 2)
		     (1+ (- my top))
		   large-number))
	     (db (<span class="keyword elisp">if</span> (&lt; (1+ bottom) (frame-pixel-height frame))
		     (- bottom my)
		   large-number))
	     (<span class="keyword cl">d</span> (min dl dr dt db)))
	(<span class="keyword cl">when</span> (&gt; d -2)
	  (<span class="keyword elisp">cond</span>
	   ((= d dl)
	    (setq mx (- left 2)))
	   ((= d dr)
	    (setq mx (1+ right)))
	   ((= d dt)
	    (setq my (- top 2)))
	   (t
	    (setq my (1+ bottom))))
	  (set-mouse-pixel-position frame mx my)
	  (sit-for 0.0001))))
    (cons mframe (and mpos (cons mx my)))))

(<span class="keyword">defun</span> <span class="function">pos-tip-show-no-propertize</span>
  (string <span class="type">&amp;optional</span> tip-color pos window timeout pixel-width pixel-height frame-coordinates dx dy)
  <span class="string">"Show STRING in a tooltip at POS in WINDOW.
Analogous to `<span class="constant important">pos-tip-show</span>' except don't propertize STRING by `<span class="constant important">pos-tip</span>' face.

PIXEL-WIDTH and PIXEL-HEIGHT specify the size of tooltip, if given. These
are used to adjust the tooltip position in order that it doesn't disappear by
sticking out of the display, and also used to prevent it from vanishing by
overlapping with mouse pointer.

Note that this function itself doesn't calculate tooltip size because the
character width and height specified by faces are unknown. So users should
calculate PIXEL-WIDTH and PIXEL-HEIGHT by using `<span class="constant important">pos-tip-tooltip-width</span>' and
`<span class="constant important">pos-tip-tooltip-height</span>', or use `<span class="constant important">pos-tip-show</span>' instead, which can
automatically calculate tooltip size.

See `<span class="constant important">pos-tip-show</span>' for details.

Example:

\(<span class="keyword">defface</span> <span class="variable">my-tooltip</span>
  '((t
     <span class="builtin">:background</span> \"gray85\"
     <span class="builtin">:foreground</span> \"black\"
     <span class="builtin">:inherit</span> variable-pitch))
  \"Face for my tooltip.\")

\(<span class="keyword">defface</span> <span class="variable">my-tooltip-highlight</span>
  '((t
     <span class="builtin">:background</span> \"blue\"
     <span class="builtin">:foreground</span> \"white\"
     <span class="builtin">:inherit</span> my-tooltip))
  \"Face for my tooltip highlighted.\")

\(<span class="keyword elisp">let</span> ((str (propertize \" foo \\n bar \\n baz \" 'face 'my-tooltip)))
  (put-text-property 6 11 'face 'my-tooltip-highlight str)
  (pos-tip-show-no-propertize str 'my-tooltip))"</span>
  (<span class="keyword cl">unless</span> window
    (setq window (selected-window)))
  (<span class="keyword elisp">let</span>* ((frame (window-frame window))
	 (winsys (pos-tip-window-system frame))
	 (x-frame (eq winsys 'x))
	 (w32-frame (eq winsys 'w32))
	 (relative (or pos-tip-use-relative-coordinates
		       (eq frame-coordinates 'relative)
		       (and w32-frame
			    (null pos-tip-w32-saved-max-width-height))))
	 (x-y (<span class="keyword elisp">prog1</span>
		  (pos-tip-compute-pixel-position pos window
						  pixel-width pixel-height
						  frame-coordinates dx dy)
		(<span class="keyword elisp">if</span> pos-tip-use-relative-coordinates
		    (setq relative t))))
	 (ax (car x-y))
	 (ay (cdr x-y))
	 (rx (<span class="keyword elisp">if</span> relative ax (- ax (car pos-tip-saved-frame-coordinates))))
	 (ry (<span class="keyword elisp">if</span> relative ay (- ay (cdr pos-tip-saved-frame-coordinates))))
	 (retval (cons rx ry))
	 (fg (or (and (facep tip-color)
		      (face-attribute tip-color <span class="builtin">:foreground</span>))
		 (car-safe tip-color)
		 pos-tip-foreground-color))
	 (bg (or (and (facep tip-color)
		      (face-attribute tip-color <span class="builtin">:background</span>))
		 (cdr-safe tip-color)
		 pos-tip-background-color))
	 (use-dxdy (or relative
		       (not x-frame)))
	 (spacing (frame-parameter frame 'line-spacing))
	 (border (ash (+ pos-tip-border-width
			 pos-tip-internal-border-width)
		      1))
	 (x-max-tooltip-size
	  (cons (+ (<span class="keyword elisp">if</span> x-frame 1 0)
		   (/ (- (or pixel-width
			     (<span class="keyword elisp">cond</span>
			      (relative
			       (frame-pixel-width frame))
			      (w32-frame
			       (car pos-tip-w32-saved-max-width-height))
			      (t
			       (x-display-pixel-width frame))))
			 border)
		      (frame-char-width frame)))
		(/ (- (or pixel-height
			  (x-display-pixel-height frame))
		      border)
		   (frame-char-height frame))))
	 (mpos (<span class="keyword elisp">with-selected-window</span> window (mouse-pixel-position)))
	 (mframe (car mpos))
	 default-frame-alist)
    (<span class="keyword elisp">if</span> (or relative
	    (and use-dxdy
		 (null (cadr mpos))))
	(<span class="keyword cl">unless</span> (and (cadr mpos)
		     (eq mframe frame))
	  (<span class="keyword elisp">let</span>* ((edges (window-inside-pixel-edges (cadr (window-list frame))))
		 (mx (ash (+ (pop edges) (cadr edges)) -1))
		 (my (ash (+ (pop edges) (cadr edges)) -1)))
	    (setq mframe frame)
	    (set-mouse-pixel-position mframe mx my)
	    (sit-for 0.0001)))
      (<span class="keyword cl">when</span> (and (cadr mpos)
		 (not (eq mframe frame)))
	(<span class="keyword elisp">let</span> ((rel-coord (pos-tip-frame-relative-position frame mframe w32-frame
							  frame-coordinates)))
	  (setq rx (+ rx (car rel-coord))
		ry (+ ry (cdr rel-coord))))))
    (and pixel-width pixel-height
	 (setq mpos (pos-tip-avoid-mouse rx (+ rx pixel-width
					       (<span class="keyword elisp">if</span> w32-frame 3 0))
					 ry (+ ry pixel-height)
					 mframe)))
    (x-show-tip string mframe
		`((border-width . ,pos-tip-border-width)
		  (internal-border-width . ,pos-tip-internal-border-width)
		  ,@(and (not use-dxdy) `((left . ,ax)
					  (top . ,ay)))
		  (font . ,(frame-parameter frame 'font))
		  ,@(and spacing `((line-spacing . ,spacing)))
		  ,@(and (stringp fg) `((foreground-color . ,fg)))
		  ,@(and (stringp bg) `((background-color . ,bg))))
		(and timeout (&gt; timeout 0) timeout)
		(and use-dxdy (- rx (cadr mpos)))
		(and use-dxdy (- ry (cddr mpos))))
    (<span class="keyword elisp">if</span> (and timeout (&lt;= timeout 0))
	(pos-tip-cancel-timer))
    retval))

(<span class="keyword">defun</span> <span class="function">pos-tip-split-string</span> (string <span class="type">&amp;optional</span> width margin justify squeeze max-rows)
  <span class="string">"Split STRING into fixed width strings. Return a list of these strings.

WIDTH specifies the width of filling each paragraph. WIDTH nil means use
the width of currently selected frame. Note that this function doesn't add any
padding characters at the end of each row.

MARGIN, if non-nil, specifies left margin width which is the number of spece
characters to add at the beginning of each row.

The optional fourth argument JUSTIFY specifies which kind of justification
to do: `<span class="constant important">full</span>', `<span class="constant important">left</span>', `<span class="constant important">right</span>', `<span class="constant important">center</span>', or `<span class="constant important">none</span>'. A value of t means handle
each paragraph as specified by its text properties. Omitting JUSTIFY means
don't perform justification, word wrap and kinsoku shori (禁則処理).

SQUEEZE nil means leave whitespaces other than line breaks untouched.

MAX-ROWS, if given, specifies maximum number of elements of return value.
The elements exceeding this number are discarded."</span>
  (<span class="keyword elisp">with-temp-buffer</span>
    (<span class="keyword elisp">let</span>* ((tab-width (or pos-tip-tab-width tab-width))
	   (fill-column (or width (frame-width)))
	   (left-margin (or margin 0))
	   (kinsoku-limit 1)
	   indent-tabs-mode
	   row rows)
      (insert string)
      (untabify (point-min) (point-max))
      (<span class="keyword elisp">if</span> justify
	  (fill-region (point-min) (point-max) justify (not squeeze))
	(setq margin (make-string left-margin ?\s)))
      (goto-char (point-min))
      (<span class="keyword elisp">while</span> (<span class="keyword elisp">prog2</span>
		 (<span class="keyword elisp">let</span> ((line (buffer-substring
			      (point) (<span class="keyword elisp">progn</span> (end-of-line) (point)))))
		   (<span class="keyword elisp">if</span> justify
		       (push line rows)
		     (<span class="keyword elisp">while</span> (<span class="keyword elisp">progn</span>
			      (setq line (concat margin line)
				    row (truncate-string-to-width line fill-column))
			      (push row rows)
			      (<span class="keyword elisp">if</span> (not (= (length row) (length line)))
				  (setq line (substring line (length row))))))))
		 (&lt; (point) (point-max))
	       (beginning-of-line 2)))
      (nreverse (<span class="keyword elisp">if</span> max-rows
		    (last rows max-rows)
		  rows)))))

(<span class="keyword">defun</span> <span class="function">pos-tip-fill-string</span> (string <span class="type">&amp;optional</span> width margin justify squeeze max-rows)
  <span class="string">"Fill each of the paragraphs in STRING.

WIDTH specifies the width of filling each paragraph. WIDTH nil means use
the width of currently selected frame. Note that this function doesn't add any
padding characters at the end of each row.

MARGIN, if non-nil, specifies left margin width which is the number of spece
characters to add at the beginning of each row.

The optional fourth argument JUSTIFY specifies which kind of justification
to do: `<span class="constant important">full</span>', `<span class="constant important">left</span>', `<span class="constant important">right</span>', `<span class="constant important">center</span>', or `<span class="constant important">none</span>'. A value of t means handle
each paragraph as specified by its text properties. Omitting JUSTIFY means
don't perform justification, word wrap and kinsoku shori (禁則処理).

SQUEEZE nil means leave whitespaces other than line breaks untouched.

MAX-ROWS, if given, specifies maximum number of rows. The rows exceeding
this number are discarded."</span>
  (<span class="keyword elisp">if</span> justify
      (<span class="keyword elisp">with-temp-buffer</span>
	(<span class="keyword elisp">let</span>* ((tab-width (or pos-tip-tab-width tab-width))
	       (fill-column (or width (frame-width)))
	       (left-margin (or margin 0))
	       (kinsoku-limit 1)
	       indent-tabs-mode)
	  (insert string)
	  (untabify (point-min) (point-max))
	  (fill-region (point-min) (point-max) justify (not squeeze))
	  (<span class="keyword elisp">if</span> max-rows
	      (buffer-substring (goto-char (point-min))
				(line-end-position max-rows))
	    (buffer-string))))
    (mapconcat 'identity
	       (pos-tip-split-string string width margin nil nil max-rows)
	       <span class="string">"\n"</span>)))

(<span class="keyword">defun</span> <span class="function">pos-tip-truncate-string</span> (string width height)
  <span class="string">"Truncate each line of STRING to WIDTH and discard lines exceeding HEIGHT."</span>
  (<span class="keyword elisp">with-temp-buffer</span>
    (insert string)
    (goto-char (point-min))
    (<span class="keyword elisp">let</span> ((nrow 0)
	  rows)
      (<span class="keyword elisp">while</span> (and (&lt; nrow height)
		  (<span class="keyword elisp">prog2</span>
		      (push (truncate-string-to-width
			     (buffer-substring (point) (<span class="keyword elisp">progn</span> (end-of-line) (point)))
			     width)
			    rows)
		      (&lt; (point) (point-max))
		    (beginning-of-line 2)
		    (setq nrow (1+ nrow)))))
      (mapconcat 'identity (nreverse rows) <span class="string">"\n"</span>))))

(<span class="keyword">defun</span> <span class="function">pos-tip-string-width-height</span> (string)
  <span class="string">"Count columns and rows of STRING. Return a cons cell like (WIDTH . HEIGHT).
The last empty line of STRING is ignored.

Example:

\(pos-tip-string-width-height \"abc\\nあいう\\n123\")
<span class="comment">;; =&gt; (6 . 3)"</span></span>
  (<span class="keyword elisp">with-temp-buffer</span>
    (insert string)
    (goto-char (point-min))
    (end-of-line)
    (<span class="keyword elisp">let</span> ((width (current-column))
	  (height (<span class="keyword elisp">if</span> (eq (char-before (point-max)) ?\n) 0 1)))
      (<span class="keyword elisp">while</span> (&lt; (point) (point-max))
	(end-of-line 2)
	(setq width (max (current-column) width)
	      height (1+ height)))
      (cons width height))))

(<span class="keyword">defun</span> <span class="function">pos-tip-x-display-width</span> (<span class="type">&amp;optional</span> frame)
  <span class="string">"Return maximum column number in tooltip which occupies the full width
of display. Omitting FRAME means use display that selected frame is in."</span>
  (1+ (/ (x-display-pixel-width frame) (frame-char-width frame))))

(<span class="keyword">defun</span> <span class="function">pos-tip-x-display-height</span> (<span class="type">&amp;optional</span> frame)
  <span class="string">"Return maximum row number in tooltip which occupies the full height
of display. Omitting FRAME means use display that selected frame is in."</span>
  (1+ (/ (x-display-pixel-height frame) (frame-char-height frame))))

(<span class="keyword">defun</span> <span class="function">pos-tip-tooltip-width</span> (width char-width)
  <span class="string">"Calculate tooltip pixel width."</span>
  (+ (* width char-width)
     (ash (+ pos-tip-border-width
	     pos-tip-internal-border-width)
	  1)))

(<span class="keyword">defun</span> <span class="function">pos-tip-tooltip-height</span> (height char-height <span class="type">&amp;optional</span> frame)
  <span class="string">"Calculate tooltip pixel height."</span>
  (<span class="keyword elisp">let</span> ((spacing (or (default-value 'line-spacing)
		     (frame-parameter frame 'line-spacing))))
    (+ (* height (+ char-height
		    (<span class="keyword elisp">cond</span>
		     ((integerp spacing)
		      spacing)
		     ((floatp spacing)
		      (truncate (* (frame-char-height frame)
				   spacing)))
		     (t 0))))
       (ash (+ pos-tip-border-width
	       pos-tip-internal-border-width)
	    1))))

(make-face 'pos-tip-temp)

(<span class="keyword">defun</span> <span class="function">pos-tip-show</span>
  (string <span class="type">&amp;optional</span> tip-color pos window timeout width frame-coordinates dx dy)
  <span class="string">"Show STRING in a tooltip, which is a small X window, at POS in WINDOW
using frame's default font with TIP-COLOR.

Return pixel position of tooltip relative to top left corner of frame as
a cons cell like (X . Y).

TIP-COLOR is a face or a cons cell like (FOREGROUND-COLOR . BACKGROUND-COLOR)
used to specify *only* foreground-color and background-color of tooltip.
If omitted, use `<span class="constant important">pos-tip-foreground-color</span>' and `<span class="constant important">pos-tip-background-color</span>'
instead.

Omitting POS and WINDOW means use current position and selected window,
respectively.

Automatically hide the tooltip after TIMEOUT seconds. Omitting TIMEOUT means
use the default timeout of 5 seconds. Non-positive TIMEOUT means don't hide
tooltip automatically.

WIDTH, if non-nil, specifies the width of filling each paragraph.

If FRAME-COORDINATES is omitted or nil, automatically obtain the absolute
coordinates of the top left corner of frame which WINDOW is on. Here,
`top left corner of frame' represents the origin of `<span class="constant important">window-pixel-edges</span>'
and its coordinates are essential for calculating the absolute coordinates
of the tooltip. If a cons cell like (LEFT . TOP), specifies the frame
absolute location and makes the calculation slightly faster, but can be
used only when it's clear that frame is in the specified position. Users
can get the latest values of frame coordinates for using in the next call
by referring the variable `<span class="constant important">pos-tip-saved-frame-coordinates</span>' just after
calling this function. Otherwise, FRAME-COORDINATES `<span class="constant important">relative</span>' means use
the pixel coordinates relative to the top left corner of the frame for
displaying the tooltip. This is the same effect as
`<span class="constant important">pos-tip-use-relative-coordinates</span>' is non-nil.

DX specifies horizontal offset in pixel.

DY specifies vertical offset in pixel. This makes the calculations done
without considering the height of object at POS, so the object might be
hidden by the tooltip.

See also `<span class="constant important">pos-tip-show-no-propertize</span>'."</span>
  (<span class="keyword cl">unless</span> window
    (setq window (selected-window)))
  (<span class="keyword elisp">let</span>* ((frame (window-frame window))
	 (max-width (pos-tip-x-display-width frame))
	 (max-height (pos-tip-x-display-height frame))
	 (w-h (pos-tip-string-width-height string)))
    (<span class="keyword elisp">cond</span>
     ((and width
	   (&gt; (car w-h) width))
      (setq string (pos-tip-fill-string string width nil 'none nil max-height)
	    w-h (pos-tip-string-width-height string)))
     ((or (&gt; (car w-h) max-width)
	  (&gt; (cdr w-h) max-height))
      (setq string (pos-tip-truncate-string string max-width max-height)
	    w-h (pos-tip-string-width-height string))))
    (face-spec-reset-face 'pos-tip-temp)
    (<span class="keyword elisp">with-selected-window</span> window
      (set-face-font 'pos-tip-temp (frame-parameter frame 'font)))
    (pos-tip-show-no-propertize
     (propertize string 'face 'pos-tip-temp)
     tip-color pos window timeout
     (pos-tip-tooltip-width (car w-h) (frame-char-width frame))
     (pos-tip-tooltip-height (cdr w-h) (frame-char-height frame) frame)
     frame-coordinates dx dy)))

(<span class="keyword">defalias</span> '<span class="function">pos-tip-hide</span> 'x-hide-tip
  <span class="string">"Hide pos-tip's tooltip."</span>)

(<span class="keyword">defun</span> <span class="function">pos-tip-calibrate-frame-offset</span> (<span class="type">&amp;optional</span> frame)
  <span class="string">"Return coordinates of FRAME orign relative to the top left corner of
the FRAME extent, like (LEFT . TOP). The return value is recorded to
`<span class="constant important">pos-tip-frame-offset</span>'.

Note that this function does't correctly work for X frame and Emacs 22."</span>
  (setq pos-tip-frame-offset nil)
  (<span class="keyword elisp">let</span>* ((window (frame-first-window frame))
	 (delete-frame-functions
	  '((<span class="keyword elisp">lambda</span> (frame)
	      (<span class="keyword elisp">if</span> (equal (frame-parameter frame 'name) <span class="string">"tooltip"</span>)
		  (setq pos-tip-frame-offset
			(cons (eval (frame-parameter frame 'left))
			      (eval (frame-parameter frame 'top))))))))
	 (pos-tip-border-width 0)
	 (pos-tip-internal-border-width 1)
	 (rpos (pos-tip-show <span class="string">""</span>
			     '(nil . (frame-parameter frame 'background-color))
			     (window-start window) window
			     nil nil 'relative nil 0)))
    (sit-for 0)
    (pos-tip-hide)
    (and pos-tip-frame-offset
	 (setq pos-tip-frame-offset
	       (cons (- (car pos-tip-frame-offset)
			(car rpos)
			(eval (frame-parameter frame 'left)))
		     (- (cdr pos-tip-frame-offset)
			(cdr rpos)
			(eval (frame-parameter frame 'top))))))))

(<span class="keyword">defun</span> <span class="function">pos-tip-w</span>32-max-width-height (<span class="type">&amp;optional</span> keep-maximize)
  <span class="string">"Maximize the currently selected frame temporarily and set
`pos-tip-w32-saved-max-width-height' the effective display size in order
to become possible to calculate the absolute location of tooltip.

KEEP-MAXIMIZE non-nil means leave the frame maximized.

Note that this function is usable only in Emacs 23 for MS-Windows."</span>
  (interactive)
  (<span class="keyword cl">unless</span> (eq window-system 'w32)
    (<span class="warning">error</span> <span class="string">"`pos-tip-w32-max-width-height' can be used only in w32 frame."</span>))
  <span class="comment">;; Maximize frame</span>
  (<span class="keyword elisp">with-no-warnings</span> (w32-send-sys-command 61488))
  (sit-for 0)
  (<span class="keyword elisp">let</span> ((offset (pos-tip-calibrate-frame-offset)))
    (<span class="keyword elisp">prog1</span>
	(setq pos-tip-w32-saved-max-width-height
	      (cons (frame-pixel-width)
		    (+ (frame-pixel-height)
		       (- (cdr offset) (car offset)))))
      (<span class="keyword elisp">if</span> (interactive-p)
	  (message <span class="string">"%S"</span> pos-tip-w32-saved-max-width-height))
      (<span class="keyword cl">unless</span> keep-maximize
	<span class="comment">;; Restore frame</span>
	(<span class="keyword elisp">with-no-warnings</span> (w32-send-sys-command 61728))))))


(<span class="keyword">provide</span> '<span class="constant">pos-tip</span>)

<span class="comment">;;;</span>
<span class="comment">;;; pos-tip.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="translation bar"><br />  <a rel="nofollow" class="translation new" href="http://www.emacswiki.org/emacs?action=translate;id=pos-tip.el;missing=de_es_fr_it_ja_ko_pt_ru_se_uk_zh">Add Translation</a></span><div class="edit bar"><a href="http://www.emacswiki.org/emacs/Comments_on_pos-tip.el" accesskey="c" class="comment local edit">Обсуждение</a> <a title="Щелкните, чтобы править" href="http://www.emacswiki.org/emacs?action=edit;id=pos-tip.el" class="edit" accesskey="e" rel="nofollow">Редактировать</a> <a rel="nofollow" class="history" href="http://www.emacswiki.org/emacs?action=history;id=pos-tip.el">История</a> <a href="http://www.emacswiki.org/emacs?action=admin;id=pos-tip.el" rel="nofollow" class="admin">Администрирование</a></div><div class="time">Редактировалось последний раз  2014-05-12 06:35 UTC пользователем <a title="dynamic-78-10-122-143.ssp.dialog.net.pl" class="author" href="http://www.emacswiki.org/emacs/ukaszg">ukaszg</a> <a href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=pos-tip.el" class="diff" rel="nofollow">(изменения)</a></div><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
